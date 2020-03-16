// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import '../lib/models/post_object.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('post_object variable', (){
    var now = DateTime.now();
    PostObject obj = PostObject(date: now, imageURL: 'example1.jpg', quantity: 3, latitude: 1.1, longitude: 2.2);
    
    expect(obj.date, now);
    expect(obj.imageURL, 'example1.jpg');
    expect(obj.quantity, 3);
    expect(obj.latitude, 1.1);
    expect(obj.longitude, 2.2);
  });
  test('post_object method', (){
    var now =  DateTime.parse('2020-03-16');
    PostObject obj = PostObject(date: now, imageURL: 'example1.jpg', quantity: 3, latitude: 1.1, longitude: 2.2);
    
    expect(obj.locationStr(), '(1.1, 2.2)');
    expect(obj.dateStr(), 'Monday, Mar 16, 2020');
  });
}
