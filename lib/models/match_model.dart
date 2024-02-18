/// 比赛结果信息
class PlayerInfo {
  final int playerScore;

  final String playerRace;

  final String playerCountry;

  final String playerName;

  PlayerInfo(
    this.playerName,
    this.playerCountry,
    this.playerRace, {
    this.playerScore = 0,
  });
}
