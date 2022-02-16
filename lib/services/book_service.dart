import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_exercice/models/book.dart';

class BookService {
  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection('books');

   Future<void> addBook(Book book){
    return _collectionReference.add(book.toJson());
  }

  findAll() {
    return _collectionReference
        .get()
        .then((value) =>
        value.docs.map((e) {
        return Book.fromJson(e.data() as Map<String, dynamic>);
        }).toList());
    }

}

