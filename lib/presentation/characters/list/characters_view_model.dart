import 'package:flutter/foundation.dart';
import 'package:rorty_flutter/app/di/injector.dart';
import 'package:rorty_flutter/core/view_state.dart';
import 'package:rorty_flutter/data/model/dto/character/character_dto.dart';
import 'package:rorty_flutter/data/remote/dio/data_state.dart';
import 'package:rorty_flutter/domain/character/get_characters.dart';
import 'package:stacked/stacked.dart';

const charactersBusyKey = 'characters';

class CharactersViewModel extends BaseViewModel {
  final GetCharacters _getCharacters = injector<GetCharacters>();

  ViewState<List<CharacterDto>> viewState =
      ViewState(state: ResponseState.EMPTY);

  final List<CharacterDto> _characters = [];
  int _page = 1;
  static const int _pageSize = 20;
  bool hasMore = true;

  void _setViewState(ViewState<List<CharacterDto>> viewState) {
    this.viewState = viewState;
    setBusyForObject(charactersBusyKey, false);
  }

  void loadData() async {
    await loadMoreCharacters();
  }

  Future<void> loadMoreCharacters() async {
    if (_page == 1) _setViewState(ViewState.loading());

    final characters =
        await _getCharacters.call(params: GetCharactersParams(_page, null));

    if (characters is DataSuccess) {
      final list = characters.data ?? List.empty();
      if (list.isEmpty) {
        hasMore = false;
        setBusyForObject(charactersBusyKey, false);
      } else {
        _characters.addAll(list);
        _page++;
        _setViewState(ViewState.complete(_characters));
      }
    }
    if (characters is DataFailed) {
      if (kDebugMode) {
        print(characters.error);
      }
      _setViewState(ViewState.error(characters.error.toString()));
    }
  }
}