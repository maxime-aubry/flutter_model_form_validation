import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'longitude_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for Longitude. Valid form.', () {
    LongitudeTest tester = new LongitudeTest(
      '2.2945',
      'E2°17.67',
      'E2°17\'40.2"',
    );
    bool isValid = ModelState.isValid<LongitudeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Longitude. Invalid form.', () {
    LongitudeTest tester = new LongitudeTest(
      '181.2945',
      'E2°62.67',
      'E2°17\'101.2"',
    );
    bool isValid = ModelState.isValid<LongitudeTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, Longitude);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error, 'invalid longitude');

    expect(ModelState.errors['b'].validatorType, Longitude);
    expect(ModelState.errors['b'].propertyName, 'b');
    expect(ModelState.errors['b'].error, 'invalid longitude');

    expect(ModelState.errors['c'].validatorType, Longitude);
    expect(ModelState.errors['c'].propertyName, 'c');
    expect(ModelState.errors['c'].error, 'invalid longitude');
  });
}

@easyValidator
class LongitudeTest {
  LongitudeTest(this.a, this.b, this.c);

  @Longitude(
    gpsFormat: GpsFormat.dd,
    error: 'invalid longitude',
  )
  final String a;

  @Longitude(
    gpsFormat: GpsFormat.dm,
    error: 'invalid longitude',
  )
  final String b;

  @Longitude(
    gpsFormat: GpsFormat.dms,
    error: 'invalid longitude',
  )
  final String c;
}
