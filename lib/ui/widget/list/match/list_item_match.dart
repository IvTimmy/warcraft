import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:warcraft/ui/widget/list/list_item_builder.dart';
import 'package:warcraft/utils/color_selector.dart';

class MatchItem extends ListItemBuilder {
  final String hourTime;
  final String title;

  MatchItem({
    required this.hourTime,
    required this.title,
  });

  @override
  Widget buildItem(BuildContext context, int index) {
    return TimelineTile(
      nodeAlign: TimelineNodeAlign.start,
      contents: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "$hourTime   $title",
          style: const TextStyle(fontSize: 13),
        ),
      ),
      node: TimelineNode(
        indicator: OutlinedDotIndicator(
          color: ColorSelector.getColor(index),
          borderWidth: 1,
        ),
        startConnector: const SolidLineConnector(),
        endConnector: const SolidLineConnector(),
      ),
    );
  }
}
