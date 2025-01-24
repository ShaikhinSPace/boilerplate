import '../../feature/auth/domain/dao/user_model.dart';

extension UserModelListExtension on List<UserModel> {
  // List<int> toIds() {
  //   return where((UserModel user) =>
  //           user.id != null && user.id.toString().isNotEmpty)
  //       .map((UserModel user) => user.id!)
  //       .toList();
  // }

  List<UserModel> getUsersFromIds(List<int> ids) {
    return where((UserModel user) => ids.contains(user.id)).toList();
  }
}
