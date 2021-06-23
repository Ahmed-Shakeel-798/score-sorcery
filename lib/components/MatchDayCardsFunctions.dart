import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp/Data/MatchDayData.dart';
import 'package:fyp/Screens/MatchDayInfo.dart';
import 'package:fyp/constants.dart';



 Row matchDayCard(Laliga match,double WidthOfMatchDayCard,double HeightOfMatchDayCard,Color color ) {
    return Row(
                children: [
                  imageDisplayed("lib/images/"+match.homeTeamCode+".png"),
                  Container(
                    width: WidthOfMatchDayCard/2,
                    height: HeightOfMatchDayCard,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        matchDayInfo("Matchday "+match.matchDay,FontWeight.bold,20,color),
                        matchDayInfo(match.time,FontWeight.normal,15,color),
                        matchDayInfo(match.stadium,FontWeight.normal,15,color)
                        
                      
                      ],
                    ),
                  ),
                  imageDisplayed("lib/images/"+match.awayTeamCode+".png"),
                  
                ],
              );
  }




  Text matchDayInfo(String info,FontWeight  boldnss, double size,Color color) {
    return Text(
                          info,
                          style: TextStyle(
                            fontWeight: boldnss,
                            fontSize: size,
                            color: color
                          ),
                        );
  }

  ClipRRect imageDisplayed(String imagePath ) {
    return ClipRRect(
      child: Image.asset(
        imagePath,
        
        height: HeightOfMatchDayCard,
        width: WidthOfMatchDayCard/4,
      )
                  );
  }

