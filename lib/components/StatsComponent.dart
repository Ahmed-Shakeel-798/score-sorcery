import 'package:flutter/material.dart';
import 'package:fyp/Data/MatchDayData.dart';
import 'package:fyp/Screens/StatsScreen.dart';
import 'package:fyp/components/HistoricStatsDet.dart';
import 'package:fyp/components/MatchDayCardsFunctionStats.dart';
import 'package:fyp/components/MatchDayCardsFunctions.dart';
import 'package:fyp/constants.dart';
import 'package:provider/provider.dart';
import '../Data/providerdata.dart';

class StatsShow extends StatefulWidget {
  final int selectIndex;
  final int pageNumber;

  StatsShow({this.selectIndex, this.pageNumber});
  @override
  _StatsShowState createState() => _StatsShowState();
}

class _StatsShowState extends State<StatsShow> {
  List<String> logoList = [
    "lib/images/Laliga.png",
    "lib/images/SerieA.png",
    "lib/images/Bundes.png",
    "lib/images/Ligue1.png",
    "lib/images/Prem.png"
  ];
  List leaguesNameSelected = ["Laliga", "Serie A", "B", "Li", "P"];
  int count = 0;
  bool callfetchRecentMatches = true;
  int pageNumber = 0;
  // @override
  // void initState() {
  //   super.initState();
  //   callfetchRecentMatches = true;
  // }

  @override
  Widget build(BuildContext context) {
    final VariableSettings variableSettings =
        Provider.of<VariableSettings>(context);
    var fetchedMatches = variableSettings.matches;
    if (callfetchRecentMatches) {
      print("PageNumber : ${widget.pageNumber}");
      print("SelectedIndex : ${widget.selectIndex}");
      // if (fetchedMatches.length != 0) {
      //   variableSettings.fetchHeadToHeaddata(fetchedMatches[0]);
      // }
      variableSettings.removeAllMatches();
      variableSettings.fetchRecentMatches(
          leaguesNameSelected[widget.selectIndex], widget.pageNumber);
      callfetchRecentMatches = false;
    }
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
                  (MediaQuery.of(context).size.height) *
                  1.5,
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
                        child: fetchedMatches.length > 9
                            ? matchDayCardStats(
                                fetchedMatches[index],
                                WidthOfMatchDayCard,
                                HeightOfMatchDayCard,
                                ColorPrimary)
                            : Container(
                                color: Colors.black12,
                                // child: Text("Hello world"),
                              ),
                        onTap: () {
                          _navigateToNextScreen(
                              this.context, fetchedMatches[index]);
                          // print("Osama");
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
        Container(
            height: MediaQuery.of(context).size.height / 1.2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  forwardBackward(context, Icons.arrow_forward),
                  SizedBox(
                    height: 20,
                  ),
                  forwardBackward(context, Icons.arrow_back),
                ])),
      ],
    );
  }

  MouseRegion forwardBackward(BuildContext context, IconData icon) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Container(
          //color: Colors.orange,
          height: 50,
          width: 50,
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
          child: Center(
            child: Icon(
              icon,
              color: ColorSecondary,
              size: 40,
            ),
          ),
        ),
        onTap: () {
          if (Icons.arrow_forward == icon) {
            int value = widget.pageNumber + 1;
            _navigateToNextScreeButtons(
                this.context, widget.selectIndex, value);
          } else {
            if (widget.pageNumber != 0) {
              int value = widget.pageNumber - 1;
              _navigateToNextScreeButtons(
                  this.context, widget.selectIndex, value);
            }
          }
        },
      ),
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
            // setState(() {
            //   callfetchRecentMatches = true;
            // });
            //StatsShow(selectIndex: index,);

            print(index);

            print(widget.selectIndex);
            print("Osama");
            _navigateToNextScreeButtons(this.context, index, widget.pageNumber);
          },
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, var match) {
    print("WeHereNavigater");
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HistoricStats(
              fetchdMatches: match,
            )));
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatsScreen(selectedIndex: index,)));
  }

  void _navigateToNextScreeButtons(
      BuildContext context, int index, int pageNumber) {
    print("Buttons");
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => StatsScreen(
              selectedIndex: index,
              pageNumber: pageNumber,
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
