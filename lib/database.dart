import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseClass {
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static CollectionReference mycoll = firebaseFirestore.collection('mycoll');

  static addData(String name, String pass) {
    mycoll.doc().set({
      'name': name,
      'pass': pass,
    });
  }
}
