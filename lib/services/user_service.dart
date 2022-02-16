import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_exercice/models/user.dart';

class UserService{
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('users');

  addUser(){
    User user = User(name: 'test', mdp: 'test');
    _collectionReference.add(user.toJson());
  }
  findAll(){
    _collectionReference.get().then((value) => value.docs.map((e) => e.data()).toList());
  }
  findOne(String userName) async {
    print("c'est toi qui est null $userName");
    var result = await _collectionReference.where("name", isEqualTo: userName ).snapshots();
    //var result = _collectionReference.where("name", isEqualTo: userName).get().then((value) => value.toString());
    print(result);
  }

}