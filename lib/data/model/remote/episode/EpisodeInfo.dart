class EpisodeInfo {
  int? id;
  String? name;
  String? airDate;
  String? episode;
  List<String>? characters;
  String? url;
  String? created;

  EpisodeInfo({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  EpisodeInfo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    airDate = json['air_date'];
    episode = json['episode'];
    characters =
        json['characters'] != null ? json['characters'].cast<String>() : [];
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['air_date'] = airDate;
    map['episode'] = episode;
    map['characters'] = characters;
    map['url'] = url;
    map['created'] = created;
    return map;
  }
}
