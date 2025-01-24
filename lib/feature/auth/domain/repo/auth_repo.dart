import 'package:record_keeping/core/typedef/sociair_type_def.dart';
import 'package:record_keeping/feature/auth/data/dto/login_form_model.dart';
import 'package:record_keeping/feature/auth/domain/dao/user_model.dart';

import '../../data/dto/password_model.dart';
import '../../data/dto/register_user_dto.dart';

abstract class AuthRepo {
  FutureDynamicFailure login({required LoginFormModel loginFormModel});
  FutureDynamicFailure checkUserExist({required String mobileNumber});

  FutureDynamicFailure logout();

  FutureDynamicFailure forgotPassword({
    required String emailAddress,
    required String tenantId,
  });

  FutureDynamicFailure getMyProfile({bool isToRefresh = false});

  FutureDynamicFailure updateMyProfile({required UserModel userModel});

  FutureDynamicFailure changePassword({required PasswordModel passwordModel});

  FutureDynamicFailure registerNewUser(
      {required RegisterUserDTO registerUserDTO});

  FutureDynamicFailure verifyOTP({
    required String id,
    required String otp,
    required String mobileNo,
    required String password,
  });

  FutureDynamicFailure resentOtp({
    required String mobileNo,
  });
}
