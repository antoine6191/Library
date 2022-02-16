import 'package:flutter/material.dart';
import 'package:library_exercice/models/book.dart';
import 'package:library_exercice/services/book_service.dart';

class BookCreationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _numeroIsbnController = TextEditingController();
  final TextEditingController _numeroCodeBarreController =
      TextEditingController();
  final BookService _bookService = BookService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Titre'),
                controller: _titleController,
                validator: (text) {
                  text!.isEmpty
                      ? 'veuiller entrer un nom'
                      : _titleController.text = text;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Description'),
                controller: _descriptionController,
                validator: (text) {
                  text!.isEmpty
                      ? 'veuiller entrer un nom'
                      : _descriptionController.text = text;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Genre'),
                controller: _genreController,
                validator: (text) {
                  text!.isEmpty
                      ? 'veuiller entrer un nom'
                      : _genreController.text = text;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Numéro Isbn'),
                controller: _numeroIsbnController,
                validator: (text) {
                  text!.isEmpty
                      ? 'veuiller entrer un nom'
                      : _numeroIsbnController.text = text;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Numéro code barre'),
                controller: _numeroCodeBarreController,
                validator: (text) {
                  text!.isEmpty
                      ? 'veuiller entrer un nom'
                      : _numeroCodeBarreController.text = text;
                },
              ),
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Annuler',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )),
                  SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (Set<MaterialState> states) =>
                                  Theme.of(context).primaryColor)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Book book = Book(
                              title: _titleController.text,
                              description: _descriptionController.text);
                          _bookService.addBook(book);
                          // Scaffold.of(context).showBottomSheet((context) =>
                          //     SnackBar(content: Text('Enregistré !!')));
                        }
                      },
                      child: Text('Valider'))
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/barcode');
                  },
                  child: Text(
                    'Ajouter un code',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
