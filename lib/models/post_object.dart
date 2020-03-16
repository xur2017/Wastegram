
import 'package:intl/intl.dart';

class PostObject{

  PostObject({this.date, this.imageURL, this.quantity, this.latitude, this.longitude});

  static int tot = 0;

  DateTime date;
  String imageURL;
  int quantity;
  double latitude;
  double longitude;

  String locationStr(){
    return '(' + latitude.toString() + ', ' + longitude.toString() + ')';
  }

  String dateStr(){
    return DateFormat('EEEE, MMM dd, yyyy').format(date);
  }

}