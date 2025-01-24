// import 'package:injectable/injectable.dart';
// import 'package:record_keeping/core/services/pusher/pusher_core_services.dart';
//
// import '../../config/di/di_injectable.dart';
//
// interface class PusherChannel {
//   // channel to streamline agent status as online, offline, only on outgoing mode
//   String agentCallRealTimeReportChannel =
//       'agent-call-realtime-report-{tenant_id}';
//
//   // channel to update status like Agent A is reviewing User A conversation
//   String pendingMessageReviewUpdateChannel =
//       'private-social_media_activity_review_update_{tenant_id}_{user_id}';
//
//   // channel to update active conversation
//   String activeConversationUpdateChannel =
//       'private-social_media_conversation_update_{tenant_id}_{user_id}';
//
//   // channel to update conversation list i.e. pending, reviewed, all
//   String updateConversationListChannel =
//       'private-social_media_activity_update_{tenant_id}_{user_id}';
// }
//
// @lazySingleton
// class PusherService {
//   PusherChannel get _pusherChannel => PusherChannel();
//
//   String? get _tenantId => '-1';
//
//   // getIt<MyProfileCubit>().state.profileState.data?.tenant?.id;
//
//   int? get _userId => -1;
//
//   // int? get _userId => getIt<MyProfileCubit>().state.profileState.data?.id;
//
//   void subscribeAgentInfo() async {
//     getIt<PusherCoreService>().subscribeChannel(
//         channelName: _pusherChannel.agentCallRealTimeReportChannel
//             .replaceAll('{tenant_id}', '$_tenantId'));
//   }
//
//   void unSubscribeAgentInfo({
//     required String meetingId,
//     required String meetingChannel,
//   }) {
//     getIt<PusherCoreService>().unSubscribeChannel(
//       channelName: _pusherChannel.agentCallRealTimeReportChannel
//           .replaceAll('{tenant_id}', '$_tenantId'),
//     );
//   }
//
//   void subscribeSocialMediaActivityReviewUpdate() {
//     getIt<PusherCoreService>().subscribeChannel(
//       channelName: _pusherChannel.pendingMessageReviewUpdateChannel
//           .replaceAll('{tenant_id}', '$_tenantId')
//           .replaceAll('{user_id}', '$_userId'),
//     );
//   }
//
//   void unSubscribeSocialMediaActivityReviewUpdate() {
//     getIt<PusherCoreService>().unSubscribeChannel(
//       channelName: _pusherChannel.pendingMessageReviewUpdateChannel
//           .replaceAll('{tenant_id}', '$_tenantId')
//           .replaceAll('{user_id}', '$_userId'),
//     );
//   }
//
//   void subscribeActiveConversationUpdate() {
//     getIt<PusherCoreService>().subscribeChannel(
//       channelName: _pusherChannel.activeConversationUpdateChannel
//           .replaceAll('{tenant_id}', '$_tenantId')
//           .replaceAll('{user_id}', '$_userId'),
//     );
//   }
//
//   void unSubscribeActiveConversationUpdate() {
//     getIt<PusherCoreService>().unSubscribeChannel(
//       channelName: _pusherChannel.activeConversationUpdateChannel
//           .replaceAll('{tenant_id}', '$_tenantId')
//           .replaceAll('{user_id}', '$_userId'),
//     );
//   }
//
//   void subscribeConversationList() {
//     getIt<PusherCoreService>().subscribeChannel(
//       channelName: _pusherChannel.updateConversationListChannel
//           .replaceAll('{tenant_id}', '$_tenantId')
//           .replaceAll('{user_id}', '$_userId'),
//     );
//   }
//
//   void unSubscribeConversationList() {
//     getIt<PusherCoreService>().unSubscribeChannel(
//       channelName: _pusherChannel.updateConversationListChannel
//           .replaceAll('{tenant_id}', '$_tenantId')
//           .replaceAll('{user_id}', '$_userId'),
//     );
//   }
// }
