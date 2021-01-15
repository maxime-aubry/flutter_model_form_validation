import 'package:date_time_picker/date_time_picker.dart';
import 'package:example/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:queries/collections.dart';
import 'package:smart_select/smart_select.dart';

class AddBook extends StatefulWidget {
  static const String routeName = '/addBook';
  final Book book;

  const AddBook({Key key, this.book}) : super(key: key);

  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  Color get primaryColor => Theme.of(context).primaryColor;

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
          hintText: 'Title of the book',
        ),
        keyboardType: TextInputType.text,
        onChanged: (String value) {
          widget.book.title.value = value;
        },
      ));

  Widget getLiteraryGenres() => new Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: SmartSelect<ELiteraryGenre>.multiple(
          title: 'Literary genres',
          value: widget.book.literaryGenres.value,
          choiceItems: S2Choice.listFrom<ELiteraryGenre, Map>(
            source: Collection(this.literaryGenres)
                .select((arg1) => {'key': arg1.value, 'value': arg1.text})
                .toList(),
            value: (index, item) => item['key'],
            title: (index, item) => item['value'],
          ),
          onChange: (state) =>
              setState(() => widget.book.literaryGenres.value = state.value),
          modalType: S2ModalType.bottomSheet,
          modalConfirm: true,
          modalFilter: true,
          choiceGrouped: false,
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
            );
          },
        ),
      );

  Widget getRealeaseDate() => new Padding(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: new DateTimePicker(
          decoration: InputDecoration(
            labelText: 'Release date',
            hintText: 'Release date of the book',
          ),
          type: DateTimePickerType.date,
          dateMask: 'd MMM, yyyy',
          firstDate: new DateTime(0),
          lastDate: DateTime.now(),
          icon: Icon(Icons.event),
          dateLabelText: 'Release date',
          onChanged: (String value) {
            widget.book.releaseDate.value = DateFormat('yyyy-M-d').parse(value);
          },
        ),
      );

  Widget getPrice() => new Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: new TextFormField(
        decoration: InputDecoration(
          labelText: 'Price',
          hintText: 'Price of the book',
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        onChanged: (String value) {
          widget.book.title.value = value;
        },
      ));
}
