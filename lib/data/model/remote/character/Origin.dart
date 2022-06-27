class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }
}
