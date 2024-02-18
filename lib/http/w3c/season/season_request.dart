import 'package:dio/dio.dart';
import 'package:warcraft/http/http_config.dart';
import 'package:warcraft/http/w3c/season/season_response.dart';
import 'package:warcraft/utils/json_format.dart';

class WarcraftSeasonRequest {
  static const String _url =
      "https://website-backend.w3champions.com/api/ladder/seasons";

  /// 获取W3cChampions赛季列表：0～16赛季
  Future<List<WarcraftSeasonResponse>> getSeasonList() async {
    Response<String> response = await dio.get(_url);
    String json = response.data.toString();

    return JsonFormatter.formatJsonArray(
        json, (map) => WarcraftSeasonResponse.fromJson(map));
  }
}
