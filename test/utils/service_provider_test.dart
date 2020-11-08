import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ServiceProvider.', () {
    test('Register, get and close a service.', () async {
      ServiceProvider.register('getItems', () {
        return null;
      });
      Function f = ServiceProvider.get('getItems');
      ServiceProvider.close('getItems');
    });

    test('Service provide local data.', () async {
      ServiceProvider.register('getItems', () {
        return [1, 2, 3];
      });
      Function f = ServiceProvider.get('getItems');
      List<int> tempData = await f();
      expect(tempData, [1, 2, 3]);
      ServiceProvider.close('getItems');
    });

    test('Service provide global data. It can be changed outside.', () async {
      List<int> data = [1, 2, 3];
      ServiceProvider.register('getItems', () {
        return data;
      });
      Function f = ServiceProvider.get('getItems');

      // before adding items in the list, the service must return [1, 2, 3]
      List<int> tempData1 = await f();
      expect(tempData1, [1, 2, 3]);

      // before adding items in the list, the service must return [1, 2, 3, 4]
      data.add(4);
      List<int> tempData2 = await f();
      expect(tempData2, [1, 2, 3, 4]);
      ServiceProvider.close('getItems');
    });
  });
}
