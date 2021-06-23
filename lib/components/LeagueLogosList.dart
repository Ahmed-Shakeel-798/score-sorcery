import 'package:flutter/material.dart';
import 'package:fyp/Data/MatchDayData.dart';
import 'package:fyp/Screens/StatsScreen.dart';
import 'package:fyp/components/MatchdayCards.dart';
import 'package:fyp/constants.dart';

class StatsShow extends StatefulWidget {
  final int selectIndex;
  
  StatsShow({this.selectIndex});
  @override
  _StatsShowState createState() => _StatsShowState();
}

class _StatsShowState extends State<StatsShow> {
  List<String> logoList = ["lib/images/Laliga.png","lib/images/Laliga.png","lib/images/Laliga.png","lib/images/Laliga.png","lib/images/Laliga.png"];
  int selectedIndex=1;
  @override
  Widget build(BuildContext context) {
    return Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                logoMenu(context),
                
                SizedBox(
                  width: 5,
                ),
              
                // Container(
                //   height: 100,
                //   width: 100,
                //   color:Colors.black
                // ),
                // Container(
                //   height: 100,
                //   width: 100,
                //   color:Colors.pink
                // ),
                // Container(
                //   height: 100,
                //   width: 100,
                //   color:Colors.black
                // ),
                
                Flexible(
                  child: Container(
                    color: Colors.grey,
                    height: MediaQuery.of(context).size.height/1.3,
                    width: MediaQuery.of(context).size.width/1.3,
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: (MediaQuery.of(context).size.height*2)/MediaQuery.of(context).size.height,
                        
                        ),
                       
                       itemBuilder: (context,index)=>Column(
                         children: [
                           Container(
                             height: HeightOfMatchDayCard/1.3,
                             width: WidthOfMatchDayCard/1.3,
                             color: index==selectedIndex?Colors.black:Colors.pink,
                           ),
                         ],
                       ),
                   ),
                   )

                 ),
                

                // Column(
                //   // color: Colors.black,
                //   // height: MediaQuery.of(context).size.height/1.5,
                //   // width: MediaQuery.of(context).size.width/1.2,
                //   children: [
                //     // Expanded(
                //     //   child: GridView.builder(
                //     //                   itemCount: 4,
                //     //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                //     //                   itemBuilder: (context,index)=>MatchDayCards(matches[0], stats[0])),
                //     // )
                
                // //    MatchDayCards(matches[0], stats[0])
                //   ],
                // )
              ],);
               
  }

  Widget logoMenu(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: MediaQuery.of(context).size.height/1.3,
                  width: 75,
                  decoration: BoxDecoration(
                    color: ColorPrimary,
                    borderRadius:BorderRadius.circular(10),
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
                   itemBuilder: (context,index)=> MouseRegion(
                     cursor: SystemMouseCursors.click,
                     child: GestureDetector(
                       child: imageDisplayed(
                         
                         logoList[index],index,widget.selectIndex),
                     onTap: () {
                    //StatsShow(selectIndex: index,);
                    
                    _navigateToNextScreen(this.context,index);
                    print(index);
                    print(widget.selectIndex);
                    print("Osama");
                    },
                     ),
                   ) ,
                   );
  }
void _navigateToNextScreen(BuildContext context, int index) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => StatsScreen(selectedIndex: index,)));
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatsScreen(selectedIndex: index,)));
  }

  Widget imageDisplayed(String imagePath,int index, int selectedIndex ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        height: 70,
        width: 50,
      decoration: selectedIndex==index?BoxDecoration(
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
                 ):BoxDecoration(),
        child: Image.asset(
          imagePath,
          height: (MediaQuery.of(context).size.height/1.5)/4,
          width: 35,
        )
                    ),
    );
  }
}



