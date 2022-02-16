import 'package:flutter/material.dart';
import 'package:library_exercice/models/book.dart';
import 'package:library_exercice/services/book_service.dart';


class BooksList extends StatelessWidget {
  static const route = "/books";

  final BookService _bookService = BookService();

  get floatingActionButton => null;

  Future<List<Book>> _getAllBooks() {
    return _bookService.findAll();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: null,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Liste des livres'),
              FutureBuilder<List<Book>>(
                  future: _getAllBooks(),
                  builder: (BuildContext context, AsyncSnapshot data) {
                    if (data.hasError) {
                      return Text('Erreur de chargement de la liste');
                    }
                    if (data.connectionState == ConnectionState.waiting) {
                      return Text('chargement...');
                    }
                    List<Book> listBooks = data.data;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: listBooks.length,
                        itemBuilder: (BuildContext context, int index) {
                          Book book = listBooks[index];
                          return ListTile(
                            title: Text(book.title),
                            subtitle: Text(book.description),

                          );
                        }
                    );
                  }
              ),

            ],
          ),
        )

    );
  }

}



