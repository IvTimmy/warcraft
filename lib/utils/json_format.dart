import 'dart:convert';

typedef JsonParser<T> = T Function(Map<String, dynamic> map);

class JsonFormatter {
  JsonFormatter._();

  static T formatJsonObject<T>(
    String json,
    JsonParser<T> parser,
  ) {
    // 解析单个Json对象
    Map<String, dynamic> map = jsonDecode(json);
    return parser(map);
  }

  static List<T> formatJsonArray<T>(
    String json,
    JsonParser<T> parser,
  ) {
    List array = jsonDecode(json);
    return array.map((e) => parser(e)).toList();
  }
}
