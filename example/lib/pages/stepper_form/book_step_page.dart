import 'package:example/models.dart';
import 'package:example/pages/stepper_form/add_book_page.dart';
import 'package:example/pages/stepper_form/slidable_book.dart';
import 'package:example/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:provider/provider.dart';

class BooksStepPage extends StatefulWidget {
  @override
  _BooksStepPageState createState() => new _BooksStepPageState();
}

class _BooksStepPageState extends State<BooksStepPage> {
  @override
  Widget build(BuildContext context) {
    return new FormGroupConsumer<BooksStep>(
      builder: (context, booksStep, child) => Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider.value(
                        value: booksStep.books,
                        child: AddBookPage(),
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.add, size: 18),
                label: Text("Add book"),
              ),
              /*child: new FormArrayProvider<Book, FormArrayElement<Book>>(
                create: (context) => booksStep.books,
                child:
              ),*/
            ),
          ),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: booksStep.books.value.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final item = booksStep.books.value[index];

              return SlidableBook(
                child: buildListTile(item),
                onDismissed: (action) => dismissSlidableItem(
                  context,
                  index,
                  action,
                  booksStep,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildListTile(Book item) => ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        title: Text(
          item.title.value,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () {},
      );

  void dismissSlidableItem(
    BuildContext context,
    int index,
    SlidableAction action,
    BooksStep booksStep,
  ) {
    setState(() {
      booksStep.books.value.removeAt(index);
    });

    switch (action) {
      case SlidableAction.edit:
        Utils.showSnackBar(context, 'Editing...');
        break;
      case SlidableAction.delete:
        Utils.showSnackBar(context, 'Book has been deleted');
        break;
    }
  }
}
