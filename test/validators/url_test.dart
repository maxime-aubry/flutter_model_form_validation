import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/models.dart';
import '../models/models.reflectable.dart';

void main() {
  initializeReflectable();

  group('URL.', () {
    group('Test the validation > success.', () {
      test('http://foo.com/blah_blah is a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.com/blah_blah');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://foo.com/blah_blah/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.com/blah_blah/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://foo.com/blah_blah_(wikipedia) is a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.com/blah_blah_(wikipedia)');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://foo.com/blah_blah_(wikipedia)_(again) is a valid URL.',
          () async {
        UrlTest model =
            new UrlTest('http://foo.com/blah_blah_(wikipedia)_(again)');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://www.example.com/wpstyle/?p=364 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://www.example.com/wpstyle/?p=364');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('https://www.example.com/foo/?bar=baz&inga=42&quux is a valid URL.',
          () async {
        UrlTest model =
            new UrlTest('https://www.example.com/foo/?bar=baz&inga=42&quux');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://✪df.ws/123 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://✪df.ws/123');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://userid:password@example.com:8080 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid:password@example.com:8080');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://userid:password@example.com:8080/ is a valid URL.',
          () async {
        UrlTest model = new UrlTest('http://userid:password@example.com:8080/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://userid@example.com is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid@example.com');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://userid@example.com/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid@example.com/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://userid@example.com:8080 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid@example.com:8080');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://userid@example.com:8080/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid@example.com:8080/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://userid:password@example.com is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid:password@example.com');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://userid:password@example.com/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid:password@example.com/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://142.42.1.1/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://142.42.1.1/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://142.42.1.1:8080/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://142.42.1.1:8080/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://➡.ws/䨹 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://➡.ws/䨹');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://⌘.ws is a valid URL.', () async {
        UrlTest model = new UrlTest('http://⌘.ws');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://⌘.ws/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://⌘.ws/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://foo.com/blah_(wikipedia)#cite-1 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.com/blah_(wikipedia)#cite-1');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://foo.com/blah_(wikipedia)_blah#cite-1 is a valid URL.',
          () async {
        UrlTest model =
            new UrlTest('http://foo.com/blah_(wikipedia)_blah#cite-1');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://foo.com/unicode_(✪)_in_parens is a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.com/unicode_(✪)_in_parens');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://foo.com/(something)?after=parens is a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.com/(something)?after=parens');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://☺.damowmow.com/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://☺.damowmow.com/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://code.google.com/events/#&product=browser is a valid URL.',
          () async {
        UrlTest model =
            new UrlTest('http://code.google.com/events/#&product=browser');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://j.mp is a valid URL.', () async {
        UrlTest model = new UrlTest('http://j.mp');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('ftp://foo.bar/baz is a valid URL.', () async {
        UrlTest model = new UrlTest('ftp://foo.bar/baz');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://foo.bar/?q=Test%20URL-encoded%20stuff is a valid URL.',
          () async {
        UrlTest model =
            new UrlTest('http://foo.bar/?q=Test%20URL-encoded%20stuff');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://مثال.إختبار is a valid URL.', () async {
        UrlTest model = new UrlTest('http://مثال.إختبار');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://例子.测试 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://例子.测试');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://उदाहरण.परीक्षा is a valid URL.', () async {
        UrlTest model = new UrlTest('http://उदाहरण.परीक्षा');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test(
          r"http://-.~_!$&'()*+,;=:%40:80%2f::::::@example.com is a valid URL.",
          () async {
        UrlTest model =
            new UrlTest(r"http://-.~_!$&'()*+,;=:%40:80%2f::::::@example.com");
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://1337.net is a valid URL.', () async {
        UrlTest model = new UrlTest('http://1337.net');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://a.b-c.de is a valid URL.', () async {
        UrlTest model = new UrlTest('http://a.b-c.de');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      test('http://223.255.255.254 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://223.255.255.254');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.status, EFormStatus.valid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNull);
      });

      // test('https://foo_bar.example.com/ is a valid URL.', () async {
      //   UrlTest model = new UrlTest('https://foo_bar.example.com/');
      //   ModelState modelState = new ModelState<UrlTest>(model);

      //   expect(await modelState.validateForm(), true);
      //   expect(modelState.errors.isEmpty, true);
      // });
    });

    group('Test the validation > failure.', () {
      test('http:// is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://. is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://.');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://.. is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://..');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://../ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://../');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://? is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://?');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://?? is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://??');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://??/ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://??/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://# is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://#');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://## is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://##');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://##/ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://##/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://foo.bar?q=Spaces should be encoded is not a valid URL.',
          () async {
        UrlTest model =
            new UrlTest('http://foo.bar?q=Spaces should be encoded');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('// is not a valid URL.', () async {
        UrlTest model = new UrlTest('//');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('//a is not a valid URL.', () async {
        UrlTest model = new UrlTest('//a');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('///a is not a valid URL.', () async {
        UrlTest model = new UrlTest('///a');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('/// is not a valid URL.', () async {
        UrlTest model = new UrlTest('///');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http:///a is not a valid URL.', () async {
        UrlTest model = new UrlTest('http:///a');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('foo.com is not a valid URL.', () async {
        UrlTest model = new UrlTest('foo.com');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('rdar://1234 is not a valid URL.', () async {
        UrlTest model = new UrlTest('rdar://1234');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('h://test is not a valid URL.', () async {
        UrlTest model = new UrlTest('h://test');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http:// shouldfail.com is not a valid URL.', () async {
        UrlTest model = new UrlTest('http:// shouldfail.com');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test(':// should fail is not a valid URL.', () async {
        UrlTest model = new UrlTest(':// should fail');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://foo.bar/foo(bar)baz quux is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.bar/foo(bar)baz quux');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('ftps://foo.bar/ is not a valid URL.', () async {
        UrlTest model = new UrlTest('ftps://foo.bar/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://-error-.invalid/ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://-error-.invalid/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      // test('http://a.b--c.de/ is not a valid URL.', () async {
      //   UrlTest model = new UrlTest('http://a.b--c.de/');
      //   ModelState modelState = new ModelState<UrlTest>(model);

      //   expect(await modelState.validateForm(), false);
      //   expect(modelState.errors['value'].validatorType, URL);
      //   expect(modelState.errors['value'].propertyName, 'value');
      //   expect(modelState.errors['value'].error, 'Invalid URL');
      // });

      test('http://-a.b.co is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://-a.b.co');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://a.b-.co is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://a.b-.co');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://0.0.0.0 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://0.0.0.0');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://10.1.1.0 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://10.1.1.0');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://10.1.1.255 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://10.1.1.255');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://224.1.1.1 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://224.1.1.1');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://1.1.1.1.1 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://1.1.1.1.1');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://123.123.123 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://123.123.123');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://3628126748 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://3628126748');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://.www.foo.bar/ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://.www.foo.bar/');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://www.foo.bar./ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://www.foo.bar./');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://.www.foo.bar./ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://.www.foo.bar./');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://10.1.1.1 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://10.1.1.1');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });

      test('http://10.1.1.254 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://10.1.1.254');
        ModelFormState<UrlTest> modelState = new ModelFormState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.status, EFormStatus.invalid);
        ValidationError error =
            modelState.getError(model.getListenerName('value'));
        expect(error, isNotNull);
        expect(error.propertyName, 'value');
        expect(error.validatorType, URL);
        expect(error.message, 'error message here');
      });
    });
  });
}
