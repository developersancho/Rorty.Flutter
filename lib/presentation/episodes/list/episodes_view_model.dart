import 'package:flutter/foundation.dart';
import 'package:rorty_flutter/app/di/injector.dart';
import 'package:rorty_flutter/core/view_state.dart';
import 'package:rorty_flutter/data/model/dto/episode/episode_dto.dart';
import 'package:rorty_flutter/data/remote/dio/data_state.dart';
import 'package:rorty_flutter/domain/episode/get_episodes.dart';
import 'package:stacked/stacked.dart';

const episodesBusyKey = 'episodes';

class EpisodesViewModel extends BaseViewModel {
  final GetEpisodes _getEpisodes = injector<GetEpisodes>();

  ViewState<List<EpisodeDto>> viewState = ViewState(state: ResponseState.EMPTY);

  final List<EpisodeDto> _episodes = [];
  int _page = 1;
  bool hasMore = true;

  void _setViewState(ViewState<List<EpisodeDto>> viewState) {
    this.viewState = viewState;
    setBusyForObject(episodesBusyKey, false);
  }

  void loadData() async {
    await loadMoreEpisodes();
  }

  Future<void> loadMoreEpisodes() async {
    if (_page == 1) _setViewState(ViewState.loading());

    final episodes =
        await _getEpisodes.call(params: GetEpisodesParams(_page, null));

    if (episodes is DataSuccess) {
      final list = episodes.data ?? List.empty();
      if (list.isEmpty) {
        hasMore = false;
        setBusyForObject(episodesBusyKey, false);
      } else {
        _episodes.addAll(list);
        _page++;
        _setViewState(ViewState.complete(_episodes));
      }
    }
    if (episodes is DataFailed) {
      if (kDebugMode) {
        print(episodes.error);
      }
      _setViewState(ViewState.error(episodes.error.toString()));
    }
  }
}
