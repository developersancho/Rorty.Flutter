class PageInfo {
  int? count;
  int? pages;
  String? next;
  String? prev;

  PageInfo({this.count, this.pages, this.next, this.prev});

  PageInfo.fromJson(dynamic json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['pages'] = pages;
    map['next'] = next;
    map['prev'] = prev;
    return map;
  }
}
