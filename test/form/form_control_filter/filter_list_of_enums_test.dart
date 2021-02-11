import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../models/models.dart';
import '../../models/models.reflectable.dart';
import '../../models/models_outside_of_library.dart';

void main() {
  setUp(() {
    initializeReflectable();
    LibraryInitializer.initialize(libraryName: 'test.models');
  });

  group('CheckListOfEnum.', () {
    test('CheckListOfEnum returns true for List<EGender>.', () async {
      CheckListOfEnum<List<EGender>> checkType =
          new CheckListOfEnum<List<EGender>>();
      expect(checkType.checkFilter(), true);
    });

    test('CheckListOfEnum returns false for List<EFakeEnum>.', () async {
      CheckListOfEnum<List<EFakeEnum>> checkType =
          new CheckListOfEnum<List<EFakeEnum>>();
      expect(checkType.checkFilter(), false);
    });

    test('CheckListOfEnum returns false for List<DateTime>.', () async {
      CheckListOfEnum<List<DateTime>> checkType =
          new CheckListOfEnum<List<DateTime>>();
      expect(checkType.checkFilter(), false);
    });
  });
}
