import 'package:flutter/material.dart';
import 'package:fyp/Data/MatchDayData.dart';
import 'package:fyp/Screens/StatsScreen.dart';
import 'package:fyp/components/MatchDayCardsFunctions.dart';
import 'package:fyp/constants.dart';
import 'package:provider/provider.dart';
import '../Data/providerdata.dart';

class StatsShow extends StatefulWidget {
  final int selectIndex;

  StatsShow({this.selectIndex});
  @override
  _StatsShowState createState() => _StatsShowState();
}

class _StatsShowState extends State<StatsShow> {
  List<String> logoList = [
    "lib/images/Laliga.png",
    "lib/images/Laliga.png",
    "lib/images/Laliga.png",
    "lib/images/Laliga.png",
    "lib/images/Laliga.png"
  ];
  int selectedIndex = 1;

  bool callfetchRecentMatches = false;
  @override
  void initState() {
    super.initState();
    callfetchRecentMatches = true;
  }

  @override
  Widget build(BuildContext context) {
    final VariableSettings variableSettings =
        Provider.of<VariableSettings>(context);
    if (callfetchRecentMatches) {
      variableSettings.fetchRecentMatches("Laliga", 0);
      callfetchRecentMatches = false;
    }
    var fetchedMatches = variableSettings.matches;
    // print(fetchedMatches[0]);
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        logoMenu(context),
        SizedBox(
          width: 5,
        ),
        Flexible(
            child: Container(
          color: Colors.grey[50],
          height: MediaQuery.of(context).size.height / 1.3,
          width: MediaQuery.of(context).size.width / 1.3,
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (MediaQuery.of(context).size.height * 2) /
                  MediaQuery.of(context).size.height,
            ),
            itemBuilder: (context, index) => Column(
              children: [
                Container(
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
                        child: fetchedMatches.length != 0
                            ? matchDayCard(
                                fetchedMatches[0],
                                WidthOfMatchDayCard,
                                HeightOfMatchDayCard,
                                ColorPrimary)
                            : Container(
                                color: Colors.black,
                                child: Text("Hello world"),
                              ),
                        onTap: () {
                          // _navigateToNextScreen(this.context,widget.match,widget.stats);
                          print("Osama");
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ],
    );
  }

  Widget logoMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.3,
        width: 75,
        decoration: BoxDecoration(
          color: ColorPrimary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: layoutBuilder(),
      ),
    );
  }

  ListView layoutBuilder() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: logoList.length,
      itemBuilder: (context, index) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: imageDisplayed(logoList[index], index, widget.selectIndex),
          onTap: () {
            //StatsShow(selectIndex: index,);

            _navigateToNextScreen(this.context, index);
            print(index);
            print(widget.selectIndex);
            print("Osama");
          },
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, int index) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => StatsScreen(
              selectedIndex: index,
            )));
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatsScreen(selectedIndex: index,)));
  }

  Widget imageDisplayed(String imagePath, int index, int selectedIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
          height: 70,
          width: 50,
          decoration: selectedIndex == index
              ? BoxDecoration(
                  color: ColorSecondary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                )
              : BoxDecoration(),
          child: Image.asset(
            imagePath,
            height: (MediaQuery.of(context).size.height / 1.5) / 4,
            width: 35,
          )),
    );
  }
}
