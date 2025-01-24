import 'package:equatable/equatable.dart';

import '../../../../../core/utils/abs_state/abs_normal_state.dart';
import '../../../domain/dao/user_model.dart';

abstract class MyProfileState extends Equatable {
  final AbsNormalState<UserModel> profileState;
  final AbsNormalState<UserModel> updateProfileState;
  final AbsNormalState<String?> logoutState;

  const MyProfileState({
    required this.profileState,
    required this.updateProfileState,
    required this.logoutState,
  });

  @override
  List<Object?> get props => <Object?>[
        updateProfileState,
        profileState,
        logoutState,
      ];
}

class MyProfileStateImpl extends MyProfileState {
  const MyProfileStateImpl({
    required super.profileState,
    required super.updateProfileState,
    required super.logoutState,
  });

  MyProfileStateImpl copyWith({
    AbsNormalState<UserModel>? profileState,
    AbsNormalState<UserModel>? updateProfileState,
    AbsNormalState<String?>? logoutState,
  }) {
    return MyProfileStateImpl(
      updateProfileState: updateProfileState ?? this.updateProfileState,
      profileState: profileState ?? this.profileState,
      logoutState: logoutState ?? this.logoutState,
    );
  }
}

class MyProfileInitialState extends MyProfileStateImpl {
  MyProfileInitialState()
      : super(
            updateProfileState: initialState<UserModel>(),
            profileState: initialState<UserModel>(),
            logoutState: initialState<String?>());
}
