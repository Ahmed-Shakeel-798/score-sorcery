//import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:fyp/components/CustomAppBar.dart';
import 'package:provider/provider.dart';
import '../Data/providerdata.dart';

// overwritten by POPUP
var teamName = "Barcelona";

class LineupBuilder extends StatefulWidget {
  @override
  _LineupBuilderState createState() => _LineupBuilderState();
}

class _LineupBuilderState extends State<LineupBuilder> {
  bool callFetchSquadIds;

  @override
  void initState() {
    super.initState();
    callFetchSquadIds = true;
  }

  @override
  Widget build(BuildContext context) {
    final VariableSettings variableSettings =
        Provider.of<VariableSettings>(context);
    List squadIds = variableSettings.squadIds;
    if (callFetchSquadIds) {
      variableSettings.fetchSquadIds(teamName);
      callFetchSquadIds = false;
    }
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarMade(
                selectedIndex: 3,
              ),
              SizedBox(
                height: 20,
              ),
              squadIds.length == 0
                  ? Container()
                  : Builder(
                      squadIds: squadIds,
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class Builder extends StatefulWidget {
  final List squadIds;
  Builder({this.squadIds});
  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<Builder> {
  final Map<String, bool> score = {};
  @override
  Widget build(BuildContext context) {
    final VariableSettings variableSettings =
        Provider.of<VariableSettings>(context);
    List idsInListView = variableSettings.idsInListView;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.10,
// color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
// color: Colors.white,
// width: 100,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: ListViewBuild(idsInListView),
                )
              ],
            ),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.75,
// color: Colors.blueAccent,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/images/BuilderScreen.png"))),
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                      ]),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                      ]),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                      ]),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                      ]),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                      ]),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                      ]),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                        _builDragTarget(
                          name: "",
                        ),
                      ]),
                ],
              ),
            )),
      ],
    );
  }

  ListView ListViewBuild(List idsInListView) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: idsInListView.length,
      itemBuilder: (context, index) => Draggable(
        data: idsInListView[index].toString(),
        child: Player(name: idsInListView[index].toString()),
        feedback: Player(name: idsInListView[index].toString()),
        childWhenDragging: Player(name: idsInListView[index].toString()),
      ),
    );
  }
}

class Player extends StatefulWidget {
  final String name;

  Player({this.name});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    final VariableSettings variableSettings =
        Provider.of<VariableSettings>(context);
    ImageProvider image =
        variableSettings.fetchImageById(int.parse(widget.name));
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: image != null
                      ? image
                      : AssetImage('lib/images/Barca.png'))),
          height: 60,
          width: 60,
        ));
//child: Image.asset(name));
  }
}

class _builDragTarget extends StatefulWidget {
  var name;
  _builDragTarget({this.name});

  @override
  __builDragTargetState createState() => __builDragTargetState();
}

class __builDragTargetState extends State<_builDragTarget> {
  bool accepted = false;
  var defaultName = "";
  @override
  Widget build(BuildContext context) {
    final VariableSettings variableSettings =
        Provider.of<VariableSettings>(context);
    ImageProvider image = accepted && defaultName != ""
        ? variableSettings.fetchImageById(int.parse(defaultName))
        : null;
    return Container(
      //margin: EdgeInsets.all(10),
      child: DragTarget(
        builder: (BuildContext context, List<String> incoming, List rejected) {
          return accepted && defaultName != ""
              ? Container(
                  color: Colors.transparent,
                  height: 70,
                  width: 60,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.teal,
                        height: 10,
                        width: 60,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(Icons.cut_sharp),
                          onPressed: () {
                            setState(() {
                              print(defaultName);
                              variableSettings
                                  .addIdsInListView(int.parse(defaultName));
                              accepted = false;
                              defaultName = "";
                            });
                          },
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: image != null
                                    ? image
                                    : AssetImage('lib/images/Barca.png'))),
                      ),
                    ],
                  ),
                )
              : Container(
                  color: defaultName == ""
                      ? Colors.transparent
                      : Colors.transparent,
                  height: 70,
                  width: 60,
                  child: Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.transparent,
                      child: Text(defaultName),
                    ),
                  ));
        },
        onWillAccept: (data) {
          if (defaultName == "") {
// print(data);
            return true;
          } else {
            return false;
          }
        },
        onAccept: (data) {
          setState(() {
            print("True");
            defaultName = data;
            widget.name = data;
            variableSettings.RemoveFromIdsInListView(int.parse(data));
            accepted = true;
          });
        },
        onLeave: (data) {
          print("False");
          setState(() {
            variableSettings.addIdsInListView(int.parse(data));
            if (defaultName == "") {
              accepted = false;
            }
          });
        },
      ),
    );
  }
}
