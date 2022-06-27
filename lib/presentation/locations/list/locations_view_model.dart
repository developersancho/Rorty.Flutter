import 'package:flutter/foundation.dart';
import 'package:rorty_flutter/app/di/injector.dart';
import 'package:rorty_flutter/core/view_state.dart';
import 'package:rorty_flutter/data/model/dto/location/location_dto.dart';
import 'package:rorty_flutter/data/remote/dio/data_state.dart';
import 'package:rorty_flutter/domain/location/get_locations.dart';
import 'package:stacked/stacked.dart';

const locationsBusyKey = 'locations';

class LocationsViewModel extends BaseViewModel {
  final GetLocations _getLocations = injector<GetLocations>();

  ViewState<List<LocationDto>> viewState =
      ViewState(state: ResponseState.EMPTY);

  final List<LocationDto> _locations = [];
  int _page = 1;
  bool hasMore = true;

  void _setViewState(ViewState<List<LocationDto>> viewState) {
    this.viewState = viewState;
    setBusyForObject(locationsBusyKey, false);
  }

  void loadData() async {
    await loadMoreLocations();
  }

  Future<void> loadMoreLocations() async {
    if (_page == 1) _setViewState(ViewState.loading());

    final locations =
        await _getLocations.call(params: GetLocationsParams(_page, null));

    if (locations is DataSuccess) {
      final list = locations.data ?? List.empty();
      if (list.isEmpty) {
        hasMore = false;
        setBusyForObject(locationsBusyKey, false);
      } else {
        _locations.addAll(list);
        _page++;
        _setViewState(ViewState.complete(_locations));
      }
    }
    if (locations is DataFailed) {
      if (kDebugMode) {
        print(locations.error);
      }
      _setViewState(ViewState.error(locations.error.toString()));
    }
  }
}
