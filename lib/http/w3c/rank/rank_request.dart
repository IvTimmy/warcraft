import 'package:dio/dio.dart';
import 'package:warcraft/http/http_config.dart';
import 'package:warcraft/http/w3c/rank/rank_response.dart';
import 'package:warcraft/utils/json_format.dart';

class WarcraftRankRequest {
  static const String _url =
      "https://website-backend.w3champions.com/api/ladder/0";
  static const String _key_gate_way = "gateWay";
  static const String _key_game_mode = "gameMode";
  static const String _key_season = "season";

  /// 获取排行榜数组
  Future<List<WarcraftRankResponse>> getRankList(
      {int gateWay = 20, int mode = 1, int season = 15}) async {
    Map<String, String> map = {
      _key_gate_way: gateWay.toString(),
      _key_game_mode: mode.toString(),
      _key_season: season.toString()
    };
    // 通过dio拉取排行榜数据
    Response<String> response = await dio.get(_url, queryParameters: map);
    String json = response.data.toString();
    // Json格式化选手排行榜数据
    return JsonFormatter.formatJsonArray(
        json, (map) => WarcraftRankResponse.fromJson(map));
  }
}
