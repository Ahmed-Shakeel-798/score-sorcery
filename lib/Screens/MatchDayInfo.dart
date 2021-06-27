//import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Data/MatchDayData.dart';
import 'package:fyp/components/CustomAppBar.dart';
// import 'package:fyp/components/MatchDayCards.dart';
import 'package:fyp/components/MatchDayCardsFunctions.dart';
import 'package:fyp/components/MatchdayCards.dart';
import 'package:fyp/constants.dart';
import 'package:provider/provider.dart';
import '../Data/providerdata.dart';

class MatchDayInfo extends StatefulWidget {
  final fetchMatches;
  MatchDayInfo({this.fetchMatches});

  @override
  _MatchDayInfoState createState() => _MatchDayInfoState();
}

class _MatchDayInfoState extends State<MatchDayInfo> {
  bool callFetchHeadToHeaddata = true;

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
    if (callFetchHeadToHeaddata) {
      variableSettings.removePredictionsHeadToHead();
      variableSettings.fetchPredictionHeadToHeaddata(widget.fetchMatches);
      // variableSettings.fetchStarting11(widget.fetchdMatches);
      callFetchHeadToHeaddata = false;
    }
    double widthContainer = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      body: headToHeadData.length == 0
          ? Container()
          : Container(
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
                          widget.fetchMatches,
                          WidthOfMatchDayCard + WidthOfMatchDayCard * 1.3,
                          //widthContainer+WidthOfMatchDayCard/1.5,
                          HeightOfMatchDayCard + HeightOfMatchDayCard / 4,
                          ColorSecondary,
                          0),
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
                              widget.fetchMatches["teamA_percentage"]
                                      .toString() +
                                  "%",
                              style: TextStyle(color: ColorSecondary),
                            ),
                            Text(
                              (100 -
                                      (widget.fetchMatches["teamA_percentage"] +
                                          widget.fetchMatches[
                                              "teamB_percentage"]))
                                  .toString(),
                              style: TextStyle(color: ColorSecondary),
                            ),
                            Text(
                              widget.fetchMatches["teamB_percentage"]
                                      .toString() +
                                  "%",
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
                            height:
                                HeightOfMatchDayCard + HeightOfMatchDayCard / 4,
                            width: widthContainer,
                            child: Column(
                              children: [
                                StatsRow(
                                    headToHeadData[0][widget
                                            .fetchMatches["teamA_id"]]["wins"]
                                        .toString(),
                                    "Wins",
                                    headToHeadData[0][widget
                                            .fetchMatches["teamB_id"]]["wins"]
                                        .toString()),
                                StatsRow(
                                    headToHeadData[0][widget
                                            .fetchMatches["teamA_id"]]["loss"]
                                        .toString(),
                                    "Loss",
                                    headToHeadData[0][widget
                                            .fetchMatches["teamB_id"]]["loss"]
                                        .toString()),
                                //StatsRow("2", "Game Ratio", "2"),
                                StatsRow(
                                    headToHeadData[0][
                                                widget.fetchMatches["teamA_id"]]
                                            ["goals_scored"]
                                        .toString(),
                                    "Goal Scored",
                                    headToHeadData[0][
                                                widget.fetchMatches["teamB_id"]]
                                            ["goals_scored"]
                                        .toString()),
                                StatsRow(
                                    headToHeadData[0][
                                                widget.fetchMatches["teamA_id"]]
                                            ["goals_conceded"]
                                        .toString(),
                                    "Goal Conceded",
                                    headToHeadData[0][
                                                widget.fetchMatches["teamB_id"]]
                                            ["goals_conceded"]
                                        .toString()),
                                StatsRow(
                                    headToHeadData[0][
                                                widget.fetchMatches["teamA_id"]]
                                            ["winsVsteamB"]
                                        .toString(),
                                    "Head To Head",
                                    headToHeadData[0][
                                                widget.fetchMatches["teamB_id"]]
                                            ["winsVsteamA"]
                                        .toString()),
                                StatsRow(
                                    headToHeadData[0][
                                                widget.fetchMatches["teamA_id"]]
                                            ["goalsVsTeamB"]
                                        .toString(),
                                    "Head To Head Goals",
                                    headToHeadData[0][
                                                widget.fetchMatches["teamB_id"]]
                                            ["goalsVsTeamA"]
                                        .toString()),
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
