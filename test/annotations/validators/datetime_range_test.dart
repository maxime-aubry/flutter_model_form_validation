// import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
// import 'package:flutter_test/flutter_test.dart';

// import '../models/models.dart';
// import '../models/models.reflectable.dart';

// void main() {
//   initializeReflectable();

//   group('DateTimeRange.', () {
//     group('Test the priority between user and developer static data.', () {
//       test(
//           '"Min" and "max" are provided by user and developer. User data has priority.',
//           () async {
//         DateTimeRangeTest model = new DateTimeRangeTest(
//           new DateTime(2020, 8, 15),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), true);
//         expect(formState.status, EFormStatus.valid);
//         ValidationError error = formState.getError('value');
//         expect(error, isNull);
//       });

//       test('"Min" and "max" are provided by user only.', () async {
//         DateTimeRangeTest model = new DateTimeRangeTest(
//           new DateTime(2020, 8, 15),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), true);
//         expect(formState.status, EFormStatus.valid);
//         ValidationError error = formState.getError('value');
//         expect(error, isNull);
//       });

//       test('"Min" and "max" are provided by developer only.', () async {
//         DateTimeRangeTest model = new DateTimeRangeTest(
//           new DateTime(2019, 3, 15),
//         );
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), true);
//         expect(formState.status, EFormStatus.valid);
//         ValidationError error = formState.getError('value');
//         expect(error, isNull);
//       });
//     });

//     group('Test the validation > success.', () {
//       test('The value is equal to "min".', () async {
//         DateTimeRangeTest model = new DateTimeRangeTest(
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), true);
//         expect(formState.status, EFormStatus.valid);
//         ValidationError error = formState.getError('value');
//         expect(error, isNull);
//       });

//       test('The value is between "min" and "max".', () async {
//         DateTimeRangeTest model = new DateTimeRangeTest(
//           new DateTime(2020, 6, 1),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), true);
//         expect(formState.status, EFormStatus.valid);
//         ValidationError error = formState.getError('value');
//         expect(error, isNull);
//       });

//       test('The value is equal to "max".', () async {
//         DateTimeRangeTest model = new DateTimeRangeTest(
//           new DateTime(2020, 12, 31),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), true);
//         expect(formState.status, EFormStatus.valid);
//         ValidationError error = formState.getError('value');
//         expect(error, isNull);
//       });
//     });

//     group('Test the validation > failure.', () {
//       test('The value is smaller than "min".', () async {
//         DateTimeRangeTest model = new DateTimeRangeTest(
//           new DateTime(2019, 12, 31),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), false);
//         expect(formState.status, EFormStatus.invalid);
//         ValidationError error = formState.getError('value');
//         expect(error, isNotNull);
//         expect(error.propertyName, 'value');
//         expect(error.validatorType, Range);
//         expect(error.message, 'error message here');
//       });

//       test('The value is greater than "max".', () async {
//         DateTimeRangeTest model = new DateTimeRangeTest(
//           new DateTime(2021, 1, 1),
//           new DateTime(2020, 1, 1),
//           new DateTime(2020, 12, 31),
//         );
//         ModelFormState formState = new ModelFormState(model: model);

//         expect(await formState.validate(), false);
//         expect(formState.status, EFormStatus.invalid);
//         ValidationError error = formState.getError('value');
//         expect(error, isNotNull);
//         expect(error.propertyName, 'value');
//         expect(error.validatorType, Range);
//         expect(error.message, 'error message here');
//       });
//     });
//   });
// }
