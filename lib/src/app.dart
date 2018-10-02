import 'package:flutter/material.dart';
import 'models/image_model.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'Widgets/image_list.dart';


class App extends StatefulWidget{

  @override
    State<App> createState() {
      // TODO: implement createState
      return new AppState();
    }

}



class AppState extends State<App> {
  
  int counter = 0;

  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response = await get("https://jsonplaceholder.typicode.com/photos/$counter");
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }


  Widget build(context){
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Photo API")
          ),

          body: ImageList(images),

          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: fetchImage,
          ),

        )
    );
  }
  
}