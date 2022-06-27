import 'package:rorty_flutter/data/model/dto/episode/episode_dto.dart';
import 'package:rorty_flutter/data/model/remote/episode/EpisodeInfo.dart';

extension EpisodeInfoExtension on EpisodeInfo {
  EpisodeDto toEpisodeDto() {
    return EpisodeDto(id, name, url, airDate, created, episode, characters);
  }
}

extension EpisodeInfoListExtension on List<EpisodeInfo>? {
  List<EpisodeDto> toEpisodeDtoList() {
    if (this != null || this!.isNotEmpty) {
      return this!.map((e) => e.toEpisodeDto()).toList();
    }
    return List.empty();
  }
}
