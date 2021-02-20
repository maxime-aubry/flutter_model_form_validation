import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../expect_exception.dart';
import '../../../models/models.dart';
import '../../../models/models.reflectable.dart';
import 'stubs/multi_select.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('Annotations > Validators > FormControl<TProperty> > MultiSelect.', () {
    group('Valid.', () {
      test('Values are into list of items.', () async {
        MultiSelect_ItemsAreIntoListOfItems_Stub stub =
            new MultiSelect_ItemsAreIntoListOfItems_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('value is null.', () async {
        MultiSelect_ValueIsNull_Stub stub = new MultiSelect_ValueIsNull_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });

      test('Add items to service after initialization.', () async {
        MultiSelect_AddItemsToServiceAfterInitialization_Stub stub =
            new MultiSelect_AddItemsToServiceAfterInitialization_Stub();
        stub.items.add(new SelectListItem<EGender>(EGender.other, 'other'));
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isTrue);
      });
    });

    group('Invalid.', () {
      test('Values are not into list of items.', () async {
        MultiSelect_ItemsAreNotIntoListOfItems_Stub stub =
            new MultiSelect_ItemsAreNotIntoListOfItems_Stub();
        bool isValid = await stub.validator.isValid(stub.control);
        expect(isValid, isFalse);
      });
    });

    group('Exceptions.', () {
      test(
          'Throws exception of ValidatorParameterException type when items is null.',
          () async {
        MultiSelect_ThrowsValidatorParameterExceptionOnItemsIsNull_Stub stub =
            new MultiSelect_ThrowsValidatorParameterExceptionOnItemsIsNull_Stub();
        expect_exception<ValidatorParameterException>(() async {
          await stub.validator.isValid(stub.control);
        }, 'items is not defined.');
      });
    });
  });
}
