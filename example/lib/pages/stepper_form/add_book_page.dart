import 'package:date_time_picker/date_time_picker.dart';
import 'package:example/models.dart';
import 'package:example/widgets/custom_multidropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class AddBookPage extends StatefulWidget {
  static const String routeName = '/addBook';

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  Color get primaryColor => Theme.of(context).primaryColor;

  Book book = new Book();

  final List<SelectListItem<ELiteraryGenre>> literaryGenres = [
    new SelectListItem<ELiteraryGenre>(ELiteraryGenre.poetry, 'Poetry'),
    new SelectListItem<ELiteraryGenre>(ELiteraryGenre.drama, 'Drama'),
    new SelectListItem<ELiteraryGenre>(ELiteraryGenre.prose, 'Prose'),
    new SelectListItem<ELiteraryGenre>(ELiteraryGenre.fiction, 'Fiction'),
    new SelectListItem<ELiteraryGenre>(
        ELiteraryGenre.non_fiction, 'Non-fiction'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add book"),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            getTitle(),
            getLiteraryGenres(),
            getRealeaseDate(),
            getPrice(),
            getButtons(),
          ],
        ),
      ),
    );
  }

  Widget getTitle() => new Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: new TextFormField(
        decoration: InputDecoration(
          labelText: 'Title',
        ),
        keyboardType: TextInputType.text,
        onChanged: (String value) {
          this.book.title.value = value;
        },
      ));

  Widget getLiteraryGenres() => CustomMultiDropdown<ELiteraryGenre>(
        label: 'Literary genres',
        dataSource: this.literaryGenres,
        value: this.book.literaryGenres.value,
        onChange: (state) {
          this.book.literaryGenres.value = state.value;
        },
      );

  Widget getRealeaseDate() => new Padding(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: new DateTimePicker(
          decoration: InputDecoration(
            labelText: 'Release date',
          ),
          type: DateTimePickerType.date,
          dateMask: 'd MMM, yyyy',
          firstDate: new DateTime(0),
          lastDate: DateTime.now(),
          icon: Icon(Icons.event),
          dateLabelText: 'Release date',
          onChanged: (String value) {
            this.book.releaseDate.value = DateFormat('yyyy-M-d').parse(value);
          },
        ),
      );

  Widget getPrice() => new Padding(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: new TextFormField(
          decoration: InputDecoration(
            labelText: 'Price',
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          onChanged: (String value) {
            this.book.title.value = value;
          },
        ),
      );

  Widget getButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('CANCEL'),
          ),
          new FormArrayConsumer<Book>(
            builder: (context, books, child) => TextButton(
              onPressed: () {
                books.value.add(this.book);
                Navigator.of(context).pop();
              },
              child: Text('SAVE'),
            ),
          ),
          /*TextButton(
            onPressed: () {
              //books.add(this.book);
              Navigator.of(context).pop();
            },
            child: Text('SAVE'),
          ),*/
        ],
      );
}