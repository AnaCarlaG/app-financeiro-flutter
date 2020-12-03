import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BlocBase {
  final _userController = BehaviorSubject();

  Map<String, Map<String, dynamic>> _users = {};
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserBloc() {
    _addUserListenner();
  }

  void _addUserListenner() {
    _firestore.collection("user").snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((element) {
        String uid = element.doc.id;
        switch (element.type) {
          case DocumentChangeType.added:
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            break;
        }
      });
    });
  }

  @override
  void dispose() {
    _userController.close();
  }
}
