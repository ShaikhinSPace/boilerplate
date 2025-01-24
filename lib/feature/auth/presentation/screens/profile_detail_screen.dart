import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/button/input_button.dart';
import 'package:record_keeping/common/widget/error_message_widget.dart';
import 'package:record_keeping/core/enums/sociair_enums.dart';
import 'package:record_keeping/core/extensions/build_context_extension.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/routing/navigation_service.dart';
import 'package:record_keeping/core/utils/ui/pagination/smart_pull_to_refresh.dart';
import 'package:record_keeping/core/utils/validators/input_validators.dart';
import 'package:record_keeping/feature/auth/domain/dao/user_model.dart';
import 'package:record_keeping/feature/auth/presentation/cubit/profile/my_profile_cubit.dart';
import 'package:record_keeping/feature/ui_template/presentation/widget/text_field_widget.dart';

import '../../../../core/config/di/di_injectable.dart';
import '../cubit/profile/my_profile_state.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final ValueNotifier<bool> _isToEditProfile = ValueNotifier<bool>(false);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<MyProfileCubit, MyProfileState>(
          listener: (BuildContext ctx, MyProfileState myProfileState) {
            if (myProfileState.updateProfileState.absNormalStatus ==
                AbsNormalStatus.success) {
              _isToEditProfile.value = false;
              context.showToastMessage(
                  toastEnum: ToastEnum.success,
                  toastMessage: 'Profile Updated Successfully !');
            }
          },
          builder: (BuildContext context, MyProfileState myProfileState) {
            UserModel? currentUser = myProfileState.profileState.data;
            _fullNameController =
                TextEditingController(text: currentUser?.name ?? '');
            _emailController =
                TextEditingController(text: currentUser?.email ?? '');

            return SmartPullToRefresh(
              onRefresh: () {
                getIt<MyProfileCubit>().resetProfileUpdateState();
                getIt<MyProfileCubit>().getMyProfile(isToRefresh: true);
              },
              child: SingleChildScrollView(
                primary: false,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            getIt<NavigationService>().pop();
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      // 10.verticalSpace,
                      // CircularCachedNetworkImage(
                      //   imageUrl: currentUser?.photo ?? '',
                      //   size: 100.w,
                      // ).center(),
                      20.verticalSpace,
                      ValueListenableBuilder<bool>(
                          valueListenable: _isToEditProfile,
                          builder: (_, bool isToEditProfile, __) {
                            return TextFieldWidget(
                              readOnly: !isToEditProfile,
                              enabled: isToEditProfile,
                              labelText: 'User Name',
                              controller: _fullNameController,
                              validator: InputValidators.userNameValidator,
                              textInputAction: TextInputAction.next,
                            ).padHorizontal();
                          }),
                      20.verticalSpace,
                      ValueListenableBuilder<bool>(
                          valueListenable: _isToEditProfile,
                          builder: (_, bool isToEditProfile, __) {
                            return TextFieldWidget(
                              readOnly: !isToEditProfile,
                              enabled: isToEditProfile,
                              labelText: 'E-mail',
                              controller: _emailController,
                              validator: InputValidators.validateEmail,
                              textInputAction: TextInputAction.done,
                            ).padHorizontal();
                          }),
                      // 20.verticalSpace,
                      // TextFieldWidget(
                      //   readOnly: true,
                      //   enabled: false,
                      //   labelText: 'Role',
                      //   initialValue: currentUser?.roleNames?.hr ?? '',
                      // ).padHorizontal(),
                      ErrorMessageWidget(
                        absNormalStatus:
                            myProfileState.updateProfileState.absNormalStatus,
                        failureState: myProfileState.updateProfileState.failure,
                        topSpacing: 40.h,
                        statusCode: 400,
                      ),
                      20.verticalSpace,
                      ValueListenableBuilder<bool>(
                          valueListenable: _isToEditProfile,
                          builder: (_, bool isToEditProfile, __) {
                            return myProfileState
                                        .updateProfileState.absNormalStatus ==
                                    AbsNormalStatus.loading
                                ? const CircularProgressIndicator().center()
                                : InputButtonWidget(
                                    title: isToEditProfile
                                        ? 'Update Profile'
                                        : 'Edit Profile',
                                    onTap: () {
                                      if (!isToEditProfile) {
                                        _isToEditProfile.value =
                                            !_isToEditProfile.value;
                                      } else {
                                        if (_formKey.currentState != null &&
                                            _formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          getIt<MyProfileCubit>().updateProfile(
                                              userModel:
                                                  (currentUser ?? UserModel())
                                                      .copyWith(
                                            name: _fullNameController.text,
                                            email: _emailController.text,
                                          ));
                                        }
                                      }
                                    },
                                  ).padHorizontal();
                          }),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
