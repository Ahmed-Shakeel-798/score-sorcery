import 'dart:html';
//import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:fyp/components/CustomAppBar.dart';
import 'package:fyp/components/Info.dart';
import 'package:fyp/components/StatsComponent.dart';
import 'package:fyp/components/LeagueTable.dart';
import 'package:fyp/constants.dart';

class StatsScreen extends StatefulWidget {
  final selectedIndex;
  StatsScreen({this.selectedIndex = 0});
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
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
              StatsShow(
                selectIndex: widget.selectedIndex,
              )
            ],
          ),
        ),
      ),
    );
  }
}
