import 'package:rorty_flutter/data/model/dto/episode/episode_dto.dart';

import 'character_location_dto.dart';

class CharacterDto {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final CharacterLocationDto? origin;
  final CharacterLocationDto? location;
  final String? image;
  final List<String>? episodes;
  final String? url;
  final String? created;
  List<EpisodeDto> episodeDtoList = [];

  CharacterDto(
      this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episodes,
      this.url,
      this.created);
}
