import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<dynamic> getHeadToHeadDataFromApi(var teamA_id, var teamB_id) async {
  //////////////////////////////////////////////////////////////////////// FETCH HEAD TO HEAD DATA
  var url =
      "https://score-sorcery.herokuapp.com/match/fetch_comparision?limit=5&page=0&sort=desc&teamA_Id=" +
          teamA_id.toString() +
          "&teamB_Id=" +
          teamB_id.toString();
  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'image/png',
  });
  var result = jsonDecode(response.body);
  var headToHeadData = {
    teamA_id: result["teamA_stats"],
    teamB_id: result["teamB_stats"],
  };
  return headToHeadData;
}

Future<dynamic> getStarting11(var match_id) async {
  print("inside getStarting11");
  var url =
      "https://score-sorcery.herokuapp.com/starting_xi/fetch_starting_xi?match_id=" +
          match_id.toString();
  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'image/png',
  });
  var result = jsonDecode(response.body);
  var starting11 = {
    result["teamSquads"][0]["team_id"]: result["teamSquads"][0]["players"],
    result["teamSquads"][1]["team_id"]: result["teamSquads"][1]["players"],
  };
  return starting11;
}

Future<List> getPlayerNames(List squadIds) async {
  print("inside get player names");
  List squadName = [];
  for (int i = 0; i < squadIds.length; i++) {
    var url = "https://score-sorcery.herokuapp.com/player/fetch_player/" +
        squadIds[i].toString();
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'image/png',
    });
    var result = jsonDecode(response.body);
    squadName.add(result["result"]["name"]);
  }
  return squadName;
}

Future<List> getPredictionsFromDB(String leagueName, int page) async {
  List matches;
  if (leagueName == "Serie A") {
    leagueName = "Se";
  }
  var url =
      "https://score-sorcery.herokuapp.com/prediction/fetch_prediction?limit=3&page=" +
          page.toString() +
          "&sort=desc&league=" +
          leagueName;
  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'image/png',
  });
  var result = jsonDecode(response.body);
  matches = result["predictions"];
  return matches;
}
