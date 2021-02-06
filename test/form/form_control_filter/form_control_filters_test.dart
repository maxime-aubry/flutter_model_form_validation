import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';
import '../../models/models_outside_of_library.dart';

class FormControlFilterTester<TProperty> with FormControlFilter<TProperty> {
  FormControlFilterTester() {
    super.checkAllowedFormControlType();
  }
}

class FormControlCustomFilterTester<TProperty> with FormControlFilter<TProperty> {
  FormControlCustomFilterTester() {
    List<ICheckFilter> filters = [
      new CheckEnum<TProperty>(),
    ];
    super.checkAllowedFormControlType(filters: filters);
  }
}

void main() {
  initializeReflectable();
  LibraryInitializer.initialize(libraryName: 'test.models');

  group('FormControlFilter.', () {
    test('FormControlFilter allows EGender.', () async {
      FormControlFilterTester<EGender> tester = new FormControlFilterTester<EGender>();
      expect(tester, isNotNull);
    });

    test('FormControlFilter does not allow EFakeEnum.', () async {
      expect(() {
        FormControlFilterTester<EFakeEnum> tester = new FormControlFilterTester<EFakeEnum>();
      }, throwsA(isInstanceOf<Exception>()));
    });
    
    test('FormControlFilter allows EGender using by restricted filters.', () async {
      FormControlCustomFilterTester<EGender> tester = new FormControlCustomFilterTester<EGender>();
      expect(tester, isNotNull);
    });
    
    test('FormControlFilter does not allow DateTime using by restricted filters.', () async {
      expect(() {
        FormControlCustomFilterTester<DateTime> tester = new FormControlCustomFilterTester<DateTime>();
      }, throwsA(isInstanceOf<Exception>()));
    });
  });
}
