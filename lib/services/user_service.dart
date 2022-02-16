import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_exercice/models/user.dart';

class UserService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  addUser(String name, String mdp) {
    User user = User(name: name, mdp: mdp);
    _collectionReference.add(user.toJson());
  }

  findAll() {
    return _collectionReference.get().then((value) => value.docs.map((e) {
          return User.fromJson(e.data() as Map<String, dynamic>);
        }).toList());
  }

  User findOne(String userName) {
    return _collectionReference.where("name", isEqualTo: userName).get().first().then((value){
       return value.docs.map((doc) {
       return User.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
    }
}
