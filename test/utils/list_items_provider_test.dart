import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ListItemsProvider.', () {
    List<SelectListItem<int>> _items = [];

    setUp(() {
      ListItemsProvider.clear();

      _items = [
        new SelectListItem<int>(1, 'first item'),
        new SelectListItem<int>(2, 'second item'),
        new SelectListItem<int>(3, 'third item'),
      ];
    });

    test(
        'Register a service with <int> items, from local datasource, without throwing an exception.',
        () async {
      ListItemsProvider.register<int>('getItems', () async {
        return _items;
      });
    });

    test(
        'Register a service with <int> items, from local datasource, and consume it.',
        () async {
      ListItemsProvider.register<int>('getItems', () async {
        return _items;
      });
      Future<List<SelectListItem<int>>> Function() service =
          ListItemsProvider.provide<int>('getItems');
      List<SelectListItem<int>> receivedItems = await service();
      expect(_items, equals(receivedItems));
    });

    test('Register and close a service.', () async {
      ListItemsProvider.register<int>('getItems', () async {
        return _items;
      });
      ListItemsProvider.close('getItems');
    });

    test('Cannot access to an service without its name.', () {
      expect(
        () {
          Future<List<SelectListItem<int>>> Function() service =
              ListItemsProvider.provide(null);
        },
        throwsA(
          isA<ListItemProviderException>().having((error) => error.message,
              'description', 'Service name is required.'),
        ),
      );
    });

    test('Cannot access to an non-registered service.', () {
      expect(
        () {
          Future<List<SelectListItem<int>>> Function() service =
              ListItemsProvider.provide('getItems');
        },
        throwsA(
          isA<ListItemProviderException>().having((error) => error.message,
              'description', 'Service name is not recognized.'),
        ),
      );
    });
  });
}
