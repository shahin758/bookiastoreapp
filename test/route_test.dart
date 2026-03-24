import 'package:flutter_test/flutter_test.dart';
import 'package:bookiastoreapp/core/routes/routes.dart';

void main() {
  test('Route paths should be unique', () {
    final paths = [
      Routes.splashscreen,
      Routes.welcomescreen,
      Routes.loginscreen,
      Routes.registerscreen,
      Routes.homescreen,
      Routes.mainappscreen,
      Routes.createnewpassword,
      Routes.otpverfication,
      Routes.passwordchanged,
      Routes.forgetpassword,
      Routes.detailsscreen,
      Routes.wishlistscreen,
    ];

    final uniquePaths = paths.toSet();
    expect(paths.length, uniquePaths.length, reason: 'Duplicate route paths found');
  });
}
