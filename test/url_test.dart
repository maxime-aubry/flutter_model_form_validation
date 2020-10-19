import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('URL.', () {
    group('Test the validation > success.', () {
      test('http://foo.com/blah_blah is a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.com/blah_blah');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://foo.com/blah_blah/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.com/blah_blah/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://foo.com/blah_blah_(wikipedia) is a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.com/blah_blah_(wikipedia)');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://foo.com/blah_blah_(wikipedia)_(again) is a valid URL.',
          () async {
        UrlTest model =
            new UrlTest('http://foo.com/blah_blah_(wikipedia)_(again)');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://www.example.com/wpstyle/?p=364 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://www.example.com/wpstyle/?p=364');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('https://www.example.com/foo/?bar=baz&inga=42&quux is a valid URL.',
          () async {
        UrlTest model =
            new UrlTest('https://www.example.com/foo/?bar=baz&inga=42&quux');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://✪df.ws/123 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://✪df.ws/123');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://userid:password@example.com:8080 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid:password@example.com:8080');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://userid:password@example.com:8080/ is a valid URL.',
          () async {
        UrlTest model = new UrlTest('http://userid:password@example.com:8080/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://userid@example.com is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid@example.com');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://userid@example.com/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid@example.com/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://userid@example.com:8080 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid@example.com:8080');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://userid@example.com:8080/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid@example.com:8080/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://userid:password@example.com is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid:password@example.com');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://userid:password@example.com/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://userid:password@example.com/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://142.42.1.1/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://142.42.1.1/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://142.42.1.1:8080/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://142.42.1.1:8080/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://➡.ws/䨹 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://➡.ws/䨹');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://⌘.ws is a valid URL.', () async {
        UrlTest model = new UrlTest('http://⌘.ws');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://⌘.ws/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://⌘.ws/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://foo.com/blah_(wikipedia)#cite-1 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.com/blah_(wikipedia)#cite-1');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://foo.com/blah_(wikipedia)_blah#cite-1 is a valid URL.',
          () async {
        UrlTest model =
            new UrlTest('http://foo.com/blah_(wikipedia)_blah#cite-1');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://foo.com/unicode_(✪)_in_parens is a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.com/unicode_(✪)_in_parens');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://foo.com/(something)?after=parens is a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.com/(something)?after=parens');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://☺.damowmow.com/ is a valid URL.', () async {
        UrlTest model = new UrlTest('http://☺.damowmow.com/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://code.google.com/events/#&product=browser is a valid URL.',
          () async {
        UrlTest model =
            new UrlTest('http://code.google.com/events/#&product=browser');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://j.mp is a valid URL.', () async {
        UrlTest model = new UrlTest('http://j.mp');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('ftp://foo.bar/baz is a valid URL.', () async {
        UrlTest model = new UrlTest('ftp://foo.bar/baz');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://foo.bar/?q=Test%20URL-encoded%20stuff is a valid URL.',
          () async {
        UrlTest model =
            new UrlTest('http://foo.bar/?q=Test%20URL-encoded%20stuff');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://مثال.إختبار is a valid URL.', () async {
        UrlTest model = new UrlTest('http://مثال.إختبار');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://例子.测试 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://例子.测试');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://उदाहरण.परीक्षा is a valid URL.', () async {
        UrlTest model = new UrlTest('http://उदाहरण.परीक्षा');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test(
          r"http://-.~_!$&'()*+,;=:%40:80%2f::::::@example.com is a valid URL.",
          () async {
        UrlTest model =
            new UrlTest(r"http://-.~_!$&'()*+,;=:%40:80%2f::::::@example.com");
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://1337.net is a valid URL.', () async {
        UrlTest model = new UrlTest('http://1337.net');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://a.b-c.de is a valid URL.', () async {
        UrlTest model = new UrlTest('http://a.b-c.de');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
      });

      test('http://223.255.255.254 is a valid URL.', () async {
        UrlTest model = new UrlTest('http://223.255.255.254');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), true);
        expect(modelState.errors.isEmpty, true);
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
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://. is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://.');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://.. is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://..');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://../ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://../');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://? is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://?');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://?? is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://??');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://??/ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://??/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://# is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://#');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://## is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://##');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://##/ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://##/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://foo.bar?q=Spaces should be encoded is not a valid URL.',
          () async {
        UrlTest model =
            new UrlTest('http://foo.bar?q=Spaces should be encoded');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('// is not a valid URL.', () async {
        UrlTest model = new UrlTest('//');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('//a is not a valid URL.', () async {
        UrlTest model = new UrlTest('//a');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('///a is not a valid URL.', () async {
        UrlTest model = new UrlTest('///a');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('/// is not a valid URL.', () async {
        UrlTest model = new UrlTest('///');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http:///a is not a valid URL.', () async {
        UrlTest model = new UrlTest('http:///a');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('foo.com is not a valid URL.', () async {
        UrlTest model = new UrlTest('foo.com');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('rdar://1234 is not a valid URL.', () async {
        UrlTest model = new UrlTest('rdar://1234');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('h://test is not a valid URL.', () async {
        UrlTest model = new UrlTest('h://test');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http:// shouldfail.com is not a valid URL.', () async {
        UrlTest model = new UrlTest('http:// shouldfail.com');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test(':// should fail is not a valid URL.', () async {
        UrlTest model = new UrlTest(':// should fail');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://foo.bar/foo(bar)baz quux is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://foo.bar/foo(bar)baz quux');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('ftps://foo.bar/ is not a valid URL.', () async {
        UrlTest model = new UrlTest('ftps://foo.bar/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://-error-.invalid/ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://-error-.invalid/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
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
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://a.b-.co is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://a.b-.co');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://0.0.0.0 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://0.0.0.0');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://10.1.1.0 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://10.1.1.0');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://10.1.1.255 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://10.1.1.255');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://224.1.1.1 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://224.1.1.1');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://1.1.1.1.1 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://1.1.1.1.1');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://123.123.123 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://123.123.123');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://3628126748 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://3628126748');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://.www.foo.bar/ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://.www.foo.bar/');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://www.foo.bar./ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://www.foo.bar./');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://.www.foo.bar./ is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://.www.foo.bar./');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://10.1.1.1 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://10.1.1.1');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });

      test('http://10.1.1.254 is not a valid URL.', () async {
        UrlTest model = new UrlTest('http://10.1.1.254');
        ModelState modelState = new ModelState<UrlTest>(model);

        expect(await modelState.validateForm(), false);
        expect(modelState.errors['value'].validatorType, URL);
        expect(modelState.errors['value'].propertyName, 'value');
        expect(modelState.errors['value'].error, 'Invalid URL');
      });
    });
  });
}
