//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/Data/MatchDayData.dart';
import 'package:fyp/Screens/HomeScreen.dart';
import 'package:fyp/Screens/Lineup.dart';
import 'package:fyp/Screens/LineupBuilderScreen.dart';
import 'package:fyp/Screens/MatchDayInfo.dart';
import 'package:fyp/Screens/StatsScreen.dart';

class AppBarMade extends StatefulWidget {
  final selectedIndex;
  AppBarMade({this.selectedIndex});
  @override
  _AppBarMade createState() => _AppBarMade();
}

class _AppBarMade extends State<AppBarMade> {
  List<String> appBarList = ["LOGO", "HOME", "STATS", "LINEUP BUILDER"];

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.pink,
        height: 80,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: appBarList.length,
            itemBuilder: (context, index) =>
                appBatCatergory(index, widget.selectedIndex)));
  }

  Widget appBatCatergory(int index, int selectedIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Text(appBarList[index],
              style: TextStyle(
                  fontWeight: selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal)),
          onTap: () {
            _navigateToNextScreen(this.context, index);
            print("Osama");
          },
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, int selectedIndex) {
    if (selectedIndex == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else if (selectedIndex == 2) {
      Navigator.of(context).pop();

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => StatsScreen()));
    } else if (selectedIndex == 3) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LineupBuilder()));
    }
  }
}
