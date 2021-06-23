import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

Future<ImageProvider> getUserImage(var id) async {
  // score-sorcery.herokuapp.com
  ImageProvider image;
  var url = 'https://score-sorcery.herokuapp.com/player/fetch_avatar/' + '1753';
  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'image/png',
  });
  var result = response.bodyBytes;
  image = MemoryImage(result);

  // print(result.runtimeType);
  // print(image);
  print(response.statusCode);
  return image;
}

Future<List> getSquadIds(String teamName) async {
  List squadIds;
  var url =
      "https://score-sorcery.herokuapp.com/team/fetch_team_by_name?name=" +
          teamName;
  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'image/png',
  });
  var result = jsonDecode(response.body);
  var seasons = result["team"][0]["season_info"];
  var lastSeason = seasons.length - 1;
  squadIds = seasons[lastSeason]["player_ids"];
  return squadIds;
}

Future<List> getMatchesFromDB(String leagueName, int page) async {
  List matches;
  var url =
      "https://score-sorcery.herokuapp.com/match/fetch_matches?limit=10&page=" +
          page.toString() +
          "&sort=desc&league=" +
          leagueName;
  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'image/png',
  });
  var result = jsonDecode(response.body);
  matches = result["matches"];
  return matches;
}

Future<ImageProvider> getTeamImage(String teamId) async {
  ImageProvider image;
  var url = 'https://score-sorcery.herokuapp.com/team/fetch_avatar/' + '1';
  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'image/png',
  });
  var result = response.bodyBytes;
  image = MemoryImage(result);

  // print(result.runtimeType);
  // print(image);
  print(response.statusCode);
  return image;
}

class VariableSettings extends ChangeNotifier {
  List squadIds = [];
  List idsInListView = [];
  var imageDict = {};

  // ImageProvider get getImage => image;
  List get getSquad => squadIds;
  List get getInListView => idsInListView;
  get getImageDict => imageDict;

  Future<List> getPlayerImage(var id) async {
    ImageProvider image = await getUserImage(id.toString());
    imageDict[id] = image;
    notifyListeners();
    return ([200]);
  }

  Future<List> fetchSquadIds(String teamName) async {
    squadIds = await getSquadIds(teamName);
    idsInListView = squadIds;
    for (int i = 0; i < squadIds.length; i++) {
      await getPlayerImage(squadIds[i]);
    }
    notifyListeners();
    return ([200]);
  }

  void RemoveFromIdsInListView(var id) {
    idsInListView.remove(id);
    notifyListeners();
  }

  void addIdsInListView(var id) {
    idsInListView.add(id);
    notifyListeners();
  }

  ImageProvider fetchImageById(var id) {
    return imageDict[id];
  }

  // stats data
  List matches = [];
  List get getMatches => matches;

  Future<List> fetchRecentMatches(String leagueName, int pages) async {
    List tempMatches = await getMatchesFromDB(leagueName, pages);
    for (int i = 0; i < tempMatches.length; i++) {
      String stadium = tempMatches[i]["stadium"];
      int match_id = tempMatches[i]["match_id"];
      int teamA_goals = tempMatches[i]["teamA_goals"];
      int teamB_goals = tempMatches[i]["teamB_goals"];
      int teamA_id = tempMatches[i]["teamA_id"];
      int teamB_id = tempMatches[i]["teamB_id"];

      ImageProvider imageA = await getTeamImage(teamA_id.toString());
      ImageProvider imageB = await getTeamImage(teamB_id.toString());

      matches.add({
        "stadium": stadium,
        "match_id": match_id,
        "teamA_goals": teamA_goals,
        "teamB_goals": teamB_goals,
        "imageA": imageA,
        "imageB": imageB
      });
    }
    print(matches);
    notifyListeners();
  }
}
