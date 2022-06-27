import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rorty_flutter/core/use_case.dart';
import 'package:rorty_flutter/data/model/dto/character/character_dto_extension.dart';
import 'package:rorty_flutter/data/model/dto/location/location_dto.dart';
import 'package:rorty_flutter/data/model/dto/location/location_dto_extension.dart';
import 'package:rorty_flutter/data/remote/dio/data_state.dart';
import 'package:rorty_flutter/data/remote/dio/dio_exception.dart';
import 'package:rorty_flutter/data/repository/character_repository.dart';
import 'package:rorty_flutter/data/repository/location_repository.dart';

class GetLocationDetail
    implements UseCase<DataState<LocationDto>, GetLocationDetailParams> {
  final CharacterRepository _characterRepository;
  final LocationRepository _locationRepository;

  GetLocationDetail(this._characterRepository, this._locationRepository);

  @override
  Future<DataState<LocationDto>> call(
      {required GetLocationDetailParams params}) async {
    try {
      final httpResponse = await _locationRepository.getLocation(params.id);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        LocationDto dto = httpResponse.data.toLocationDto();
        if (dto.residents != null && dto.residents!.isNotEmpty) {
          for (var url in dto.residents!) {
            int id = url.getIdFromUrl();
            final resident = await _characterRepository.getCharacter(id);
            if (resident.response.statusCode == HttpStatus.ok) {
              dto.residentDtoList.add(resident.data.toCharacterDto());
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

class GetLocationDetailParams {
  final int id;

  GetLocationDetailParams(this.id);
}
