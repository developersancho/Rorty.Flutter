import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rorty_flutter/core/use_case.dart';
import 'package:rorty_flutter/data/model/dto/character/character_dto_extension.dart';
import 'package:rorty_flutter/data/model/dto/episode/episode_dto.dart';
import 'package:rorty_flutter/data/model/dto/episode/episode_dto_extension.dart';
import 'package:rorty_flutter/data/remote/dio/data_state.dart';
import 'package:rorty_flutter/data/remote/dio/dio_exception.dart';
import 'package:rorty_flutter/data/repository/character_repository.dart';
import 'package:rorty_flutter/data/repository/episode_repository.dart';

class GetEpisodeDetail
    implements UseCase<DataState<EpisodeDto>, GetEpisodeDetailParams> {
  final CharacterRepository _characterRepository;
  final EpisodeRepository _episodeRepository;

  GetEpisodeDetail(this._characterRepository, this._episodeRepository);

  @override
  Future<DataState<EpisodeDto>> call(
      {required GetEpisodeDetailParams params}) async {
    try {
      final httpResponse = await _episodeRepository.getEpisode(params.id);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        EpisodeDto dto = httpResponse.data.toEpisodeDto();
        if (dto.characters != null && dto.characters!.isNotEmpty) {
          for (var url in dto.characters!) {
            int id = url.getIdFromUrl();
            final character = await _characterRepository.getCharacter(id);
            if (character.response.statusCode == HttpStatus.ok) {
              dto.characterDtoList.add(character.data.toCharacterDto());
            }
          }
        }
        return DataSuccess(dto);
      }
      return DataFailed(httpResponse.response.statusMessage);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      return DataFailed(errorMessage);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e.toString());
    }
  }
}

class GetEpisodeDetailParams {
  final int id;

  GetEpisodeDetailParams(this.id);
}
