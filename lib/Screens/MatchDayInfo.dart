//import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Data/MatchDayData.dart';
import 'package:fyp/components/CustomAppBar.dart';
// import 'package:fyp/components/MatchDayCards.dart';
import 'package:fyp/components/MatchDayCardsFunctions.dart';
import 'package:fyp/components/MatchdayCards.dart';
import 'package:fyp/constants.dart';

class MatchDayInfo extends StatelessWidget {
  final Laliga match;
  final MatchDayStats stats;
  MatchDayInfo({this.match, this.stats});
  @override
  Widget build(BuildContext context) {
    double widthContainer = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarMade(
                selectedIndex: 2,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: HeightOfMatchDayCard + HeightOfMatchDayCard / 4,
                width: widthContainer,
                decoration: BoxDecoration(
                  color: ColorPrimary,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: matchDayCard(
                    match,
                    WidthOfMatchDayCard + WidthOfMatchDayCard * 1.3,
                    //widthContainer+WidthOfMatchDayCard/1.5,
                    HeightOfMatchDayCard + HeightOfMatchDayCard / 4,
                    ColorSecondary),
              ),
              Container(
                height: HeightOfMatchDayCard / 3,
                width: widthContainer,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "23%",
                        style: TextStyle(color: ColorSecondary),
                      ),
                      Text(
                        "65%",
                        style: TextStyle(color: ColorSecondary),
                      ),
                      Text(
                        "21%",
                        style: TextStyle(color: ColorSecondary),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 2,
                //color: Colors.black,
                child: Column(
                  children: [
                    Text("Last 5 Matches Stats",
                        style: TextStyle(
                            color: ColorPrimary,
                            fontWeight: FontWeight.normal,
                            fontSize: 20)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: HeightOfMatchDayCard + HeightOfMatchDayCard / 4,
                      width: widthContainer,
                      child: Column(
                        children: [
                          StatsRow(stats.wins.toString(), "Wins",
                              stats.wins.toString()),
                          StatsRow(stats.loss.toString(), "Loss",
                              stats.loss.toString()),
                          StatsRow(stats.loss.toString(), "Game Ratio",
                              stats.loss.toString()),
                          StatsRow(stats.goalScored.toString(), "Goal Scored",
                              stats.goalScored.toString()),
                          StatsRow(stats.goalConceded.toString(),
                              "Goal Conceded", stats.goalConceded.toString()),
                          StatsRow(stats.headtoHead.toString(), "Head To Head",
                              stats.headtoHead.toString()),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row StatsRow(String statsHome, String statsName, String statsAway) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(statsHome,
            style: TextStyle(fontWeight: FontWeight.bold, color: ColorPrimary)),
        Text(statsName, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(statsAway,
            style: TextStyle(fontWeight: FontWeight.bold, color: ColorPrimary)),
      ],
    );
  }
}

// Container(

//                 height: HeightOfMatchDayCard + HeightOfMatchDayCard/4,
//                 width: MediaQuery.of(context).size.width/2,
//                 decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: ColorPrimary,

//                 ),
//               ),
