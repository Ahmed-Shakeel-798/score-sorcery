import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data/providerdata.dart';

class LineUp extends StatefulWidget {
  @override
  _LineUpState createState() => _LineUpState();
}

class _LineUpState extends State<LineUp> {
  @override
  Widget build(BuildContext context) {
    final VariableSettings variableSettings =
        Provider.of<VariableSettings>(context);
    ImageProvider image;
    //  = variableSettings.image;
    // variableSettings.getPlayerImage();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  image != null ? image : AssetImage('lib/images/Barca.png'))),
    );
  }
}
