import 'dart:html';
import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:fyp/components/CustomAppBar.dart';
import 'package:fyp/components/Info.dart';
import 'package:fyp/components/LeagueTable.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarMade(
                selectedIndex: 1,
              ),

              ////////////

              Info(),

              /////// Above this will be info about page

              SizedBox(
                height: 20,
              ),

              Container(
                  child: Column(
                children: [
                  LeagueTable(
                    leagueName: "Laliga",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // LeagueTable(
                  //   leagueName: "Serie A",
                  // ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
