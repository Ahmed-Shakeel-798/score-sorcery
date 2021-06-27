import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp/Data/MatchDayData.dart';
import 'package:fyp/Screens/MatchDayInfo.dart';
import 'package:fyp/constants.dart';

Row matchDayCard(var match, double WidthOfMatchDayCard,
    double HeightOfMatchDayCard, Color color, int index) {
  return Row(
    children: [
      //"lib/images/"+match.homeTeamCode+".png"
      imageDisplayed(match["imageA"]),
      Container(
        width: WidthOfMatchDayCard / 2,
        height: HeightOfMatchDayCard,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            matchDayInfo("Matchday 0" + (index + 1).toString(), FontWeight.bold,
                20, color),
            matchDayInfo("09:00 PM", FontWeight.normal, 15, color),
            matchDayInfo(match["stadium"], FontWeight.normal, 15, color)
          ],
        ),
      ),
      imageDisplayed(match["imageB"]),
    ],
  );
}

Text matchDayInfo(String info, FontWeight boldnss, double size, Color color) {
  return Text(
    info,
    style: TextStyle(fontWeight: boldnss, fontSize: size, color: color),
    textAlign: TextAlign.center,
  );
}

ClipRRect imageDisplayed(var image) {
  return ClipRRect(
      child: Container(
    height: HeightOfMatchDayCard,
    width: WidthOfMatchDayCard / 4,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: image != null ? image : AssetImage("lib/images/Barca.png"))),
  ));
}
