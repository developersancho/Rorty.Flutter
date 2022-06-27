import 'package:rorty_flutter/data/model/remote/base/PageInfo.dart';
import 'package:rorty_flutter/data/model/remote/episode/EpisodeInfo.dart';

class EpisodeResponse {
  PageInfo? info;
  List<EpisodeInfo>? results;

  EpisodeResponse({this.info, this.results});

  EpisodeResponse.fromJson(dynamic json) {
    info = json['info'] != null ? PageInfo.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(EpisodeInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (info != null) {
      map['info'] = info?.toJson();
    }
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
