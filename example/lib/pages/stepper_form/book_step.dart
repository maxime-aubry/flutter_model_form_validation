import 'package:example/models.dart';
import 'package:example/pages/stepper_form/add_book.dart';
import 'package:example/pages/stepper_form/slidable_book.dart';
import 'package:example/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';

class BooksStep extends StatefulWidget {
  final ModelFormState mfs;

  const BooksStep({Key key, this.mfs}) : super(key: key);

  @override
  _BooksStepState createState() => new _BooksStepState();
}

class _BooksStepState extends State<BooksStep> {
  List<Book> books;

  @protected
  void initState() {
    this.books = (widget.mfs.model as StepForm).books.value.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            child: TextButton.icon(
              onPressed: () {
                Book book = new Book(null, null, null, null);
                this.books.add(book);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBook(book: book)),
                );
              },
              icon: Icon(Icons.add, size: 18),
              label: Text("Add book"),
            ),
          ),
        ),
        ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: this.books.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            final item = this.books[index];

            return SlidableBook(
              child: buildListTile(item),
              onDismissed: (action) => dismissSlidableItem(
                context,
                index,
                action,
              ),
            );
          },
        ),
      ],
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
  ) {
    setState(() {
      this.books.removeAt(index);
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
