import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CommonPage extends StatefulWidget {
  final Widget child;

  final CommonController commonController;

  const CommonPage({
    super.key,
    required this.child,
    required this.commonController,
  });

  @override
  State<StatefulWidget> createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget.commonController,
        builder: (BuildContext context, Widget? child) {
          return _getWidget(widget.commonController._isLoading);
        });
  }

  Widget _getWidget(bool isLoading) {
    if (isLoading) {
      return Container(
        alignment: Alignment.center,
        child: LoadingAnimationWidget.discreteCircle(
            color: Colors.blueAccent, size: 30),
      );
    } else {
      return widget.child;
    }
  }
}

class CommonController extends ChangeNotifier {
  bool _isLoading = false;

  startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  stopLoading() {
    _isLoading = false;
    notifyListeners();
  }
}
