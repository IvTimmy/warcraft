import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:warcraft/ui/widget/list/list_item_builder.dart';
import 'package:warcraft/warcraft/theme.dart';

class DateItem extends ListItemBuilder {
  String text;

  DateItem({required this.text});

  @override
  Widget buildItem(BuildContext context, int index) {
    return TimelineTile(
      nodeAlign: TimelineNodeAlign.start,
      contents: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide()),
        ),
        padding: const EdgeInsets.only(
          left: 4,
          top: 8,
          bottom: 8,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      node: const TimelineNode(
        indicator: DotIndicator(
          color: ThemeColor.blueColor,
        ),
        startConnector: SolidLineConnector(),
        endConnector: SolidLineConnector(),
      ),
    );
  }
}
