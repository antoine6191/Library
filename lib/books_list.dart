import 'package:flutter/material.dart';


class BooksList extends StatelessWidget {
  static const route = "/books";

  // final List<Book> ListBooks = [
  //   Book(title:"", label:""),
  // ];
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Text('Liste des livres'),
            ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container();
                }
            )
          ],
        )

    );
  }
}

