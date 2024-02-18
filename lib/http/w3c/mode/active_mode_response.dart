class WarcraftActiveModeResponse {
  int? id;
  List<Maps>? maps;
  String? name;
  String? type;

  WarcraftActiveModeResponse({this.id, this.maps, this.name, this.type});

  WarcraftActiveModeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['maps'] != null) {
      maps = <Maps>[];
      json['maps'].forEach((v) {
        maps!.add(Maps.fromJson(v));
      });
    }
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (maps != null) {
      data['maps'] = maps!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}

class Maps {
  int? id;
  String? name;
  String? path;

  Maps({this.id, this.name, this.path});

  Maps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['path'] = path;
    return data;
  }
}
