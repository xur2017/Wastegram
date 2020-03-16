
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/post_object.dart';
import 'package:intl/intl.dart';
import '../screens/detail_screen.dart';

Widget postList(){

  return StreamBuilder(
    stream: Firestore.instance.collection('posts').orderBy('date', descending: true).snapshots(),
    builder: (content, snapshot){
      if(snapshot.data.documents.length != 0){
        PostObject.tot = 0;
        return Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index){
                  var post = snapshot.data.documents[index];
                  PostObject.tot = PostObject.tot + post['quantity'];
                  return ListTile(
                    leading: Text( DateFormat('EEEE, MMM dd').format(post['date'].toDate()) , style: TextStyle(fontSize: 18.0,), ),
                    title: Text( post['quantity'].toString() ),
                    onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_) => ItemDetails(item: PostObject(date:post['date'].toDate(), imageURL:post['imageURL'],quantity:post['quantity'],latitude:post['latitude'],longitude:post['longitude'],),),)); },
                    );
                },
              ),
            ),
          ],
        );
      }
      else{
        return Center(child: CircularProgressIndicator());
      }
    }
  );
}