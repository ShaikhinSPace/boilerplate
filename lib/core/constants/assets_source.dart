interface class AttachmentAssetsSource {
  static const String _basePath = 'assets/svg/attachment/';
  String documentSvg = '${_basePath}document.svg';
  String pdfSvg = '${_basePath}pdf.svg';
}

interface class ChatAssetsSource {
  static const String _basePath = 'assets/svg/chat/';
  String cameraSvg = '${_basePath}camera.svg';
  String gallerySvg = '${_basePath}gallery.svg';
  String micSvg = '${_basePath}mic.svg';
  String checkSvg = '${_basePath}check.svg';
  String doubleCheckSvg = '${_basePath}double_check.svg';
  String searchSvg = '${_basePath}search.svg';
  String sentSvg = '${_basePath}sent.svg';
  String addNoteSvg = '${_basePath}add_note.svg';
  String copyLinkSvg = '${_basePath}copy_link.svg';
  String replySvg = '${_basePath}backward.svg';
  String forwardSvg = '${_basePath}forward.svg';
  String productSvg = '${_basePath}product.svg';
}

interface class BottomNavAssetsSource {
  static const String _basePath = 'assets/svg/bottom_nav/';
  String chatSvg = '${_basePath}chat.svg';
  String activeChatSvg = '${_basePath}active_chat.svg';
  String homeSvg = '${_basePath}home.svg';
  String activeHomeSvg = '${_basePath}active_home.svg';
  String profileSvg = '${_basePath}profile.svg';
  String activeProfileSvg = '${_basePath}active_profile.svg';
  String shopSvg = '${_basePath}shop.svg';
  String activeShopSvg = '${_basePath}active_shop.svg';

  String callSvg = '${_basePath}call.svg';
  String activeCallSvg = '${_basePath}active_call.svg';

  HrBottomNavAssetSource get hr => HrBottomNavAssetSource();
}

interface class DefaultAssetsSource {
  static const String _basePath = 'assets/svg/default/';
  String userSvg = '${_basePath}user.svg';
  String menuSvg = '${_basePath}menu.svg';
  String preferenceSvg = '${_basePath}preference.svg';
  String filterResetSvg = '${_basePath}filter_reset.svg';
  String arrowDownSvg = '${_basePath}arrow_down.svg';
  String callSvg = '${_basePath}call.svg';
  String arrowRightSvg = '${_basePath}arrow_right.svg';
  String pipelineSvg = '${_basePath}pipeline_stage.svg';

  String searchResultSvg = '${_basePath}search_result.svg';
  String calenderSvg = '${_basePath}calender.svg';

  String cancelSvg = '${_basePath}cancel.svg';
  String refreshSvg = '${_basePath}refresh.svg';
  String noDataSvg = '${_basePath}no_data.svg';
  String clearSvg = '${_basePath}clear.svg';
  String deleteSvg = '${_basePath}delete.svg';
  String addSvg = '${_basePath}add.svg';
  String placeHolderSvg = '${_basePath}placeholder.svg';
}

interface class SettingAssetsSource {
  static const String _basePath = 'assets/svg/settings/';
  String logoutSvg = '${_basePath}logout.svg';
  String passwordSvg = '${_basePath}password.svg';
  String arrowRightSvg = '${_basePath}arrow_right.svg';
}

interface class AuthAssets {
  static const String _basePath = 'assets/svg/auth';
  String mail = '$_basePath/mail.svg';
  String fingerPrintSvg = '$_basePath/finger_print.svg';
}

interface class HrAssetSource {
  static const String _basePath = 'assets/svg/hr';

  String leaveBalance = '$_basePath/leave_balance.svg';
  String lateArrival = '$_basePath/late_arrival.svg';
  String missingCheckout = '$_basePath/missing_checkout.svg';
  String noAcknowledgement = '$_basePath/no_acknowledgement.svg';
  String noLeaveAttendance = '$_basePath/no_leave_attendance.svg';
  String misssingUpdate = '_$_basePath/missing_update.svg';
  String notificationIcon = '$_basePath/notification.svg';
  String qrCode = '$_basePath/qr_code.svg';
  String birthdatyIcon = '$_basePath/birthday_icon.svg';
  String holidayIcon = '$_basePath/holiday.svg';
  String hrPolicyIcon = '$_basePath/hr_policy.svg';
  String hrLateArrival = '$_basePath/hrlate_arrival.svg';
  String hrUpdates = '$_basePath/updates.svg';
  String hrLogistic = '$_basePath/logistic.svg';
  String hrCommentIcon = '$_basePath/comment_icon.svg';
  String hrPdfIcon = '$_basePath/pdf_icon.svg';
  String hrPasswordIcon = '$_basePath/password_icon.svg';
  String hrThemeIcon = '$_basePath/theme_icon.svg';
  String hrLogoutIcon = '$_basePath/logout_icon.svg';
  String qrIcon = '$_basePath/qr.png';
  String attachmentIcon = '$_basePath/attachment.svg';
}

interface class HrBottomNavAssetSource {
  static const String _basePath = 'assets/svg/hr';
  String home = '$_basePath/home.svg';
  String update = '$_basePath/update.svg';
  String attendance = '$_basePath/attendance.svg';
  String leave = '$_basePath/leave.svg';
}

interface class TaskAssetSource {
  static const String _basePath = 'assets/task';

  String taskSvg = '$_basePath/task.svg';
}

class AssetsSource {
  AssetsSource._();

  // static const String sociairBrandLogo = 'assets/svg/sociair.svg';
  static const String sociairBrandLogo = 'assets/logo/logo.png';
  static const String closeIconSvg = 'assets/svg/close_icon.svg';
  static const String filterIconSvg = 'assets/svg/filter_icon.svg';
  static const String editIconSvg = 'assets/svg/edit_icon.svg';

  static AttachmentAssetsSource get attachmentAssetsSource =>
      AttachmentAssetsSource();

  static ChatAssetsSource get chatAssetsSource => ChatAssetsSource();

  static BottomNavAssetsSource get bottomNavAssetsSource =>
      BottomNavAssetsSource();

  static DefaultAssetsSource get defaultAssetsSource => DefaultAssetsSource();

  static SettingAssetsSource get settingAssetsSource => SettingAssetsSource();

  static AuthAssets get auth => AuthAssets();

  static HrAssetSource get hr => HrAssetSource();

  static TaskAssetSource get task => TaskAssetSource();
}
