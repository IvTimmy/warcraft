/// 赛程

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:warcraft/http/war3info/scheduler/scheduler_request.dart';
import 'package:warcraft/http/war3info/scheduler/scheduler_response.dart';
import 'package:warcraft/ui/page/common/common_page.dart';
import 'package:warcraft/ui/widget/list/list_item_builder.dart';
import 'package:warcraft/ui/widget/list/match/list_item_date.dart';
import 'package:warcraft/ui/widget/list/match/list_item_match.dart';
import 'package:warcraft/utils/date_format.dart';
import 'package:warcraft/warcraft/theme.dart';

class SchedulerPage extends StatefulWidget {
  const SchedulerPage({super.key});

  @override
  State<StatefulWidget> createState() => _SchedulerPageState();
}

class _SchedulerPageState extends State<SchedulerPage>
    with AutomaticKeepAliveClientMixin<SchedulerPage> {
  final RefreshController _controller = RefreshController();
  final CommonController _commonController = CommonController();
  List<ListItemBuilder>? _data = [];

  @override
  void initState() {
    super.initState();
    _commonController.startLoading();
    _requestMatch();
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
              onRefresh: _requestMatch,
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    _data?[index].buildItem(context, index),
                itemCount: _data?.length,
              ),
            ),
          ],
        ));
  }

  /// 请求数据
  void _requestMatch() async {
    List<WarcraftSchedulerResponse> matchList =
        await WarcraftSchedulerRequest().getMatchSchedulerList();
    List<ListItemBuilder>? list = _buildMatchList(matchList);
    setState(() {
      _commonController.stopLoading();
      _data = list;
      _controller.refreshCompleted();
    });
  }

  @override
  void dispose() {}

  /// 将Scheduler数据转换成列表数据
  List<ListItemBuilder>? _buildMatchList(
      List<WarcraftSchedulerResponse> response) {
    List<ListItemBuilder> result = [];
    DateTime? lastTime;
    for (var element in response) {
      String timeFormat = element.start ?? "";
      String title = element.title ?? "";
      if (timeFormat == "" || title == "") {
        continue;
      }
      DateTime time = DateTime.parse(timeFormat);
      if (!DateFormatter.isSameDay(time, lastTime)) {
        // 如果不是同一天，则添加时间分割线
        result.add(DateItem(text: DateFormatter.buildDay(time)));
        lastTime = time;
      }
      result.add(_buildItem(time, title));
    }
    return result;
  }

  /// 转换成ListView的Item
  ListItemBuilder _buildItem(DateTime time, String title) {
    return MatchItem(hourTime: DateFormatter.buildHour(time), title: title);
  }

  @override
  bool get wantKeepAlive => true;
}
