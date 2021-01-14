import 'package:example/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:queries/collections.dart';

class AddBook extends StatefulWidget {
  static const String routeName = '/addBook';
  final Book book;

  const AddBook({Key key, this.book}) : super(key: key);

  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final List<SelectListItem<ELiteraryGenre>> literaryGenres = [
    new SelectListItem<ELiteraryGenre>(ELiteraryGenre.Poetry, 'Poetry'),
    new SelectListItem<ELiteraryGenre>(ELiteraryGenre.Drama, 'Drama'),
    new SelectListItem<ELiteraryGenre>(ELiteraryGenre.Prose, 'Prose'),
    new SelectListItem<ELiteraryGenre>(ELiteraryGenre.Fiction, 'Non-fiction'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add book"),
      ),
      body: Column(
        children: [
          //getTitle(),
        ],
      ),
    );
  }

  Widget getTitle() => new TextFormField(
        decoration: InputDecoration(
          icon: new Icon(Icons.person),
          labelText: 'Title',
          hintText: 'Title',
        ),
        keyboardType: TextInputType.text,
        onChanged: (String value) {
          widget.book.title.value = value;
        },
      );

  Widget getLiteraryGenres() => new MultiSelectDialogField(
        items: Collection(this.literaryGenres)
            .select((arg1) =>
                new MultiSelectItem<ELiteraryGenre>(arg1.value, arg1.text))
            .toList(),
        title: Text("Literary genres"),
        selectedColor: Colors.blue,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(40)),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
        ),
        buttonIcon: Icon(
          Icons.pets,
          color: Colors.blue,
        ),
        buttonText: Text(
          "Validate",
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 16,
          ),
        ),
        onConfirm: (List<ELiteraryGenre> results) {
          //_selectedAnimals = results;
        },
      );
}
