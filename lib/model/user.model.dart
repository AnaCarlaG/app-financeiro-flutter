import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User firebaseUser;
  Map<String, dynamic> userData = Map();
  bool isLoading = false;

  void signup(
      {@required Map<String, dynamic> userData,
      @required String password,
      @required VoidCallback onSucess,
      @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(
          email: userData["email"],
          password: password,
        )
        .then((user) async => {
              firebaseUser = user.user,
              await _saveUserData(userData),
              onSucess(),
              isLoading = false,
            })
        .catchError((erro) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void signin() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
  }

  void recoverPass() {}
  bool isLoggedIn() {
    return firebaseUser != null;
  }

  Future _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;

    await FirebaseFirestore.instance
        .collection("user")
        .doc(firebaseUser.uid)
        .set(this.userData);
  }
}
