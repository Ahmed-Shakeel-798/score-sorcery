import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

ImageProvider image;
getUser() async {
  // score-sorcery.herokuapp.com

  var url = 'http://localhost:3000/player/fetch_avatar/33';
  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    // "Access-Control-Allow-Origin: *"
    'Accept': 'image/png',
    // 'Authorization': token,
  });
  //print("response status: ${response.statusCode}");
  //print("response body: ${response.body}");
  var result = response.bodyBytes;
  image = MemoryImage(result);
  print(result.runtimeType);
  print(image);
  print(response.statusCode);
  // return image;
  // return([response.statusCode,result]);
}

class LineUp extends StatefulWidget {
  @override
  _LineUpState createState() => _LineUpState();
}

class _LineUpState extends State<LineUp> {
  // ImageProvider image;
  @override
  // void initState() async {
  //   // TODO: implement initState
  //   image = await getUser();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // getUser().then((value) => {
    //   print(value)
    // });
    getUser();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  image != null ? image : AssetImage('lib/images/Barca.png'))),
    );
    // while(image!=null){

    // }

    // if(image == null){
  }
}
