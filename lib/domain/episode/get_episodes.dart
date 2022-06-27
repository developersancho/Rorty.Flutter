import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rorty_flutter/core/use_case.dart';
import 'package:rorty_flutter/data/model/dto/episode/episode_dto.dart';
import 'package:rorty_flutter/data/model/dto/episode/episode_dto_extension.dart';
import 'package:rorty_flutter/data/remote/dio/data_state.dart';
import 'package:rorty_flutter/data/remote/dio/dio_exception.dart';
import 'package:rorty_flutter/data/repository/episode_repository.dart';

class GetEpisodes
    implements UseCase<DataState<List<EpisodeDto>>, GetEpisodesParams> {
  final EpisodeRepository _episodeRepository;

  GetEpisodes(this._episodeRepository);

  @override
  Future<DataState<List<EpisodeDto>>> call(
      {required GetEpisodesParams params}) async {
    try {
      final httpResponse = await _episodeRepository.getEpisodes(
        params.page,
        params.options,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.results.toEpisodeDtoList());
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

class GetEpisodesParams {
  final int page;
  final Map<String, String>? options;

  GetEpisodesParams(this.page, this.options);
}
