import 'package:rorty_flutter/data/model/remote/base/PageInfo.dart';

import 'CharacterInfo.dart';

class CharacterResponse {
  PageInfo? info;
  List<CharacterInfo>? results;

  CharacterResponse({this.info, this.results});

  CharacterResponse.fromJson(dynamic json) {
    info = json['info'] != null ? PageInfo.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(CharacterInfo.fromJson(v));
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
