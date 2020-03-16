
import 'package:flutter/material.dart';
import 'new_post_screen.dart';
import '../models/post_object.dart';
import '../widgets/post_list.dart';

class ListScreen extends StatefulWidget{

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Wasteagram ' + PostObject.tot.toString()),),
      body: postList(),
      floatingActionButton: Semantics(
        child: Builder(builder: (context){return FloatingActionButton(onPressed: () { getNewPost();}, child: Icon(Icons.add), backgroundColor: Colors.blue,);}),
        button: true,
        enabled: true,
        onTapHint: 'start new post',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

    void getNewPost(){
      Navigator.push(context, MaterialPageRoute(builder: (_) => NewPostScreen(),),);
  }

}
