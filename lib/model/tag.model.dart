import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

class TagModel extends Model {
  String name;
  bool registrado;
  User firebaseUser;
  Map<String, dynamic> tagData = Map();
  bool isLoading = true;

  TagModel({this.name, this.registrado});

  void CreatTag(@required Map<String, dynamic> tagData,
      @required VoidCallback onSucess, @required VoidCallback onFail) {
    isLoading = true;
    notifyListeners();
    _saveTagData(tagData).then((tag) {
      onSucess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      notifyListeners();
    });
  }

  void removeTag(String name) {
    FirebaseFirestore.instance.collection("tag").get(tagData.remove(name));
  }

  Future _saveTagData(Map<String, dynamic> tagData) async {
    this.tagData = tagData;

    await FirebaseFirestore.instance
        .collection("tag")
        .doc(firebaseUser.uid)
        .set(this.tagData);
  }
}
