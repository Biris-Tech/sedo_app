import 'package:flutter_test/flutter_test.dart';
import 'package:sedo_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('UpdateProfilViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
