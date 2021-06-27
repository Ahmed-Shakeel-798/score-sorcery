import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import "providerSupport.dart";

Future<ImageProvider> getUserImage(var id) async {
  // score-sorcery.herokuapp.com
  ImageProvider image;
  var url = 'https://score-sorcery.herokuapp.com/player/fetch_avatar/' + '1753';
  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'image/png',
  });

  // print(result);
  try {
    print("tryning to decode");
    var result = response.bodyBytes;
    image = MemoryImage(result);
  } catch (e) {
    print("caight error");
    return null;
  }

  // print(result.runtimeType);
  // print(image);
  // print(response.statusCode);
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
  var url = 'https://score-sorcery.herokuapp.com/team/fetch_avatar/' + teamId;
  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'image/png',
  });
  var result = response.bodyBytes;
  image = MemoryImage(result);
  print("decoded successfully");
  // print(result.runtimeType);
  // print(image);
  // print(response.statusCode);
  if (response.statusCode == 404) {
    return null;
  }
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
      String refree = tempMatches[i]["refree"];
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
        "teamA_id": teamA_id,
        "teamB_id": teamB_id,
        "imageA": imageA,
        "imageB": imageB,
        "refree": refree,
      });
    }
    // print(matches);
    notifyListeners();
  }

  Future<List> removeAllMatches() async {
    matches = [];
    notifyListeners();
  }

  // stats particular data (head to head)
  List headToHeadData = [];
  List teamA_starting11 = [];
  List teamB_starting11 = [];
  List get getheadToHeadData => headToHeadData;
  List get getTeamA_starting11 => teamA_starting11;
  List get getTeamB_starting11 => teamB_starting11;

  Future<List> removeStatsHeadToHeadData() {
    headToHeadData = [];

    teamA_starting11 = [];
    teamB_starting11 = [];
    notifyListeners();
  }

//, fetchedMatch["match_id"]
  Future<List> fetchHeadToHeaddata(fetchedMatch) async {
    print("in fetched head to head");
    // fetch head to head data
    var headToHeadDataObj = await getHeadToHeadDataFromApi(
        fetchedMatch["teamA_id"], fetchedMatch["teamB_id"]);
    headToHeadData.add(headToHeadDataObj);

    var starting11 = await getStarting11(fetchedMatch["match_id"]);
    teamA_starting11 = starting11[fetchedMatch["teamA_id"]];
    teamB_starting11 = starting11[fetchedMatch["teamB_id"]];

    // fetch starting 11 player names
    teamA_starting11 = await getPlayerNames(teamA_starting11);
    teamB_starting11 = await getPlayerNames(teamB_starting11);

    print(headToHeadData);
    print(teamA_starting11);
    print(teamB_starting11);
    notifyListeners();
    return [200];
  }

  // fetch predictions
  List predictions = [];
  List get getPredictions => predictions;

  Future<List> fetchPredictions(String leagueName, int pages) async {
    List tempMatches = await getPredictionsFromDB(leagueName, pages);
    for (int i = 0; i < tempMatches.length; i++) {
      String stadium = tempMatches[i]["stadium"];
      // String refree = tempMatches[i]["refree"];
      int match_id = tempMatches[i]["match_id"];
      int teamA_percentage = tempMatches[i]["teamA_percentage"];
      int teamB_percentage = tempMatches[i]["teamB_percentage"];
      int teamA_id = tempMatches[i]["teamA_id"];
      int teamB_id = tempMatches[i]["teamB_id"];

      ImageProvider imageA = await getTeamImage(teamA_id.toString());
      ImageProvider imageB = await getTeamImage(teamB_id.toString());

      predictions.add({
        "stadium": stadium,
        "match_id": match_id,
        "teamA_percentage": teamA_percentage,
        "teamB_percentage": teamB_percentage,
        "teamA_id": teamA_id,
        "teamB_id": teamB_id,
        "imageA": imageA,
        "imageB": imageB,
      });
    }
    // print(matches);
    notifyListeners();
  }

  Future<List> removeAllPredictions() async {
    predictions = [];
    notifyListeners();
  }

  // head to head for predictions
  List predictionHeadToHead = [];
  // List predictionHeadToHeadS = [];
  List get getPredictionHeadToHead => predictionHeadToHead;
  Future<List> fetchPredictionHeadToHeaddata(fetchedMatch) async {
    print("in fetched head to head prediction");
    // fetch head to head data
    var headToHeadDataObj = await getHeadToHeadDataFromApi(
        fetchedMatch["teamA_id"], fetchedMatch["teamB_id"]);
    headToHeadData.add(headToHeadDataObj);

    print(headToHeadData);
    notifyListeners();
    return [200];
  }

  Future<List> removePredictionsHeadToHead() async {
    predictionHeadToHead = [];
    notifyListeners();
  }
}
