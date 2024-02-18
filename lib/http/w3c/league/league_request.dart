import 'package:dio/dio.dart';
import 'package:warcraft/http/http_config.dart';
import 'package:warcraft/http/w3c/league/league_response.dart';
import 'package:warcraft/utils/json_format.dart';

/// Warcraft联赛列表
class WarcraftLeagueRequest {
  static const String _url =
      "https://website-backend.w3champions.com/api/ladder/league-constellation";
  static const String _key_season = "season";

  /// 获取Warcraft联赛列表
  Future<List<WarcraftLeagueResponse>> getLeagues(int season) async {
    Map<String, dynamic> params = {_key_season: season};
    Response<String> response = await dio.get(_url, queryParameters: params);
    String json = response.data.toString();
    return JsonFormatter.formatJsonArray(
        json, (map) => WarcraftLeagueResponse.fromJson(map));
  }
}
