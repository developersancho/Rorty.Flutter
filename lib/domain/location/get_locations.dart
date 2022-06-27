import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rorty_flutter/core/use_case.dart';
import 'package:rorty_flutter/data/model/dto/location/location_dto.dart';
import 'package:rorty_flutter/data/model/dto/location/location_dto_extension.dart';
import 'package:rorty_flutter/data/remote/dio/data_state.dart';
import 'package:rorty_flutter/data/remote/dio/dio_exception.dart';
import 'package:rorty_flutter/data/repository/location_repository.dart';

class GetLocations
    implements UseCase<DataState<List<LocationDto>>, GetLocationsParams> {
  final LocationRepository _locationRepository;

  GetLocations(this._locationRepository);

  @override
  Future<DataState<List<LocationDto>>> call(
      {required GetLocationsParams params}) async {
    try {
      final httpResponse = await _locationRepository.getLocations(
        params.page,
        params.options,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.results.toLocationDtoList());
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

class GetLocationsParams {
  final int page;
  final Map<String, String>? options;

  GetLocationsParams(this.page, this.options);
}
