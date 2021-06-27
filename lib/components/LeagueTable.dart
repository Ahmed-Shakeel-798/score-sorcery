import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fyp/Data/MatchDayData.dart';
import 'package:fyp/Screens/MatchDayInfo.dart';
import 'package:fyp/components/MatchdayCards.dart';
import 'package:fyp/constants.dart';
import 'package:provider/provider.dart';
import '../Data/providerdata.dart';

class LeagueTable extends StatefulWidget {
  final leagueName;
  LeagueTable({this.leagueName});
  @override
  _LeagueTableState createState() => _LeagueTableState();
}

class _LeagueTableState extends State<LeagueTable> {
  SystemMouseCursor cursor = SystemMouseCursors.alias;
  bool callfetchRecentMatches = true;

  @override
  void initState() {
    super.initState();
    callfetchRecentMatches = true;
  }

  @override
  Widget build(BuildContext context) {
    final VariableSettings variableSettings =
        Provider.of<VariableSettings>(context);
    var fetchedPredictions = variableSettings.predictions;
    if (callfetchRecentMatches) {
      variableSettings.removeAllPredictions();
      variableSettings.fetchPredictions(widget.leagueName, 0);
      callfetchRecentMatches = false;
    }
    return fetchedPredictions.length == 0
        ? Container()
        : Container(
            height: 200,
            color: ColorPrimary,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    child: Center(
                        child: Text(widget.leagueName,
                            style: TextStyle(fontSize: 30))),
                    height: 40,
                    color: ColorSecondary,
                  ),
                ),

                ///////// Matches Data Here
                Row(children: [
                  Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, idnex) =>
                            fetchedPredictions.length != 0
                                ? MatchDayCardsHome(
                                    fetchedPredictions[idnex], idnex)
                                : Container(
                                    color: Colors.black12,
                                    width: WidthOfMatchDayCard,
                                    height: HeightOfMatchDayCard,
                                  )),
                  ),
                  //MatchDayCards(matches[0],stats[0]),
                  //MatchDayCards(matches[1],stats[1]),
                  //MatchDayCards(matches[2],stats[2]),
                ]),
              ],
            ),
          );
  }
}
