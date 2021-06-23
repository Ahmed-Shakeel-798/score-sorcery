import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp/Data/MatchDayData.dart';
import 'package:fyp/Screens/MatchDayInfo.dart';
import 'package:fyp/components/MatchDayCardsFunctions.dart';
import 'package:fyp/constants.dart';


class MatchDayCards extends StatefulWidget {
  final Laliga match;
  final MatchDayStats stats;
  MatchDayCards(this.match,this.stats);
  @override
  _MatchDayCardsState createState() => _MatchDayCardsState();
}

class _MatchDayCardsState extends State<MatchDayCards> {
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
                    child: matchDayCard(
                      widget.match,
                      WidthOfMatchDayCard,
                      HeightOfMatchDayCard,
                      ColorPrimary
                      ),
                      onTap: () {
                      _navigateToNextScreen(this.context,widget.match,widget.stats);
                      print("Osama");
      },
                      
                      ),
                      
                ),
              ),
              
      
    );
  }

  // Row matchDayCard(Laliga match) {
  //   return Row(
  //               children: [
  //                 imageDisplayed("lib/images/"+match.homeTeamCode+".png"),
  //                 Container(
  //                   width: WidthOfMatchDayCard/2,
  //                   height: HeightOfMatchDayCard,
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
                        
  //                       matchDayInfo("Matchday "+match.matchDay,FontWeight.bold,20),
  //                       matchDayInfo(match.time,FontWeight.normal,15),
  //                       matchDayInfo(match.stadium,FontWeight.normal,15)
                        
                      
  //                     ],
  //                   ),
  //                 ),
  //                 imageDisplayed("lib/images/"+match.awayTeamCode+".png"),
                  
  //               ],
  //             );
  // }

  void _navigateToNextScreen(BuildContext context,Laliga match,MatchDayStats stats) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MatchDayInfo(match: match,stats:stats)));
  }



//   Text matchDayInfo(String info,FontWeight  boldnss, double size) {
//     return Text(
//                           info,
//                           style: TextStyle(
//                             fontWeight: boldnss,
//                             fontSize: size
//                           ),
//                         );
//   }

//   ClipRRect imageDisplayed(String imagePath ) {
//     return ClipRRect(
//       child: Image.asset(
//         imagePath,
        
//         height: HeightOfMatchDayCard,
//         width: WidthOfMatchDayCard/4,
//       )
//                   );
//   }
// }

}