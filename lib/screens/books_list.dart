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
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          onPressed: (){
            Navigator.pushNamed(context, '/book');
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/cesi.png', width: 200.0,),
                SizedBox(height: 50.0,),
                Center(child: Text('Liste des livres', style: TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor),)),
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
                            return Card(
                              child: Padding(
                                padding:  EdgeInsets.only(left: 28.0, right: 28.0),
                                child: ExpansionTile(
                                  title: Text(book.title),
                                  subtitle: Text(book.description),
                                  leading: Icon(Icons.book, color: Theme.of(context).primaryColor,),
                                  children: [
                                    Text(book.description)
                                  ],
                                ),
                              ),
                            );
                          }
                      );
                    }
                ),

              ],
            ),
          ),
        )

    );
  }

}



