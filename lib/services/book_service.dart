import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_exercice/models/book.dart';

class BookService{
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('books');

  addBook(){
    Book book = Book(title: 'title', description: 'description');
    _collectionReference.add(book.toJson());
  }
  findAll(){
    _collectionReference.get().then((value) => value.docs.map((e) => e.data()).toList());

  }

}