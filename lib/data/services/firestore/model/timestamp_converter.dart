import 'package:cloud_firestore/cloud_firestore.dart';

DateTime timeFromJson(dynamic timestamp) {
  return timestamp.toDate();
}
Timestamp timeToJson(DateTime date) {
  return Timestamp.fromDate(date);
}