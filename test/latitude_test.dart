import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'latitude_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('Test for Latitude. Valid form.', () {
    LatitudeTest tester = new LatitudeTest(
      '48.8583',
      'N48°51.498',
      'N48°51\'29.88"',
    );
    bool isValid = ModelState.isValid<LatitudeTest>(tester);
    expect(isValid, true);
    expect(ModelState.errors.isEmpty, true);
  });

  test('Test for Latitude. Invalid form.', () {
    LatitudeTest tester = new LatitudeTest(
      '-91.8583',
      'N91°51.498',
      'N48°60\'29.88"',
    );
    bool isValid = ModelState.isValid<LatitudeTest>(tester);
    expect(isValid, false);

    expect(ModelState.errors['a'].validatorType, Latitude);
    expect(ModelState.errors['a'].propertyName, 'a');
    expect(ModelState.errors['a'].error, 'invalid latitude');

    expect(ModelState.errors['b'].validatorType, Latitude);
    expect(ModelState.errors['b'].propertyName, 'b');
    expect(ModelState.errors['b'].error, 'invalid latitude');

    expect(ModelState.errors['c'].validatorType, Latitude);
    expect(ModelState.errors['c'].propertyName, 'c');
    expect(ModelState.errors['c'].error, 'invalid latitude');
  });
}

@easyValidator
class LatitudeTest {
  LatitudeTest(this.a, this.b, this.c);

  @Latitude(
    gpsFormat: GpsFormat.dd,
    error: 'invalid latitude',
  )
  final String a;

  @Latitude(
    gpsFormat: GpsFormat.dm,
    error: 'invalid latitude',
  )
  final String b;

  @Latitude(
    gpsFormat: GpsFormat.dms,
    error: 'invalid latitude',
  )
  final String c;
}
