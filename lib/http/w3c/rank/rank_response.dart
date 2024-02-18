class WarcraftRankResponse {
  int? gateway;
  String? id;
  int? league;
  int? leagueDivision;
  String? leagueName;
  int? leagueOrder;
  int? rankNumber;
  num? rankingPoints;
  int? race;
  String? playerId;
  String? player1Id;
  String? player2Id;
  Player? player;
  int? gameMode;
  int? season;
  List<PlayersInfo>? playersInfo;

  WarcraftRankResponse(
      {this.gateway,
      this.id,
      this.league,
      this.leagueDivision,
      this.leagueName,
      this.leagueOrder,
      this.rankNumber,
      this.rankingPoints,
      this.race,
      this.playerId,
      this.player1Id,
      this.player2Id,
      this.player,
      this.gameMode,
      this.season,
      this.playersInfo});

  WarcraftRankResponse.fromJson(Map<String, dynamic> json) {
    gateway = json['gateway'];
    id = json['id'];
    league = json['league'];
    leagueDivision = json['leagueDivision'];
    leagueName = json['leagueName'];
    leagueOrder = json['leagueOrder'];
    rankNumber = json['rankNumber'];
    rankingPoints = json['rankingPoints'];
    race = json['race'];
    playerId = json['playerId'];
    player1Id = json['player1Id'];
    player2Id = json['player2Id'];
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    gameMode = json['gameMode'];
    season = json['season'];
    if (json['playersInfo'] != null) {
      playersInfo = <PlayersInfo>[];
      json['playersInfo'].forEach((v) {
        playersInfo!.add(PlayersInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['gateway'] = gateway;
    data['id'] = id;
    data['league'] = league;
    data['leagueDivision'] = leagueDivision;
    data['leagueName'] = leagueName;
    data['leagueOrder'] = leagueOrder;
    data['rankNumber'] = rankNumber;
    data['rankingPoints'] = rankingPoints;
    data['race'] = race;
    data['playerId'] = playerId;
    data['player1Id'] = player1Id;
    data['player2Id'] = player2Id;
    if (player != null) {
      data['player'] = player!.toJson();
    }
    data['gameMode'] = gameMode;
    data['season'] = season;
    if (playersInfo != null) {
      data['playersInfo'] = playersInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Player {
  List<PlayerIds>? playerIds;
  String? name;
  String? id;
  int? mmr;
  int? gateWay;
  int? gameMode;
  int? season;
  int? race;
  int? wins;
  int? losses;
  int? games;
  num? winrate;

  Player(
      {this.playerIds,
      this.name,
      this.id,
      this.mmr,
      this.gateWay,
      this.gameMode,
      this.season,
      this.race,
      this.wins,
      this.losses,
      this.games,
      this.winrate});

  Player.fromJson(Map<String, dynamic> json) {
    if (json['playerIds'] != null) {
      playerIds = <PlayerIds>[];
      json['playerIds'].forEach((v) {
        playerIds!.add(PlayerIds.fromJson(v));
      });
    }
    name = json['name'];
    id = json['id'];
    mmr = json['mmr'];
    gateWay = json['gateWay'];
    gameMode = json['gameMode'];
    season = json['season'];
    race = json['race'];
    wins = json['wins'];
    losses = json['losses'];
    games = json['games'];
    winrate = json['winrate'] * 100;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (playerIds != null) {
      data['playerIds'] = playerIds!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['id'] = id;
    data['mmr'] = mmr;
    data['gateWay'] = gateWay;
    data['gameMode'] = gameMode;
    data['season'] = season;
    data['race'] = race;
    data['wins'] = wins;
    data['losses'] = losses;
    data['games'] = games;
    data['winrate'] = winrate;
    return data;
  }
}

class PlayerIds {
  String? name;
  String? battleTag;

  PlayerIds({this.name, this.battleTag});

  PlayerIds.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    battleTag = json['battleTag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['battleTag'] = battleTag;
    return data;
  }
}

class PlayersInfo {
  String? battleTag;
  int? calculatedRace;
  int? selectedRace;
  int? pictureId;
  bool? isClassicPicture;
  String? country;
  String? countryCode;
  String? location;
  String? twitchName;
  String? clanId;
  PlayerAkaData? playerAkaData;

  PlayersInfo(
      {this.battleTag,
      this.calculatedRace,
      this.selectedRace,
      this.pictureId,
      this.isClassicPicture,
      this.country,
      this.countryCode,
      this.location,
      this.twitchName,
      this.clanId,
      this.playerAkaData});

  PlayersInfo.fromJson(Map<String, dynamic> json) {
    battleTag = json['battleTag'];
    calculatedRace = json['calculatedRace'];
    selectedRace = json['selectedRace'];
    pictureId = json['pictureId'];
    isClassicPicture = json['isClassicPicture'];
    country = json['country'];
    countryCode = json['countryCode'];
    location = json['location'];
    twitchName = json['twitchName'];
    clanId = json['clanId'];
    playerAkaData = json['playerAkaData'] != null
        ? PlayerAkaData.fromJson(json['playerAkaData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['battleTag'] = battleTag;
    data['calculatedRace'] = calculatedRace;
    data['selectedRace'] = selectedRace;
    data['pictureId'] = pictureId;
    data['isClassicPicture'] = isClassicPicture;
    data['country'] = country;
    data['countryCode'] = countryCode;
    data['location'] = location;
    data['twitchName'] = twitchName;
    data['clanId'] = clanId;
    if (playerAkaData != null) {
      data['playerAkaData'] = playerAkaData!.toJson();
    }
    return data;
  }
}

class PlayerAkaData {
  int? id;
  String? name;
  String? mainRace;
  String? country;
  String? liquipedia;

  PlayerAkaData(
      {this.id, this.name, this.mainRace, this.country, this.liquipedia});

  PlayerAkaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mainRace = json['main_race'];
    country = json['country'];
    liquipedia = json['liquipedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['main_race'] = mainRace;
    data['country'] = country;
    data['liquipedia'] = liquipedia;
    return data;
  }
}
