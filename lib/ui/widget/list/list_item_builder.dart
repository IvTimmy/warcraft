import 'package:flutter/widgets.dart';

abstract class ListItemBuilder{
  Widget buildItem(BuildContext context, int index);
}
