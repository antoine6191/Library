import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_exercice/models/user.dart';

class UserService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  addUser() {
    User user = User(name: 'test', mdp: 'test');
    _collectionReference.add(user.toJson());
  }

  findAll() {
    return _collectionReference.get().then((value) => value.docs.map((e) {
          return User.fromJson(e.data() as Map<String, dynamic>);
        }).toList());
  }

  Future<List<User>> findOne(String userName) {
    return _collectionReference.where("name", isEqualTo: userName).get().then((value){
       return value.docs.map((doc) {
       return User.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
    }
}
