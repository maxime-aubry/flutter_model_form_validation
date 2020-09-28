// import 'models/models.dart';
// import 'models/models.reflectable.dart';
// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   initializeReflectable();

//   group('URL.', () {
//     group('Test the validation > success.', () {
//       test('http://foo.com/blah_blah is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://foo.com/blah_blah');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://foo.com/blah_blah/ is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://foo.com/blah_blah/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://foo.com/blah_blah_(wikipedia) is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://foo.com/blah_blah_(wikipedia)');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://foo.com/blah_blah_(wikipedia)_(again) is a valid URL.', () {
//         UrlTest tester =
//             new UrlTest('http://foo.com/blah_blah_(wikipedia)_(again)');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://www.example.com/wpstyle/?p=364 is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://www.example.com/wpstyle/?p=364');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('https://www.example.com/foo/?bar=baz&inga=42&quux is a valid URL.',
//           () {
//         UrlTest tester =
//             new UrlTest('https://www.example.com/foo/?bar=baz&inga=42&quux');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://✪df.ws/123 is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://✪df.ws/123');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://userid:password@example.com:8080 is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://userid:password@example.com:8080');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://userid:password@example.com:8080/ is a valid URL.', () {
//         UrlTest tester =
//             new UrlTest('http://userid:password@example.com:8080/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://userid@example.com is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://userid@example.com');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://userid@example.com/ is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://userid@example.com/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://userid@example.com:8080 is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://userid@example.com:8080');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://userid@example.com:8080/ is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://userid@example.com:8080/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://userid:password@example.com is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://userid:password@example.com');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://userid:password@example.com/ is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://userid:password@example.com/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://142.42.1.1/ is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://142.42.1.1/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://142.42.1.1:8080/ is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://142.42.1.1:8080/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://➡.ws/䨹 is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://➡.ws/䨹');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://⌘.ws is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://⌘.ws');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://⌘.ws/ is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://⌘.ws/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://foo.com/blah_(wikipedia)#cite-1 is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://foo.com/blah_(wikipedia)#cite-1');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://foo.com/blah_(wikipedia)_blah#cite-1 is a valid URL.', () {
//         UrlTest tester =
//             new UrlTest('http://foo.com/blah_(wikipedia)_blah#cite-1');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://foo.com/unicode_(✪)_in_parens is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://foo.com/unicode_(✪)_in_parens');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://foo.com/(something)?after=parens is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://foo.com/(something)?after=parens');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://☺.damowmow.com/ is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://☺.damowmow.com/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://code.google.com/events/#&product=browser is a valid URL.',
//           () {
//         UrlTest tester =
//             new UrlTest('http://code.google.com/events/#&product=browser');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://j.mp is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://j.mp');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('ftp://foo.bar/baz is a valid URL.', () {
//         UrlTest tester = new UrlTest('ftp://foo.bar/baz');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://foo.bar/?q=Test%20URL-encoded%20stuff is a valid URL.', () {
//         UrlTest tester =
//             new UrlTest('http://foo.bar/?q=Test%20URL-encoded%20stuff');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://مثال.إختبار is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://مثال.إختبار');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://例子.测试 is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://例子.测试');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://उदाहरण.परीक्षा is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://उदाहरण.परीक्षा');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test(
//           r"http://-.~_!$&'()*+,;=:%40:80%2f::::::@example.com is a valid URL.",
//           () {
//         UrlTest tester =
//             new UrlTest(r"http://-.~_!$&'()*+,;=:%40:80%2f::::::@example.com");
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://1337.net is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://1337.net');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://a.b-c.de is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://a.b-c.de');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       test('http://223.255.255.254 is a valid URL.', () {
//         UrlTest tester = new UrlTest('http://223.255.255.254');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, true);
//         expect(ModelState.errors.isEmpty, true);
//       });

//       // test('https://foo_bar.example.com/ is a valid URL.', () {
//       //   UrlTest tester = new UrlTest('https://foo_bar.example.com/');
//       //   bool isValid = ModelState.isValid<UrlTest>(tester);
//       //   expect(isValid, true);
//       //   expect(ModelState.errors.isEmpty, true);
//       // });
//     });

//     group('Test the validation > failure.', () {
//       test('http:// is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://. is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://.');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://.. is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://..');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://../ is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://../');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://? is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://?');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://?? is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://??');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://??/ is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://??/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://# is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://#');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://## is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://##');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://##/ is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://##/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://foo.bar?q=Spaces should be encoded is not a valid URL.', () {
//         UrlTest tester =
//             new UrlTest('http://foo.bar?q=Spaces should be encoded');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('// is not a valid URL.', () {
//         UrlTest tester = new UrlTest('//');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('//a is not a valid URL.', () {
//         UrlTest tester = new UrlTest('//a');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('///a is not a valid URL.', () {
//         UrlTest tester = new UrlTest('///a');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('/// is not a valid URL.', () {
//         UrlTest tester = new UrlTest('///');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http:///a is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http:///a');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('foo.com is not a valid URL.', () {
//         UrlTest tester = new UrlTest('foo.com');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('rdar://1234 is not a valid URL.', () {
//         UrlTest tester = new UrlTest('rdar://1234');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('h://test is not a valid URL.', () {
//         UrlTest tester = new UrlTest('h://test');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http:// shouldfail.com is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http:// shouldfail.com');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test(':// should fail is not a valid URL.', () {
//         UrlTest tester = new UrlTest(':// should fail');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://foo.bar/foo(bar)baz quux is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://foo.bar/foo(bar)baz quux');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('ftps://foo.bar/ is not a valid URL.', () {
//         UrlTest tester = new UrlTest('ftps://foo.bar/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://-error-.invalid/ is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://-error-.invalid/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       // test('http://a.b--c.de/ is not a valid URL.', () {
//       //   UrlTest tester = new UrlTest('http://a.b--c.de/');
//       //   bool isValid = ModelState.isValid<UrlTest>(tester);
//       //   expect(isValid, false);

//       //   expect(ModelState.errors['value'].validatorType, URL);
//       //   expect(ModelState.errors['value'].propertyName, 'value');
//       //   expect(ModelState.errors['value'].error, 'Invalid URL');
//       // });

//       test('http://-a.b.co is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://-a.b.co');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://a.b-.co is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://a.b-.co');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://0.0.0.0 is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://0.0.0.0');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://10.1.1.0 is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://10.1.1.0');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://10.1.1.255 is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://10.1.1.255');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://224.1.1.1 is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://224.1.1.1');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://1.1.1.1.1 is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://1.1.1.1.1');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://123.123.123 is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://123.123.123');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://3628126748 is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://3628126748');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://.www.foo.bar/ is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://.www.foo.bar/');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://www.foo.bar./ is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://www.foo.bar./');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://.www.foo.bar./ is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://.www.foo.bar./');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://10.1.1.1 is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://10.1.1.1');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });

//       test('http://10.1.1.254 is not a valid URL.', () {
//         UrlTest tester = new UrlTest('http://10.1.1.254');
//         bool isValid = ModelState.isValid<UrlTest>(tester);
//         expect(isValid, false);

//         expect(ModelState.errors['value'].validatorType, URL);
//         expect(ModelState.errors['value'].propertyName, 'value');
//         expect(ModelState.errors['value'].error, 'Invalid URL');
//       });
//     });
//   });
// }
