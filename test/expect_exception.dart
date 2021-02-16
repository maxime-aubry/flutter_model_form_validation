import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

expect_exception<TException extends IException>(
    Function action, String message) {
  expect(
    () async {
      await action();
    },
    throwsA(
      isA<TException>().having(
        (error) => error.message,
        'description',
        message,
      ),
    ),
  );
}

/*
group('Valid.', () {});
group('Invalid.', () {});
group('Remote parameters.', () {});
group('Throws exception on parameters.', () {});
*/
