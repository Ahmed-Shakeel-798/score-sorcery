import 'package:flutter/material.dart';

class Laliga
{
  final String matchID,homeTeamCode,awayTeamCode,stadium,time,matchDay;
  
  Laliga({
    this.matchID,
    this.awayTeamCode,
    this.homeTeamCode,
    this.stadium,
    this.time,
    this.matchDay
  });
}



class MatchDayStats
{
  final int wins,loss,goalScored,goalConceded,headtoHead;
  MatchDayStats(
    {
      this.goalConceded,
      this.goalScored,
      this.headtoHead,
      this.loss,
      this.wins
    }
  );
  
}




/////////////// Data from the API ----- for now default is used.



List <Laliga> matches=[
  Laliga(
    homeTeamCode: "Sevilla",
    awayTeamCode: "Madrid",
    matchDay: "01",
    matchID: "001",
    stadium: "Camp Nou",
    time: "09:00 PM"
  ),
  Laliga(
    homeTeamCode: "Barca",
    awayTeamCode: "Valencia",
    matchDay: "02",
    matchID: "002",
    stadium: "Cuitad Valencia",
    time: "09:00 PM"
  ),
  Laliga(
    homeTeamCode: "Barca",
    awayTeamCode: "Sevilla",
    matchDay: "03",
    matchID: "003",
    stadium: "El Pizjuan",
    time: "09:00 PM"
  ),
];






//////////////////// Stats 


List <MatchDayStats> stats=[
  MatchDayStats(
    goalConceded:3,
    goalScored: 2,
    headtoHead: 5,
    loss: 3,
    wins: 2
    ),
    MatchDayStats(
    goalConceded:3,
    goalScored: 4,
    headtoHead: 5,
    loss: 2,
    wins: 2
    ),MatchDayStats(
    goalConceded:3,
    goalScored: 7,
    headtoHead: 10,
    loss: 1,
    wins: 4
    ),
];