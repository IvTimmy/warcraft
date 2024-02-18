import 'package:flutter/material.dart';
import 'package:warcraft/ui/page/match_page.dart';
import 'package:warcraft/ui/page/mine_page.dart';
import 'package:warcraft/ui/page/news_page.dart';
import 'package:warcraft/ui/page/rank_page.dart';
import 'package:warcraft/warcraft/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ThemeColor.blueColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Warcraft III Camp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin<MyHomePage> {
  final List<Widget> _pages = const [
    NewsPage(),
    MatchPage(),
    RankPage(),
    MinePage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor.blueColor,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: ThemeColor.blueColor),
        selectedItemColor: ThemeColor.blueColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "新闻",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "赛程",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radar),
            label: "排名",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.self_improvement),
            label: "我的",
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
