import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ListItemsProvider.', () {
    test('Register, get and close a service.', () async {
      List<SelectListItem<int>> items = [];
      ListItemsProvider.register('getItems', () {
        return items;
      });
      Function f = ListItemsProvider.get('getItems');
      expect(f(), items);
      ListItemsProvider.close('getItems');
    });

    test('Service provide local data.', () async {
      List<SelectListItem<int>> items = [
        new SelectListItem<int>(1, '1'),
        new SelectListItem<int>(2, '2'),
        new SelectListItem<int>(3, '3'),
      ];
      ListItemsProvider.register('getItems', () {
        return items;
      });
      Function f = ListItemsProvider.get('getItems');
      List<SelectListItem<int>> tempData = await f();
      expect(tempData, items);
      ListItemsProvider.close('getItems');
    });

    test('Service provide global data. It can be changed outside.', () async {
      List<SelectListItem<int>> items = [
        new SelectListItem<int>(1, '1'),
        new SelectListItem<int>(2, '2'),
        new SelectListItem<int>(3, '3'),
      ];
      ListItemsProvider.register('getItems', () {
        return items;
      });
      Function f = ListItemsProvider.get('getItems');

      // before adding items in the list, the service must return [1, 2, 3, 4]
      items.add(new SelectListItem<int>(4, '4'));
      List<SelectListItem<int>> tempData = await f();
      expect(tempData, items);
      ListItemsProvider.close('getItems');
    });
  });
}
