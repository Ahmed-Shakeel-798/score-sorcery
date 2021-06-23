import 'package:flutter/material.dart';
import 'package:fyp/Screens/HomeScreen.dart';
import 'package:fyp/constants.dart';
import 'package:provider/provider.dart';
import 'Data/providerdata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VariableSettings>.value(
      value: VariableSettings(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Campton',
          //   textTheme: Theme.of(context).textTheme.apply(bodyColor: ColorSecondary),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
