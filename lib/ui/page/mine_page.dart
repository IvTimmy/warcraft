import 'package:flutter/widgets.dart';
import 'package:warcraft/ui/page/common/common_page.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<StatefulWidget> createState() => _MainState();
}

class _MainState extends State<MinePage> {
  final CommonController _controller = CommonController();

  @override
  void initState() {
    super.initState();
    _controller.startLoading();
  }
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      commonController: _controller,
      child: Text("HHHHHH"),
    );
  }
}
