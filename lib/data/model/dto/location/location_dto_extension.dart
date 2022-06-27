import 'package:rorty_flutter/data/model/dto/location/location_dto.dart';
import 'package:rorty_flutter/data/model/remote/location/LocationInfo.dart';

extension LocationInfoExtension on LocationInfo {
  LocationDto toLocationDto() {
    return LocationDto(id, name, type, dimension, residents, url, created);
  }
}

extension LocationInfoListExtension on List<LocationInfo>? {
  List<LocationDto> toLocationDtoList() {
    if (this != null || this!.isNotEmpty) {
      return this!.map((e) => e.toLocationDto()).toList();
    }
    return List.empty();
  }
}
