import 'package:flutter/material.dart';
import 'package:warcraft/ui/page/match/result_page.dart';
import 'package:warcraft/ui/page/match/scheduler_page.dart';
import 'package:warcraft/ui/page/match/ticker_page.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<StatefulWidget> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const SafeArea(
            child: TabBar(tabs: [
              Tab(
                //icon: Icon(Icons.schedule),
                text: "比赛日程",
              ),
              Tab(
                //icon: Icon(Icons.upcoming),
                text: "即将开始",
              ),
              Tab(
                //icon: Icon(Icons.settings_overscan),
                text: "比赛结果",
              ),
            ]),
          ),
        ),
        body: const TabBarView(
            children: [SchedulerPage(), TickerPage(), ResultPage()]),
      ),
    );
  }
}
