import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/appbar/sociair_appbar.dart';
import 'package:record_keeping/core/config/di/di_injectable.dart';
import 'package:record_keeping/core/localization/l10.dart';
import 'package:record_keeping/core/routing/navigation_service.dart';
import 'package:record_keeping/core/routing/route_name.dart';
import 'package:record_keeping/core/utils/ui/abs_normal_view.dart';
import 'package:record_keeping/core/utils/ui/pagination/smart_pull_to_refresh.dart';
import 'package:record_keeping/feature/auth/presentation/cubit/profile/my_profile_cubit.dart';

import '../../../auth/presentation/cubit/profile/my_profile_state.dart';
import '../widget/profile_leading_widget.dart';
import '../widget/profile_preference_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    getIt<MyProfileCubit>().getMyProfile(isToRefresh: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SociairAppBar(
        title: l10.profile,
        isCenterTitle: false,
      ),
      body: SmartPullToRefresh(
        onRefresh: () async {
          getIt<MyProfileCubit>().getMyProfile(isToRefresh: true);
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BlocBuilder<MyProfileCubit, MyProfileStateImpl>(
                builder: (BuildContext ctx, MyProfileStateImpl state) {
                  return AbsNormalView(
                    errorWidget: const SizedBox(),
                    isToEnablePullToRefresh: false,
                    noDataWidget: const SizedBox(),
                    absNormalStatus: state.profileState.absNormalStatus,
                    onTapToRefresh: () {},
                    child: ProfileLeadingWidget(
                      shorName: state.profileState.data?.name ?? 'N/A',
                      name: state.profileState.data?.username,
                    ),
                  );
                },
              ),
              20.verticalSpace,
              ProfilePreferencesWidget(
                onChangePassword: () {
                  getIt<NavigationService>().pushNamed(
                    RouteName.changePasswordScreenRoute,
                  );
                },
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
