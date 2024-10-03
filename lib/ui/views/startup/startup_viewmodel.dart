import 'package:stacked/stacked.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/services/tokensession_service.dart';

class StartupViewModel extends BaseViewModel {
  final tokenService = locator<TokensessionService>();
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    await tokenService.checkToken();
  }
}
