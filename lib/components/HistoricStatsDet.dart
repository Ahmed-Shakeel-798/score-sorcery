import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:fyp/Data/MatchDayData.dart';
import 'package:fyp/components/CustomAppBar.dart';
import 'package:fyp/components/MatchDayCardsFunctionStats.dart';
// import 'package:fyp/components/MatchDayCards.dart';
import 'package:fyp/components/MatchDayCardsFunctions.dart';
import 'package:fyp/components/MatchdayCards.dart';
import 'package:fyp/constants.dart';
import 'package:provider/provider.dart';
import '../Data/providerdata.dart';

class HistoricStats extends StatefulWidget {
  final fetchdMatches;
  HistoricStats({this.fetchdMatches});

  @override
  _HistoricStatsState createState() => _HistoricStatsState();
}

class _HistoricStatsState extends State<HistoricStats> {
  bool callFetchHeadToHeaddata;

  @override
  void initState() {
    super.initState();
    callFetchHeadToHeaddata = true;
  }

  @override
  Widget build(BuildContext context) {
    final VariableSettings variableSettings =
        Provider.of<VariableSettings>(context);
    List headToHeadData = variableSettings.headToHeadData;
    List teamA_starting11 = variableSettings.teamA_starting11;
    List teamB_starting11 = variableSettings.teamB_starting11;
    // headToHeadData[0][fetchdMatches["teamA_id"]]["wins"]

    if (callFetchHeadToHeaddata) {
      variableSettings.removeStatsHeadToHeadData();
      variableSettings.fetchHeadToHeaddata(widget.fetchdMatches);
      // variableSettings.fetchStarting11(widget.fetchdMatches);
      callFetchHeadToHeaddata = false;
    }

    double widthContainer = MediaQuery.of(context).size.width / 2;
    List text = ["Osama", "Ahmed", "Haris"];
    print("Historic");
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: HeightOfMatchDayCard * 5,
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
                child: matchDayCardStats(
                    widget.fetchdMatches,
                    WidthOfMatchDayCard + WidthOfMatchDayCard * 1.3,
                    //widthContainer+WidthOfMatchDayCard/1.5,
                    HeightOfMatchDayCard + HeightOfMatchDayCard / 4,
                    ColorSecondary),
              ),
              Container(
                //height: HeightOfMatchDayCard / 3,
                width: widthContainer,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // for (var values in text)
                          //   Text(
                          //     values,
                          //     style: TextStyle(color: ColorSecondary),
                          //   ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // for (var values in text)
                          //   Text(
                          //     values,
                          //     style: TextStyle(color: ColorSecondary),
                          //   ),
                        ],
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
                      child: headToHeadData.length > 0
                          ? Column(
                              children: [
                                StatsRow(
                                    headToHeadData[0][widget
                                            .fetchdMatches["teamA_id"]]["wins"]
                                        .toString(),
                                    "Wins",
                                    headToHeadData[0][widget
                                            .fetchdMatches["teamB_id"]]["wins"]
                                        .toString()),
                                StatsRow(
                                    headToHeadData[0][widget
                                            .fetchdMatches["teamA_id"]]["loss"]
                                        .toString(),
                                    "Loss",
                                    headToHeadData[0][widget
                                            .fetchdMatches["teamB_id"]]["loss"]
                                        .toString()),
                                //StatsRow("2", "Game Ratio", "2"),
                                StatsRow(
                                    headToHeadData[0][widget
                                                .fetchdMatches["teamA_id"]]
                                            ["goals_scored"]
                                        .toString(),
                                    "Goal Scored",
                                    headToHeadData[0][widget
                                                .fetchdMatches["teamB_id"]]
                                            ["goals_scored"]
                                        .toString()),
                                StatsRow(
                                    headToHeadData[0][widget
                                                .fetchdMatches["teamA_id"]]
                                            ["goals_conceded"]
                                        .toString(),
                                    "Goal Conceded",
                                    headToHeadData[0][widget
                                                .fetchdMatches["teamB_id"]]
                                            ["goals_conceded"]
                                        .toString()),
                                StatsRow(
                                    headToHeadData[0][widget
                                                .fetchdMatches["teamA_id"]]
                                            ["winsVsteamB"]
                                        .toString(),
                                    "Head To Head",
                                    headToHeadData[0][widget
                                                .fetchdMatches["teamB_id"]]
                                            ["winsVsteamA"]
                                        .toString()),
                                StatsRow(
                                    headToHeadData[0][widget
                                                .fetchdMatches["teamA_id"]]
                                            ["goalsVsTeamB"]
                                        .toString(),
                                    "Head To Head Goals",
                                    headToHeadData[0][widget
                                                .fetchdMatches["teamB_id"]]
                                            ["goalsVsTeamA"]
                                        .toString()),
                              ],
                            )
                          : Container(
                              height: HeightOfMatchDayCard,
                              width: WidthOfMatchDayCard,
                              color: Colors.black12,
                            ),
                    ),
                  ],
                ),
              ),
              Container(
                //height: HeightOfMatchDayCard / 3,
                width: widthContainer,
                decoration: BoxDecoration(
                  color: ColorPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var values in teamA_starting11)
                            Text(
                              values,
                              style: TextStyle(color: ColorSecondary),
                            ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var values in teamB_starting11)
                            Text(
                              values,
                              style: TextStyle(color: ColorSecondary),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
