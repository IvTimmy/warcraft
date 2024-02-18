class WarcraftLeagueResponse {
  String? id;
  int? season;
  int? gateway;
  int? gameMode;
  List<Leagues>? leagues;

  WarcraftLeagueResponse(
      {this.id, this.season, this.gateway, this.gameMode, this.leagues});

  WarcraftLeagueResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    season = json['season'];
    gateway = json['gateway'];
    gameMode = json['gameMode'];
    if (json['leagues'] != null) {
      leagues = <Leagues>[];
      json['leagues'].forEach((v) {
        leagues!.add(Leagues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['season'] = season;
    data['gateway'] = gateway;
    data['gameMode'] = gameMode;
    if (leagues != null) {
      data['leagues'] = leagues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leagues {
  int? division;
  int? id;
  String? name;
  int? order;

  Leagues({this.division, this.id, this.name, this.order});

  Leagues.fromJson(Map<String, dynamic> json) {
    division = json['division'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['division'] = division;
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    return data;
  }
}
