import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:warcraft/http/utils/w3c/w3c_profile.dart';
import 'package:warcraft/models/match_model.dart';
import 'package:warcraft/ui/widget/list/list_item_builder.dart';
import 'package:warcraft/utils/color_selector.dart';

class ResultItem extends ListItemBuilder {
  final PlayerInfo player1;
  final PlayerInfo player2;
  final String time;

  ResultItem(
    this.player1,
    this.player2,
    this.time,
  );

  @override
  Widget buildItem(BuildContext context, int index) {
    return TimelineTile(
      nodeAlign: TimelineNodeAlign.start,
      contents: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                time,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flag.fromString(player1.playerCountry,
                        height: 17, width: 17),
                    Text(
                      "  ${player1.playerName}  ",
                      style: const TextStyle(fontSize: 13),
                    ),
                    Image.asset(ProfileComposer.getRaceIcon(player1.playerRace),
                        width: 17, height: 17),
                    Text(
                      "（${player1.playerScore.toString()}）",
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flag.fromString(player2.playerCountry,
                        height: 17, width: 17),
                    Text(
                      "  ${player2.playerName}  ",
                      style: const TextStyle(fontSize: 13),
                    ),
                    Image.asset(ProfileComposer.getRaceIcon(player2.playerRace),
                        width: 17, height: 17),
                    Text(
                      "（${player2.playerScore.toString()}）",
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      node: TimelineNode(
        indicator: OutlinedDotIndicator(
          color: ColorSelector.getColor(index),
        ),
        startConnector: const SolidLineConnector(),
        endConnector: const SolidLineConnector(),
      ),
    );
  }
}
