// import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
}

// create a class that will be our custom widget
// this class must extend the 'Stateless Widget' base class
// Stateless widget means widgets that contain NO data sources and data inside these widgets han NO change
class AppState extends State<App> {
  // must define a build method that returns the widgets that *this* widget will show

  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    // make a http request -> so we should import package for http request
    counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    // await means we should wait for getting back result from get method because the return of get is "Future"

    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text('Lets See Some Images'),
        ),
      ),
    );
  }
}
