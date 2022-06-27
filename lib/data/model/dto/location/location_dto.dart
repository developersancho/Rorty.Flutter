import 'package:rorty_flutter/data/model/dto/character/character_dto.dart';

class LocationDto {
  final int? id;
  final String? name;
  final String? type;
  final String? dimension;
  final List<String>? residents;
  final String? url;
  final String? created;
  List<CharacterDto> residentDtoList = [];

  LocationDto(this.id, this.name, this.type, this.dimension, this.residents,
      this.url, this.created);
}
