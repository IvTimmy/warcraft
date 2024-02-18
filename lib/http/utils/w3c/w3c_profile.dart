import 'dart:math';

const RANDOM = 0;
const HUMAN = 1;
const ORC = 2;
const NIGHTELF = 4;
const UNDEAD = 8;
const TOTAL = 16;
const SPECIAL = 32;
const STARTER = 64;
const categoryMap = <int, String>{
  RANDOM: "RANDOM",
  HUMAN: "HUMAN",
  ORC: "ORC",
  NIGHTELF: "NIGHTELF",
  UNDEAD: "UNDEAD",
  TOTAL: "TOTAL",
  SPECIAL: "SPECIAL",
  STARTER: "STARTER",
};

class ProfileComposer {
  ProfileComposer._();

  static String buildPortraitUrl(int race, int portraitId, bool isClassic) {
    if (portraitId <= 0) {
      int randomId = Random().nextInt(100) * 5 + 1;
      return "https://w3champions.wc3.tools/prod/integration/icons/raceAvatars/STARTER_$randomId.jpg?v=2";
    }
    if (race == SPECIAL) {
      return "https://w3champions.wc3.tools/prod/integration/icons/specialAvatars/SPECIAL_$portraitId.jpg?v=2";
    }
    String raceIconPrefix = isClassic ? "classic/" : "";
    return "https://w3champions.wc3.tools/prod/integration/icons/raceAvatars/$raceIconPrefix${categoryMap[race]}_$portraitId.jpg?v=2";
  }

  static String getRace(int race) {
    switch (race) {
      case HUMAN:
        return "Human";
      case ORC:
        return "Orc";
      case NIGHTELF:
        return "NE";
      case UNDEAD:
        return "UD";
      default:
        return "Random";
    }
  }

  static String getRaceIcon(String raceName) {
    switch (raceName) {
      case "Human":
        return "assets/images/icon_race_human.png";
      case "Undead":
        return "assets/images/icon_race_ud.png";
      case "Orc":
        return "assets/images/icon_race_orc.png";
      case "Nightelf":
        return "assets/images/icon_race_ne.png";
      case "Random":
        return "assets/images/icon_race_random.png";
    }
    return "assets/images/icon_race_random.png";
  }

  /// 从war3info服务器获取URL
  static String getImageUrl(String fileName) {
    if (fileName.isEmpty) {
      return "";
    }
    return "https://d3upx5peno0o6w.cloudfront.net/$fileName";
  }
}
