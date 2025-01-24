import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/svg_image_render_widget.dart';
import 'package:record_keeping/core/extensions/build_context_extension.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/local_storage/shared_prefs_func.dart';
import 'package:record_keeping/core/local_storage/shared_prefs_keys.dart';
import 'package:record_keeping/core/permission/permission_handler_mx.dart';
import 'package:record_keeping/core/routing/navigation_service.dart';
import 'package:record_keeping/core/routing/route_name.dart';
import 'package:record_keeping/core/utils/abs_state/abs_normal_state.dart';
import 'package:record_keeping/feature/auth/constants/auth_constants.dart';
import 'package:record_keeping/feature/auth/domain/dao/otp_dao.dart';
import 'package:record_keeping/feature/auth/presentation/cubit/register_cubit.dart';
import 'package:record_keeping/feature/auth/presentation/mixin/biometric_mixin.dart';
import 'package:record_keeping/feature/auth/presentation/screens/register_screen.dart';

import '../../../../common/widget/button/input_button.dart';
import '../../../../common/widget/error_message_widget.dart';
import '../../../../common/widget/text/heading_1_text_widget.dart';
import '../../../../common/widget/text/normal_text_widget.dart';
import '../../../../core/config/di/di_injectable.dart';
import '../../../../core/constants/assets_source.dart';
import '../../../../core/enums/sociair_enums.dart';
import '../../../../core/localization/l10.dart';
import '../../../../core/utils/ui/responsive_widget.dart';
import '../../../../core/utils/validators/input_validators.dart';
import '../../../ui_template/presentation/widget/text_field_widget.dart';
import '../../data/dto/login_form_model.dart';
import '../cubit/login_form_cubit.dart';

class LoginScreen extends StatefulWidget {
  final String? tenantId;

  const LoginScreen({
    super.key,
    this.tenantId,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with BioMetricMxn, PermissionHandlerMx {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    getIt<LoginFormCubit>().resetState();
    _mobileController = TextEditingController(
        text: getString(key: SharedPrefsKeys.loginUserName) ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: widget.tenantId != null ? AppBar() : null,
        body: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            primary: false,
            padding: EdgeInsets.zero,
            child: ResponsiveWidget(
              col12View: _buildLargeScreenView(),
              col10View: _buildLargeScreenView(),
              col8View: _buildLargeScreenView(),
              col2View: _buildLoginForm(),
              col4View: _buildLoginForm(),
              col6View: _buildLoginForm(),
            ).padHorizontal(),
          ),
        ),
      ),
    ).onTap(() {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  Widget _buildLargeScreenView() {
    return Row(
      children: <Widget>[
        Expanded(child: _buildLogo().center()),
        20.horizontalSpace,
        Expanded(
          child: _buildLoginForm(isDesktopView: true),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      AssetsSource.sociairBrandLogo,
      width: 250.w,
    );
  }

  Widget _buildLoginForm({
    bool isDesktopView = false,
  }) {
    return BlocConsumer<LoginFormCubit, AbsNormalState<String?>>(
      listener: (BuildContext ctx, AbsNormalState<String?> loginState) {
        if (loginState.absNormalStatus == AbsNormalStatus.success) {
          getIt<LoginFormCubit>().resetLoginState();
          getIt<NavigationService>().pushNamed(RouteName.landingScreenRoute);
        } else if (loginState.absNormalStatus == AbsNormalStatus.error) {
          getIt<LoginFormCubit>().resetLoginState();
          context.showToastMessage(
              toastEnum: ToastEnum.error,
              toastMessage: loginState.failure?.message ??
                  'Something went wrong. Please ! try again later.');
        }
      },
      builder: (BuildContext context, AbsNormalState<String?> loginState) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (!isDesktopView) ...<Widget>{
                _buildLogo(),
                40.verticalSpace,
              },
              Heading1TextWidget(title: l10.login),
              10.verticalSpace,
              _buildLoginBody(loginState)
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoginBody(AbsNormalState<String?> loginState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        NormalTextWidget(
          text: l10.enterUserName,
          maxLines: 2,
        ),
        40.verticalSpace,
        TextFieldWidget(
          labelText: 'Username',
          keyboardType: TextInputType.text,
          controller: _mobileController,
          validator: InputValidators.userNameValidatorForSignUp,
          onChanged: (String? v) {
            if (loginState.absNormalStatus == AbsNormalStatus.error) {
              getIt<LoginFormCubit>().resetState();
            }
          },
          suffixIcon: SvgImageRenderWidget(
            svgImagePath: AssetsSource.defaultAssetsSource.userSvg,
          ).padRight(
            right: 6.w,
          ),
          textInputAction: widget.tenantId != null
              ? TextInputAction.next
              : TextInputAction.done,
        ),
        10.verticalSpace,
        TextFieldWidget(
          labelText: 'Password',
          keyboardType: TextInputType.text,
          controller: _passwordController,
          isPassword: true,
          maxLines: 1,
          validator: InputValidators.validatePassword,
          onChanged: (String? v) {
            if (loginState.absNormalStatus == AbsNormalStatus.error) {
              getIt<LoginFormCubit>().resetState();
            }
          },
          suffixIcon: SvgImageRenderWidget(
            svgImagePath: AssetsSource.defaultAssetsSource.callSvg,
          ).padRight(
            right: 6.w,
          ),
          textInputAction: widget.tenantId != null
              ? TextInputAction.next
              : TextInputAction.done,
        ),
        20.verticalSpace,
        ErrorMessageWidget(
          absNormalStatus: loginState.absNormalStatus,
          failureState: loginState.failure,
          statusCode: 400,
          bottomSpacing: 10.h,
        ),
        loginState.absNormalStatus == AbsNormalStatus.loading
            ? const CircularProgressIndicator().center()
            : InputButtonWidget(
                title: l10.proceed,
                width: double.maxFinite,
                onTap: () async {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    FocusManager.instance.primaryFocus?.unfocus();
                    getIt<LoginFormCubit>().login(
                      loginFormModel: LoginFormModel(
                        username: _mobileController.text,
                        password: _passwordController.text,
                        tenantId: widget.tenantId,
                      ),
                    );
                  }
                },
              ),
      ],
    );
  }
}
