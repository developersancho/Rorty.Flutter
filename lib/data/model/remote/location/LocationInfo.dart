class LocationInfo {
  int? id;
  String? name;
  String? type;
  String? dimension;
  List<String>? residents;
  String? url;
  String? created;

  LocationInfo({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  });

  LocationInfo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    dimension = json['dimension'];
    residents =
        json['residents'] != null ? json['residents'].cast<String>() : [];
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['dimension'] = dimension;
    map['residents'] = residents;
    map['url'] = url;
    map['created'] = created;
    return map;
  }
}
