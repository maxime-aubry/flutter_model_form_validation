import 'package:flutter_test/flutter_test.dart';

import 'stubs/url.dart';

void main() {
  group('Annotations > Validators > FormControl<TProperty> > Url.', () {
    group('Valid.', () {
      test('url is null.', () async {
        Url_UrlIsNull_Stub stub = new Url_UrlIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://foo.com/blah_blah is a valid url.', () async {
        Url_UrlIsValid1_Stub stub = new Url_UrlIsValid1_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://foo.com/blah_blah/ is a valid url.', () async {
        Url_UrlIsValid2_Stub stub = new Url_UrlIsValid2_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://foo.com/blah_blah_(wikipedia) is a valid url.', () async {
        Url_UrlIsValid3_Stub stub = new Url_UrlIsValid3_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://foo.com/blah_blah_(wikipedia)_(again) is a valid url.',
          () async {
        Url_UrlIsValid4_Stub stub = new Url_UrlIsValid4_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://www.example.com/wpstyle/?p=364 is a valid url.', () async {
        Url_UrlIsValid5_Stub stub = new Url_UrlIsValid5_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('https://www.example.com/foo/?bar=baz&inga=42&quux is a valid url.',
          () async {
        Url_UrlIsValid6_Stub stub = new Url_UrlIsValid6_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://✪df.ws/123 is a valid url.', () async {
        Url_UrlIsValid7_Stub stub = new Url_UrlIsValid7_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://userid:password@example.com:8080 is a valid url.', () async {
        Url_UrlIsValid8_Stub stub = new Url_UrlIsValid8_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://userid:password@example.com:8080/ is a valid url.',
          () async {
        Url_UrlIsValid8_Stub stub = new Url_UrlIsValid8_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://userid:password@example.com:8080/ is a valid url.',
          () async {
        Url_UrlIsValid9_Stub stub = new Url_UrlIsValid9_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://userid@example.com is a valid url.', () async {
        Url_UrlIsValid10_Stub stub = new Url_UrlIsValid10_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://userid@example.com/ is a valid url.', () async {
        Url_UrlIsValid11_Stub stub = new Url_UrlIsValid11_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://userid@example.com:8080 is a valid url.', () async {
        Url_UrlIsValid12_Stub stub = new Url_UrlIsValid12_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://userid@example.com:8080/ is a valid url.', () async {
        Url_UrlIsValid13_Stub stub = new Url_UrlIsValid13_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://userid:password@example.com is a valid url.', () async {
        Url_UrlIsValid14_Stub stub = new Url_UrlIsValid14_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://userid:password@example.com/ is a valid url.', () async {
        Url_UrlIsValid15_Stub stub = new Url_UrlIsValid15_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://142.42.1.1/ is a valid url.', () async {
        Url_UrlIsValid16_Stub stub = new Url_UrlIsValid16_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://142.42.1.1:8080/ is a valid url.', () async {
        Url_UrlIsValid17_Stub stub = new Url_UrlIsValid17_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://➡.ws/䨹 is a valid url.', () async {
        Url_UrlIsValid18_Stub stub = new Url_UrlIsValid18_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://⌘.ws is a valid url.', () async {
        Url_UrlIsValid19_Stub stub = new Url_UrlIsValid19_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://⌘.ws/ is a valid url.', () async {
        Url_UrlIsValid20_Stub stub = new Url_UrlIsValid20_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://foo.com/blah_(wikipedia)#cite-1 is a valid url.', () async {
        Url_UrlIsValid21_Stub stub = new Url_UrlIsValid21_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://foo.com/blah_(wikipedia)_blah#cite-1 is a valid url.',
          () async {
        Url_UrlIsValid22_Stub stub = new Url_UrlIsValid22_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://foo.com/unicode_(✪)_in_parens is a valid url.', () async {
        Url_UrlIsValid23_Stub stub = new Url_UrlIsValid23_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://foo.com/(something)?after=parens is a valid url.', () async {
        Url_UrlIsValid24_Stub stub = new Url_UrlIsValid24_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://☺.damowmow.com/ is a valid url.', () async {
        Url_UrlIsValid25_Stub stub = new Url_UrlIsValid25_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://code.google.com/events/#&product=browser is a valid url.',
          () async {
        Url_UrlIsValid26_Stub stub = new Url_UrlIsValid26_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://j.mp is a valid url.', () async {
        Url_UrlIsValid27_Stub stub = new Url_UrlIsValid27_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('ftp://foo.bar/baz is a valid url.', () async {
        Url_UrlIsValid28_Stub stub = new Url_UrlIsValid28_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://foo.bar/?q=Test%20URL-encoded%20stuff is a valid url.',
          () async {
        Url_UrlIsValid29_Stub stub = new Url_UrlIsValid29_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://مثال.إختبار is a valid url.', () async {
        Url_UrlIsValid30_Stub stub = new Url_UrlIsValid30_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://例子.测试 is a valid url.', () async {
        Url_UrlIsValid31_Stub stub = new Url_UrlIsValid31_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://उदाहरण.परीक्षा is a valid url.', () async {
        Url_UrlIsValid32_Stub stub = new Url_UrlIsValid32_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test(
          r"http://-.~_!$&'()*+,;=:%40:80%2f::::::@example.com is a valid url.",
          () async {
        Url_UrlIsValid33_Stub stub = new Url_UrlIsValid33_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://1337.net is a valid url.', () async {
        Url_UrlIsValid34_Stub stub = new Url_UrlIsValid34_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://a.b-c.de is a valid url.', () async {
        Url_UrlIsValid35_Stub stub = new Url_UrlIsValid35_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('http://223.255.255.254 is a valid url.', () async {
        Url_UrlIsValid36_Stub stub = new Url_UrlIsValid36_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('http:// is not a valid url.', () async {
        Url_UrlIsNotValid1_Stub stub = new Url_UrlIsNotValid1_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://. is not a valid url.', () async {
        Url_UrlIsNotValid2_Stub stub = new Url_UrlIsNotValid2_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://.. is not a valid url.', () async {
        Url_UrlIsNotValid3_Stub stub = new Url_UrlIsNotValid3_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://../ is not a valid url.', () async {
        Url_UrlIsNotValid4_Stub stub = new Url_UrlIsNotValid4_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://? is not a valid url.', () async {
        Url_UrlIsNotValid5_Stub stub = new Url_UrlIsNotValid5_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://?? is not a valid url.', () async {
        Url_UrlIsNotValid6_Stub stub = new Url_UrlIsNotValid6_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://??/ is not a valid url.', () async {
        Url_UrlIsNotValid7_Stub stub = new Url_UrlIsNotValid7_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://# is not a valid url.', () async {
        Url_UrlIsNotValid8_Stub stub = new Url_UrlIsNotValid8_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://## is not a valid url.', () async {
        Url_UrlIsNotValid9_Stub stub = new Url_UrlIsNotValid9_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://##/ is not a valid url.', () async {
        Url_UrlIsNotValid10_Stub stub = new Url_UrlIsNotValid10_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://foo.bar?q=Spaces should be encoded is not a valid url.',
          () async {
        Url_UrlIsNotValid11_Stub stub = new Url_UrlIsNotValid11_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('// is not a valid url.', () async {
        Url_UrlIsNotValid12_Stub stub = new Url_UrlIsNotValid12_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('//a is not a valid url.', () async {
        Url_UrlIsNotValid13_Stub stub = new Url_UrlIsNotValid13_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('///a is not a valid url.', () async {
        Url_UrlIsNotValid14_Stub stub = new Url_UrlIsNotValid14_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('/// is not a valid url.', () async {
        Url_UrlIsNotValid15_Stub stub = new Url_UrlIsNotValid15_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http:///a is not a valid url.', () async {
        Url_UrlIsNotValid16_Stub stub = new Url_UrlIsNotValid16_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('foo.com is not a valid url.', () async {
        Url_UrlIsNotValid17_Stub stub = new Url_UrlIsNotValid17_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('rdar://1234 is not a valid url.', () async {
        Url_UrlIsNotValid18_Stub stub = new Url_UrlIsNotValid18_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('h://test is not a valid url.', () async {
        Url_UrlIsNotValid19_Stub stub = new Url_UrlIsNotValid19_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http:// shouldfail.com is not a valid url.', () async {
        Url_UrlIsNotValid20_Stub stub = new Url_UrlIsNotValid20_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test(':// should fail is not a valid url.', () async {
        Url_UrlIsNotValid21_Stub stub = new Url_UrlIsNotValid21_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://foo.bar/foo(bar)baz quux is not a valid url.', () async {
        Url_UrlIsNotValid22_Stub stub = new Url_UrlIsNotValid22_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('ftps://foo.bar/ is not a valid url.', () async {
        Url_UrlIsNotValid23_Stub stub = new Url_UrlIsNotValid23_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://-error-.invalid/ is not a valid url.', () async {
        Url_UrlIsNotValid24_Stub stub = new Url_UrlIsNotValid24_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://a.b--c.de/ is not a valid url.', () async {
        Url_UrlIsNotValid25_Stub stub = new Url_UrlIsNotValid25_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://-a.b.co is not a valid url.', () async {
        Url_UrlIsNotValid26_Stub stub = new Url_UrlIsNotValid26_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://a.b-.co is not a valid url.', () async {
        Url_UrlIsNotValid27_Stub stub = new Url_UrlIsNotValid27_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://0.0.0.0 is not a valid url.', () async {
        Url_UrlIsNotValid28_Stub stub = new Url_UrlIsNotValid28_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://10.1.1.0 is not a valid url.', () async {
        Url_UrlIsNotValid29_Stub stub = new Url_UrlIsNotValid29_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://10.1.1.255 is not a valid url.', () async {
        Url_UrlIsNotValid30_Stub stub = new Url_UrlIsNotValid30_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://224.1.1.1 is not a valid url.', () async {
        Url_UrlIsNotValid31_Stub stub = new Url_UrlIsNotValid31_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://1.1.1.1.1 is not a valid url.', () async {
        Url_UrlIsNotValid32_Stub stub = new Url_UrlIsNotValid32_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://123.123.123 is not a valid url.', () async {
        Url_UrlIsNotValid33_Stub stub = new Url_UrlIsNotValid33_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://3628126748 is not a valid url.', () async {
        Url_UrlIsNotValid34_Stub stub = new Url_UrlIsNotValid34_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://.www.foo.bar/ is not a valid url.', () async {
        Url_UrlIsNotValid35_Stub stub = new Url_UrlIsNotValid35_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://www.foo.bar./ is not a valid url.', () async {
        Url_UrlIsNotValid36_Stub stub = new Url_UrlIsNotValid36_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://.www.foo.bar./ is not a valid url.', () async {
        Url_UrlIsNotValid37_Stub stub = new Url_UrlIsNotValid37_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://10.1.1.1 is not a valid url.', () async {
        Url_UrlIsNotValid38_Stub stub = new Url_UrlIsNotValid38_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });

      test('http://10.1.1.254 is not a valid url.', () async {
        Url_UrlIsNotValid39_Stub stub = new Url_UrlIsNotValid39_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });
  });
}
