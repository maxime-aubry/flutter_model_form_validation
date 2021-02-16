import 'package:flutter_model_form_validation/src/annotations/index.dart';
import 'package:flutter_model_form_validation/src/form/index.dart';

import '../../stub.dart';

class _UrlStub extends IStub<FormControl<String>, Url> {
  _UrlStub({
    String fcValue,
  }) {
    this.control = new FormControl<String>(
      value: fcValue,
      validators: [],
    );
    this.validator = Url(error: '');
  }
}

/* Value is valid */
class Url_UrlIsNull_Stub extends _UrlStub {
  Url_UrlIsNull_Stub() : super(fcValue: null);
}

class Url_UrlIsEmpty_Stub extends _UrlStub {
  Url_UrlIsEmpty_Stub() : super(fcValue: '');
}

class Url_UrlIsValid1_Stub extends _UrlStub {
  Url_UrlIsValid1_Stub() : super(fcValue: 'http://foo.com/blah_blah');
}

class Url_UrlIsValid2_Stub extends _UrlStub {
  Url_UrlIsValid2_Stub() : super(fcValue: 'http://foo.com/blah_blah/');
}

class Url_UrlIsValid3_Stub extends _UrlStub {
  Url_UrlIsValid3_Stub()
      : super(fcValue: 'http://foo.com/blah_blah_(wikipedia)');
}

class Url_UrlIsValid4_Stub extends _UrlStub {
  Url_UrlIsValid4_Stub()
      : super(fcValue: 'http://foo.com/blah_blah_(wikipedia)_(again)');
}

class Url_UrlIsValid5_Stub extends _UrlStub {
  Url_UrlIsValid5_Stub()
      : super(fcValue: 'http://www.example.com/wpstyle/?p=364');
}

class Url_UrlIsValid6_Stub extends _UrlStub {
  Url_UrlIsValid6_Stub()
      : super(fcValue: 'https://www.example.com/foo/?bar=baz&inga=42&quux');
}

class Url_UrlIsValid7_Stub extends _UrlStub {
  Url_UrlIsValid7_Stub() : super(fcValue: 'http://✪df.ws/123');
}

class Url_UrlIsValid8_Stub extends _UrlStub {
  Url_UrlIsValid8_Stub()
      : super(fcValue: 'http://userid:password@example.com:8080');
}

class Url_UrlIsValid9_Stub extends _UrlStub {
  Url_UrlIsValid9_Stub()
      : super(fcValue: 'http://userid:password@example.com:8080/');
}

class Url_UrlIsValid10_Stub extends _UrlStub {
  Url_UrlIsValid10_Stub() : super(fcValue: 'http://userid@example.com');
}

class Url_UrlIsValid11_Stub extends _UrlStub {
  Url_UrlIsValid11_Stub() : super(fcValue: 'http://userid@example.com/');
}

class Url_UrlIsValid12_Stub extends _UrlStub {
  Url_UrlIsValid12_Stub() : super(fcValue: 'http://userid@example.com:8080');
}

class Url_UrlIsValid13_Stub extends _UrlStub {
  Url_UrlIsValid13_Stub() : super(fcValue: 'http://userid@example.com:8080/');
}

class Url_UrlIsValid14_Stub extends _UrlStub {
  Url_UrlIsValid14_Stub()
      : super(fcValue: 'http://userid:password@example.com');
}

class Url_UrlIsValid15_Stub extends _UrlStub {
  Url_UrlIsValid15_Stub()
      : super(fcValue: 'http://userid:password@example.com/');
}

class Url_UrlIsValid16_Stub extends _UrlStub {
  Url_UrlIsValid16_Stub() : super(fcValue: 'http://142.42.1.1/');
}

class Url_UrlIsValid17_Stub extends _UrlStub {
  Url_UrlIsValid17_Stub() : super(fcValue: 'http://142.42.1.1:8080/');
}

class Url_UrlIsValid18_Stub extends _UrlStub {
  Url_UrlIsValid18_Stub() : super(fcValue: 'http://➡.ws/䨹');
}

class Url_UrlIsValid19_Stub extends _UrlStub {
  Url_UrlIsValid19_Stub() : super(fcValue: 'http://⌘.ws');
}

class Url_UrlIsValid20_Stub extends _UrlStub {
  Url_UrlIsValid20_Stub() : super(fcValue: 'http://⌘.ws/');
}

class Url_UrlIsValid21_Stub extends _UrlStub {
  Url_UrlIsValid21_Stub()
      : super(fcValue: 'http://foo.com/blah_(wikipedia)#cite-1');
}

class Url_UrlIsValid22_Stub extends _UrlStub {
  Url_UrlIsValid22_Stub()
      : super(fcValue: 'http://foo.com/blah_(wikipedia)_blah#cite-1');
}

class Url_UrlIsValid23_Stub extends _UrlStub {
  Url_UrlIsValid23_Stub()
      : super(fcValue: 'http://foo.com/unicode_(✪)_in_parens');
}

class Url_UrlIsValid24_Stub extends _UrlStub {
  Url_UrlIsValid24_Stub()
      : super(fcValue: 'http://foo.com/(something)?after=parens');
}

class Url_UrlIsValid25_Stub extends _UrlStub {
  Url_UrlIsValid25_Stub() : super(fcValue: 'http://☺.damowmow.com/');
}

class Url_UrlIsValid26_Stub extends _UrlStub {
  Url_UrlIsValid26_Stub()
      : super(fcValue: 'http://code.google.com/events/#&product=browser');
}

class Url_UrlIsValid27_Stub extends _UrlStub {
  Url_UrlIsValid27_Stub() : super(fcValue: 'http://j.mp');
}

class Url_UrlIsValid28_Stub extends _UrlStub {
  Url_UrlIsValid28_Stub() : super(fcValue: 'ftp://foo.bar/baz');
}

class Url_UrlIsValid29_Stub extends _UrlStub {
  Url_UrlIsValid29_Stub()
      : super(fcValue: 'http://foo.bar/?q=Test%20URL-encoded%20stuff');
}

class Url_UrlIsValid30_Stub extends _UrlStub {
  Url_UrlIsValid30_Stub() : super(fcValue: 'http://مثال.إختبار');
}

class Url_UrlIsValid31_Stub extends _UrlStub {
  Url_UrlIsValid31_Stub() : super(fcValue: 'http://例子.测试');
}

class Url_UrlIsValid32_Stub extends _UrlStub {
  Url_UrlIsValid32_Stub() : super(fcValue: 'http://उदाहरण.परीक्षा');
}

class Url_UrlIsValid33_Stub extends _UrlStub {
  Url_UrlIsValid33_Stub()
      : super(fcValue: r"http://-.~_!$&'()*+,;=:%40:80%2f::::::@example.com");
}

class Url_UrlIsValid34_Stub extends _UrlStub {
  Url_UrlIsValid34_Stub() : super(fcValue: 'http://1337.net');
}

class Url_UrlIsValid35_Stub extends _UrlStub {
  Url_UrlIsValid35_Stub() : super(fcValue: 'http://a.b-c.de');
}

class Url_UrlIsValid36_Stub extends _UrlStub {
  Url_UrlIsValid36_Stub() : super(fcValue: 'http://223.255.255.254');
}

class Url_UrlIsValid37_Stub extends _UrlStub {
  Url_UrlIsValid37_Stub() : super(fcValue: 'https://foo_bar.example.com/');
}

/* Value is not valid */
class Url_UrlIsNotValid1_Stub extends _UrlStub {
  Url_UrlIsNotValid1_Stub() : super(fcValue: 'http://');
}

class Url_UrlIsNotValid2_Stub extends _UrlStub {
  Url_UrlIsNotValid2_Stub() : super(fcValue: 'http://.');
}

class Url_UrlIsNotValid3_Stub extends _UrlStub {
  Url_UrlIsNotValid3_Stub() : super(fcValue: 'http://..');
}

class Url_UrlIsNotValid4_Stub extends _UrlStub {
  Url_UrlIsNotValid4_Stub() : super(fcValue: 'http://../');
}

class Url_UrlIsNotValid5_Stub extends _UrlStub {
  Url_UrlIsNotValid5_Stub() : super(fcValue: 'http://?');
}

class Url_UrlIsNotValid6_Stub extends _UrlStub {
  Url_UrlIsNotValid6_Stub() : super(fcValue: 'http://??');
}

class Url_UrlIsNotValid7_Stub extends _UrlStub {
  Url_UrlIsNotValid7_Stub() : super(fcValue: 'http://??/');
}

class Url_UrlIsNotValid8_Stub extends _UrlStub {
  Url_UrlIsNotValid8_Stub() : super(fcValue: 'http://#');
}

class Url_UrlIsNotValid9_Stub extends _UrlStub {
  Url_UrlIsNotValid9_Stub() : super(fcValue: 'http://##');
}

class Url_UrlIsNotValid10_Stub extends _UrlStub {
  Url_UrlIsNotValid10_Stub() : super(fcValue: 'http://##/');
}

class Url_UrlIsNotValid11_Stub extends _UrlStub {
  Url_UrlIsNotValid11_Stub()
      : super(fcValue: 'http://foo.bar?q=Spaces should be encoded');
}

class Url_UrlIsNotValid12_Stub extends _UrlStub {
  Url_UrlIsNotValid12_Stub() : super(fcValue: '//');
}

class Url_UrlIsNotValid13_Stub extends _UrlStub {
  Url_UrlIsNotValid13_Stub() : super(fcValue: '//a');
}

class Url_UrlIsNotValid14_Stub extends _UrlStub {
  Url_UrlIsNotValid14_Stub() : super(fcValue: '///a');
}

class Url_UrlIsNotValid15_Stub extends _UrlStub {
  Url_UrlIsNotValid15_Stub() : super(fcValue: '///');
}

class Url_UrlIsNotValid16_Stub extends _UrlStub {
  Url_UrlIsNotValid16_Stub() : super(fcValue: 'http:///a');
}

class Url_UrlIsNotValid17_Stub extends _UrlStub {
  Url_UrlIsNotValid17_Stub() : super(fcValue: 'foo.com');
}

class Url_UrlIsNotValid18_Stub extends _UrlStub {
  Url_UrlIsNotValid18_Stub() : super(fcValue: 'rdar://1234');
}

class Url_UrlIsNotValid19_Stub extends _UrlStub {
  Url_UrlIsNotValid19_Stub() : super(fcValue: 'h://test');
}

class Url_UrlIsNotValid20_Stub extends _UrlStub {
  Url_UrlIsNotValid20_Stub() : super(fcValue: 'http:// shouldfail.com');
}

class Url_UrlIsNotValid21_Stub extends _UrlStub {
  Url_UrlIsNotValid21_Stub() : super(fcValue: ':// should fail');
}

class Url_UrlIsNotValid22_Stub extends _UrlStub {
  Url_UrlIsNotValid22_Stub()
      : super(fcValue: 'http://foo.bar/foo(bar)baz quux');
}

class Url_UrlIsNotValid23_Stub extends _UrlStub {
  Url_UrlIsNotValid23_Stub() : super(fcValue: 'ftps://foo.bar/');
}

class Url_UrlIsNotValid24_Stub extends _UrlStub {
  Url_UrlIsNotValid24_Stub() : super(fcValue: 'http://-error-.invalid/');
}

class Url_UrlIsNotValid25_Stub extends _UrlStub {
  Url_UrlIsNotValid25_Stub() : super(fcValue: 'http://a.b--c.de/');
}

class Url_UrlIsNotValid26_Stub extends _UrlStub {
  Url_UrlIsNotValid26_Stub() : super(fcValue: 'http://-a.b.co');
}

class Url_UrlIsNotValid27_Stub extends _UrlStub {
  Url_UrlIsNotValid27_Stub() : super(fcValue: 'http://a.b-.co');
}

class Url_UrlIsNotValid28_Stub extends _UrlStub {
  Url_UrlIsNotValid28_Stub() : super(fcValue: 'http://0.0.0.0');
}

class Url_UrlIsNotValid29_Stub extends _UrlStub {
  Url_UrlIsNotValid29_Stub() : super(fcValue: 'http://10.1.1.0');
}

class Url_UrlIsNotValid30_Stub extends _UrlStub {
  Url_UrlIsNotValid30_Stub() : super(fcValue: 'http://10.1.1.255');
}

class Url_UrlIsNotValid31_Stub extends _UrlStub {
  Url_UrlIsNotValid31_Stub() : super(fcValue: 'http://224.1.1.1');
}

class Url_UrlIsNotValid32_Stub extends _UrlStub {
  Url_UrlIsNotValid32_Stub() : super(fcValue: 'http://1.1.1.1.1');
}

class Url_UrlIsNotValid33_Stub extends _UrlStub {
  Url_UrlIsNotValid33_Stub() : super(fcValue: 'http://123.123.123');
}

class Url_UrlIsNotValid34_Stub extends _UrlStub {
  Url_UrlIsNotValid34_Stub() : super(fcValue: 'http://3628126748');
}

class Url_UrlIsNotValid35_Stub extends _UrlStub {
  Url_UrlIsNotValid35_Stub() : super(fcValue: 'http://.www.foo.bar/');
}

class Url_UrlIsNotValid36_Stub extends _UrlStub {
  Url_UrlIsNotValid36_Stub() : super(fcValue: 'http://www.foo.bar./');
}

class Url_UrlIsNotValid37_Stub extends _UrlStub {
  Url_UrlIsNotValid37_Stub() : super(fcValue: 'http://.www.foo.bar./');
}

class Url_UrlIsNotValid38_Stub extends _UrlStub {
  Url_UrlIsNotValid38_Stub() : super(fcValue: 'http://10.1.1.1');
}

class Url_UrlIsNotValid39_Stub extends _UrlStub {
  Url_UrlIsNotValid39_Stub() : super(fcValue: 'http://10.1.1.254');
}

/* Remote parameters are provided */

/* None parameter is provided */
