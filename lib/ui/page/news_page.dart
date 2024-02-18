import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:warcraft/http/utils/w3c/w3c_profile.dart';
import 'package:warcraft/http/war3info/news/news_request.dart';
import 'package:warcraft/http/war3info/news/news_response.dart';
import 'package:warcraft/models/news_model.dart';
import 'package:warcraft/ui/page/common/common_page.dart';
import 'package:warcraft/ui/widget/list/list_item_builder.dart';
import 'package:warcraft/ui/widget/list/match/list_item_news.dart';
import 'package:warcraft/warcraft/theme.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<StatefulWidget> createState() => _NewsState();
}

class _NewsState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin<NewsPage> {
  final RefreshController _controller = RefreshController();
  final CommonController _commonController = CommonController();
  List<ListItemBuilder> data = [];
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    _commonController.startLoading();
    _refreshNewsList();
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
              enablePullUp: true,
              header: const MaterialClassicHeader(color: ThemeColor.blueColor),
              onRefresh: _refreshNewsList,
              onLoading: () {
                _loadNewsList(currentPage + 1);
              },
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: data[index].buildItem(context, index),
                ),
                itemCount: data.length,
              ),
            ),
          ],
        ));
  }

  void _refreshNewsList() async {
    WarcraftNewsResponse response = await WarcraftNewsRequest().getNewsList();
    List<ListItemBuilder> result = _buildItems(response.data);
    setState(() {
      _commonController.stopLoading();
      currentPage = 1;
      data = result;
      _controller.refreshCompleted();
    });
  }

  void _loadNewsList(int page) async {
    WarcraftNewsResponse response =
        await WarcraftNewsRequest().getNewsList(page: page);
    int nextPage = response.currentPage ?? 1;
    List<ListItemBuilder> result = _buildItems(response.data);
    setState(() {
      currentPage = nextPage;
      data.addAll(result);
      _controller.loadComplete();
    });
  }

  List<ListItemBuilder> _buildItems(List<Data>? data) {
    List<ListItemBuilder> result = [];
    data?.forEach((element) {
      result.add(_transformToNews(element));
    });
    return result;
  }

  ListItemBuilder _transformToNews(Data data) {
    NewsInfo info = NewsInfo(
      data.title ?? "",
      data.intro ?? "",
      data.date ?? "",
      data.commentsCount ?? 0,
      data.likesCount ?? 0,
      ProfileComposer.getImageUrl(data.image?.fileName ?? ""),
    );
    return NewsItem(news: info);
  }

  @override
  bool get wantKeepAlive => true;
}
