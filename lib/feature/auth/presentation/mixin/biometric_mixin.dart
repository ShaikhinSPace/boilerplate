// import 'package:local_auth/local_auth.dart';
import 'package:record_keeping/core/local_storage/shared_prefs_func.dart';
import 'package:record_keeping/core/local_storage/shared_prefs_keys.dart';
import 'package:record_keeping/feature/auth/data/dto/login_form_model.dart';

mixin class BioMetricMxn {
  // final LocalAuthentication auth = LocalAuthentication();

  // Future<bool> get isBiometricSupport async => await auth.canCheckBiometrics;

  Future<bool> biometricAuthenticationRequest() async {
    // bool isAuthentication = await auth.authenticate(
    //   localizedReason: 'Let OS determine authentication method',
    //   options: const AuthenticationOptions(
    //     stickyAuth: true,
    //     useErrorDialogs: true,
    //   ),
    // );

    return false;
  }

  void setFingerPrintSettingEnabled() async {
    await setBool(
      key: SharedPrefsKeys.isFingerPrintEnabled,
      value: true,
    );
  }

  bool? get isFingerPrintEnabled {
    return getBool(key: SharedPrefsKeys.isFingerPrintEnabled);
  }

  LoginFormModel getSavedLoginCreds() {
    String? mobileNumber = getString(key: SharedPrefsKeys.loginMobileNumber);
    String? password = getString(key: SharedPrefsKeys.loginPassword);

    return LoginFormModel(
      username: mobileNumber ?? '',
      password: password,
    );
  }
}
