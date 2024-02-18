import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:warcraft/http/war3info/ticker/ticker_request.dart';
import 'package:warcraft/http/war3info/ticker/ticker_response.dart';
import 'package:warcraft/models/match_model.dart';
import 'package:warcraft/ui/page/common/common_page.dart';
import 'package:warcraft/ui/widget/list/list_item_builder.dart';
import 'package:warcraft/ui/widget/list/match/list_item_date.dart';
import 'package:warcraft/ui/widget/list/match/list_item_result.dart';
import 'package:warcraft/utils/date_format.dart';
import 'package:warcraft/warcraft/theme.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<StatefulWidget> createState() => _ResultState();
}

class _ResultState extends State<ResultPage>
    with AutomaticKeepAliveClientMixin<ResultPage> {
  final RefreshController _controller = RefreshController();
  final CommonController _commonController = CommonController();
  List<ListItemBuilder>? _data = [];

  @override
  void initState() {
    super.initState();
    _commonController.startLoading();
    _requestTickers();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CommonPage(
      commonController: _commonController,
      child: Stack(
        children: [
          SmartRefresher(
            controller: _controller,
            enablePullDown: true,
            header: const MaterialClassicHeader(color: ThemeColor.blueColor),
            onRefresh: _requestTickers,
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  _data?[index].buildItem(context, index),
              itemCount: _data?.length,
            ),
          ),
        ],
      ),
    );
  }

  /// 请求数据
  void _requestTickers() async {
    WarcraftTickerResponse matchList =
        await WarcraftTickerRequest().getTicker();
    List<ListItemBuilder>? list = _buildTickerList(matchList);
    setState(() {
      _commonController.stopLoading();
      _data = list;
      _controller.refreshCompleted();
    });
  }

  /// 将Scheduler数据转换成列表数据
  List<ListItemBuilder>? _buildTickerList(WarcraftTickerResponse response) {
    List<ListItemBuilder> result = [];
    // 记录时间
    DateTime? lastTime;
    String? lastTitle;
    // 该页面只处理RESULT数据
    response.results?.forEach((element) {
      String timeFormat = element.date ?? "";
      String title = element.statsEvent?.name ?? "";
      if (timeFormat == "" || title == "") {
        return;
      }
      DateTime time = DateTime.parse(timeFormat);
      if (!DateFormatter.isSameDay(time, lastTime) || title != lastTitle) {
        // 如果不是同一天，或者标题不同，则构建Title
        result.add(DateItem(
            text: "${DateFormatter.buildDay(time, needWeek: false)}  $title"));
        lastTime = time;
        lastTitle = title;
      }
      result.add(_buildItem(element, time));
    });
    return result;
  }

  /// 转换成ListView的Item
  ListItemBuilder _buildItem(Results result, DateTime time) {
    PlayerInfo player1 = PlayerInfo(
      result.player1?.name ?? "",
      result.player1?.country ?? "",
      result.race1 ?? "",
      playerScore: result.score1 ?? 0,
    );
    PlayerInfo player2 = PlayerInfo(
      result.player2?.name ?? "",
      result.player2?.country ?? "",
      result.race2 ?? "",
      playerScore: result.score2 ?? 0,
    );
    return ResultItem(player1, player2, DateFormatter.buildSeconds(time));
  }

  @override
  bool get wantKeepAlive => true;
}
