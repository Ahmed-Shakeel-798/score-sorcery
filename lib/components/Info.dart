import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      
      child: Row(
        children: [
         Container(
           width: MediaQuery.of(context).size.width/2,
           child: Padding(
             padding: const EdgeInsets.symmetric(vertical: 90),
             child: Column(
               children: [
                 Text(
                   "Lorem Ipsum",
                   style: TextStyle(
                     fontSize: 40,
                     fontWeight: FontWeight.bold
                   ),
                 ),
                 Text(
                   "Lorem Ipsum",
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.normal
                   ),
                 )
                 

               ],
             ),
           ),
         ),
         Container(
           width: MediaQuery.of(context).size.width/2,
           child: Image.asset("lib/images/Player.png"), 
         ),
        ]
      ) 
      
          );
  }
}