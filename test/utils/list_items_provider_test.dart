import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ListItemsProvider.', () {
    List<SelectListItem<int>> _items = [];

    setUpAll(() {
      ListItemsProvider.clear();

      _items = [
        new SelectListItem<int>(1, 'first item'),
        new SelectListItem<int>(2, 'second item'),
        new SelectListItem<int>(3, 'third item'),
      ];
    });

    test('Register a service with <int> items without throwing an exception.', () async {
      ListItemsProvider.register<int>('getItems', () {
        return _items;
      });
    });

    test('Register a service with <int> items and consume it.', () async {
      ListItemsProvider.register<int>('getItems', () {
        return _items;
      });
      Function service = ListItemsProvider.provide<int>('getItems');
      List<SelectListItem<int>> receivedItems = service() as List<SelectListItem<int>>;

      expect(_items.length, receivedItems.length);
    });

    // test('Service provide local data.', () async {
    //   List<SelectListItem<int>> items = [
    //     new SelectListItem<int>(1, '1'),
    //     new SelectListItem<int>(2, '2'),
    //     new SelectListItem<int>(3, '3'),
    //   ];
    //   ListItemsProvider.register('getItems', () {
    //     return items;
    //   });
    //   Function f = ListItemsProvider.get('getItems');
    //   List<SelectListItem<int>> tempData = await f();
    //   expect(tempData, items);
    //   ListItemsProvider.close('getItems');
    // });

    // test('Service provide global data. It can be changed outside.', () async {
    //   List<SelectListItem<int>> items = [
    //     new SelectListItem<int>(1, '1'),
    //     new SelectListItem<int>(2, '2'),
    //     new SelectListItem<int>(3, '3'),
    //   ];
    //   ListItemsProvider.register('getItems', () {
    //     return items;
    //   });
    //   Function f = ListItemsProvider.get('getItems');

    //   // before adding items in the list, the service must return [1, 2, 3, 4]
    //   items.add(new SelectListItem<int>(4, '4'));
    //   List<SelectListItem<int>> tempData = await f();
    //   expect(tempData, items);
    //   ListItemsProvider.close('getItems');
    // });
  });
}
