import 'package:flutter/foundation.dart';
import 'package:rorty_flutter/app/di/injector.dart';
import 'package:rorty_flutter/core/view_state.dart';
import 'package:rorty_flutter/data/model/dto/character/character_dto.dart';
import 'package:rorty_flutter/data/remote/dio/data_state.dart';
import 'package:rorty_flutter/domain/character/get_character_detail.dart';

class CharacterDetailViewModel extends ChangeNotifier {
  final GetCharacterDetail _getCharacterDetail = injector<GetCharacterDetail>();
  ViewState<CharacterDto> viewState = ViewState(state: ResponseState.EMPTY);

  CharacterDto? dto;

  void _setViewState(ViewState<CharacterDto> viewState) {
    this.viewState = viewState;
    notifyListeners();
  }

  Future<void> loadCharacterDetail(int characterId) async {
    _setViewState(ViewState.loading());
    final detail = await _getCharacterDetail.call(
        params: GetCharacterDetailParams(characterId));
    if (detail is DataSuccess) {
      dto = detail.data;
      _setViewState(ViewState.complete(dto!));
    }
    if (detail is DataFailed) {
      if (kDebugMode) {
        print(detail.error);
      }
      _setViewState(ViewState.error(detail.error.toString()));
    }
  }
}
