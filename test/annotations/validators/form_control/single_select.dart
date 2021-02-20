import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../models/models.dart';
import '../../../models/models.reflectable.dart';
import 'stubs/single_select.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('Annotations > Validators > FormControl<TProperty> > SingleSelect.',
      () {
    group('Valid.', () {
      test('Value is into list of items.', () async {
        SingleSelect_ItemIsIntoListOfItems_Stub stub =
            new SingleSelect_ItemIsIntoListOfItems_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        SingleSelect_ValueIsNull_Stub stub =
            new SingleSelect_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('Add items to service after initialization.', () async {
        SingleSelect_AddItemsToServiceAfterInitialization_Stub stub =
            new SingleSelect_AddItemsToServiceAfterInitialization_Stub();
        stub.items.add(new SelectListItem<EGender>(EGender.other, 'other'));
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('Value is not into list of items.', () async {
        SingleSelect_ItemIsNotIntoListOfItems_Stub stub =
            new SingleSelect_ItemIsNotIntoListOfItems_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws exception of ValidatorParameterException type when items is null.',
          () async {
        SingleSelect_ThrowsValidatorParameterExceptionOnItemsIsNull_Stub stub =
            new SingleSelect_ThrowsValidatorParameterExceptionOnItemsIsNull_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'items is not defined.');
      });
    });
  });
}
