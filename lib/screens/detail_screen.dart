
import 'package:flutter/material.dart';
import '../models/post_object.dart';

class ItemDetails extends StatelessWidget {

  final PostObject item;

  ItemDetails({Key key, this.item}) : super(key: key);
  //ItemDetails({@required this.item});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Wasteagram'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( item.dateStr(),),
            SizedBox(height: 120, width: 120, child: Image.network(item.imageURL),),
            Text('items: ' + item.quantity.toString(),),
            Text(item.locationStr(),),
          ],
        ),
      ),
    );

  }
}