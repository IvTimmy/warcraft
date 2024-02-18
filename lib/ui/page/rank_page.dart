import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:warcraft/http/utils/w3c/w3c_profile.dart';
import 'package:warcraft/http/w3c/rank/rank_request.dart';
import 'package:warcraft/http/w3c/rank/rank_response.dart';
import 'package:warcraft/http/w3c/season/season_request.dart';
import 'package:warcraft/http/w3c/season/season_response.dart';
import 'package:warcraft/ui/page/common/common_page.dart';
import 'package:warcraft/ui/widget/portrait.dart';
import 'package:warcraft/warcraft/theme.dart';

class RankPage extends StatefulWidget {
  const RankPage({super.key});

  @override
  State<StatefulWidget> createState() => _RankPageState();
}

class _RankPageState extends State<RankPage>
    with AutomaticKeepAliveClientMixin<RankPage> {
  final RefreshController _controller = RefreshController();
  final CommonController _commonController = CommonController();
  List<WarcraftRankResponse>? _rankList;
  List<WarcraftSeasonResponse>? _seasonList;
  int _currentSeason = -1;

  @override
  void initState() {
    super.initState();
    _commonController.startLoading();
    _requestRankList();
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
        commonController: _commonController,
        child: Scaffold(
          body: Column(children: [
            // 第一行
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 16), child: Text("当前赛季：")),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    value: _currentSeason,
                    items: _createSeasonMenu(),
                    buttonStyleData: const ButtonStyleData(
                      height: 50,
                      width: 160,
                      padding: EdgeInsets.only(left: 14, right: 14),
                      elevation: 2,
                    ),
                    dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 200,
                        padding: null,
                        elevation: 8,
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        )),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.grey,
                      iconDisabledColor: Colors.grey,
                    ),
                    onChanged: (value) {
                      // 必须要有onChange的回调才能触发下拉菜单
                      _currentSeason = value as int;
                      _refreshRankList(_currentSeason);
                    },
                  ),
                ),
              ],
            ),
            // 下拉刷新的List
            Expanded(
              child: SmartRefresher(
                controller: _controller,
                enablePullDown: true,
                header: const MaterialClassicHeader(color: ThemeColor.blueColor),
                onRefresh: _refresh,
                child: ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    leading: Portrait(ProfileComposer.buildPortraitUrl(
                      _rankList?[index].playersInfo?[0].selectedRace ?? -1,
                      _rankList?[index].playersInfo?[0].pictureId ?? -1,
                      _rankList?[index].playersInfo?[0].isClassicPicture ??
                          false,
                    )),
                    title: Text(
                        "${index + 1}.  ${_rankList?[index].player1Id ?? ""}"),
                    subtitle: Text(
                      "MMR:${_rankList?[index].player?.mmr}   胜率:${_rankList?[index].player?.winrate?.toStringAsFixed(1)}%   种族:${ProfileComposer.getRace(_rankList?[index].player?.race ?? 0)}",
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: Flag.fromString(
                        _rankList?[index].playersInfo?[0].location ?? "en",
                        height: 24,
                        width: 24),
                  ),
                  itemCount: _rankList?.length,
                ),
              ),
            ),
          ]),
        ));
  }

  /// 创建赛季列表Menu
  List<DropdownMenuItem<int>>? _createSeasonMenu() {
    return _seasonList
        ?.map((e) => DropdownMenuItem<int>(
              value: e.id,
              child: Text(e.id.toString()),
            ))
        .toList();
  }

  // 请求排名列表，只展示1V1的Grand Master的排名
  void _requestRankList() async {
    // 获取赛季
    List<WarcraftSeasonResponse> seasonList =
        await WarcraftSeasonRequest().getSeasonList();
    int currentSeason = seasonList[0].id ?? 1;
    List<WarcraftRankResponse> rankList =
        await WarcraftRankRequest().getRankList(season: currentSeason);
    setState(() {
      _commonController.stopLoading();
      _seasonList = seasonList;
      _currentSeason = currentSeason;
      _rankList = rankList;
    });
  }

  void _refreshRankList(int season) async {
    List<WarcraftRankResponse> rankList =
        await WarcraftRankRequest().getRankList(season: season);
    setState(() {
      _rankList = rankList;
    });
  }

  void _refresh() {
    _refreshRankList(_currentSeason);
    _controller.refreshCompleted();
  }

  @override
  bool get wantKeepAlive => true;
}
