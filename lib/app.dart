
import 'package:flutter/material.dart';
import 'models/post_object.dart';
import 'screens/list_screen.dart';

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    PostObject.tot = 0;
    return MaterialApp(title: 'Wasteagram', home: ListScreen(),);
  }
}