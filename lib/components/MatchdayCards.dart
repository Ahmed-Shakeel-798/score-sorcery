import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp/Data/MatchDayData.dart';
import 'package:fyp/Screens/MatchDayInfo.dart';
import 'package:fyp/components/MatchDayCardsFunctions.dart';
import 'package:fyp/constants.dart';

class MatchDayCardsHome extends StatefulWidget {
  final fetchMatches;
  final int index;
  MatchDayCardsHome(this.fetchMatches, this.index);
  @override
  _MatchDayCardsState createState() => _MatchDayCardsState();
}

class _MatchDayCardsState extends State<MatchDayCardsHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: HeightOfMatchDayCard,
        width: WidthOfMatchDayCard,
        decoration: BoxDecoration(
          color: ColorSecondary,
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
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: matchDayCard(widget.fetchMatches, WidthOfMatchDayCard,
                HeightOfMatchDayCard, ColorPrimary, widget.index),
            onTap: () {
              _navigateToNextScreen(this.context, widget.fetchMatches);
              print("Osama");
            },
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, var match) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            match == null ? Container() : MatchDayInfo(fetchMatches: match)));
  }
}
