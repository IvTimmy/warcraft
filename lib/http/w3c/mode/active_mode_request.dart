import 'package:dio/dio.dart';
import 'package:warcraft/http/http_config.dart';
import 'package:warcraft/http/w3c/mode/active_mode_response.dart';
import 'package:warcraft/utils/json_format.dart';

/// 1V1、2V2模式的请求
class WarcraftActiveModeRequest {
  static const String _url =
      "https://website-backend.w3champions.com/api/ladder/active-modes";

  /// 获取游戏模式的类型以及地图信息
  Future<List<WarcraftActiveModeResponse>> getActiveModes() async {
    Response<String> response = await dio.get(_url);
    String json = response.data.toString();

    return JsonFormatter.formatJsonArray(
        json, (map) => WarcraftActiveModeResponse.fromJson(map));
  }
}