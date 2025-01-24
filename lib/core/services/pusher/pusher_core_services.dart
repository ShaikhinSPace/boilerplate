// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:injectable/injectable.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
// import 'package:record_keeping/core/services/pusher/pusher_event_listener.dart';
// import 'package:record_keeping/core/services/pusher/pusher_service.dart';
//
// import '../../config/di/di_injectable.dart';
// import '../../global_data/sociair_global_var_data.dart';
// import '../../local_storage/shared_prefs_func.dart';
// import '../../local_storage/shared_prefs_keys.dart';
//
// @lazySingleton
// class PusherCoreService {
//   List<String> _subscribedChannels = <String>[];
//
//   PusherEventListener pusherEventLister = PusherEventListener();
//
//   PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
//
//   bool isPusherInitialized = false;
//
//   /// FUNC [initializePusher] : Initialize Pusher
//   void initializePusher() async {
//     try {
//       String? tenantId = getString(key: SharedPrefsKeys.tenantId);
//       String? tenantDomain = getString(key: SharedPrefsKeys.tenantDomain);
//
//       String token = SociairGlobalVarData.accessToken ?? '';
//       if (token.isEmpty) {
//         log("::: Can't initialize pusher, user don't have access token :::");
//         return;
//       }
//       await pusher.init(
//         apiKey: 'app-key',
//         cluster: 'mt1',
//         onConnectionStateChange: onConnectionStateChange,
//         onError: onError,
//         onSubscriptionSucceeded: onSubscriptionSucceeded,
//         onEvent: onEvent,
//         onSubscriptionError: onSubscriptionError,
//         onDecryptionFailure: onDecryptionFailure,
//         onMemberAdded: onMemberAdded,
//         onMemberRemoved: onMemberRemoved,
//         onSubscriptionCount: onSubscriptionCount,
//         // if local on android use 10.0.2.2
//         host: 'wss2.sociair.com',
//         authEndpoint: 'https://central-api.sociair.com/broadcasting/auth',
//         useTLS: true,
//         enableStats: true,
//         logToConsole: true,
//         wsPort: 443,
//         wssPort: 443,
//         authParams: <String, Map<String, String>>{
//           'headers': <String, String>{
//             'Authorization': 'Bearer $token',
//             'Origin': 'https://$tenantDomain',
//             'Referer': 'https://$tenantDomain/',
//             'X-Tenant': '$tenantId',
//           }
//         },
//       );
//       await pusher.connect();
//       isPusherInitialized = true;
//       log('::: Pusher Initialization Success :::');
//       Future<void>.delayed(const Duration(seconds: 1)).then((_) {
//         getIt<PusherService>().subscribeAgentInfo();
//       });
//     } catch (e) {
//       log('::: Pusher Initialization Error [initializePusher] ::: $e');
//       isPusherInitialized = false;
//     }
//   }
//
//   /// FUNC [subscribeChannel] : Subscribe Channel
//   void subscribeChannel({required String channelName}) async {
//     if (_subscribedChannels.contains(channelName)) return;
//     try {
//       await pusher.subscribe(channelName: channelName);
//     } catch (e) {
//       log('::: Pusher Channel Subscription Error [$channelName] ::: $e');
//     }
//   }
//
//   /// FUNC [unSubscribeChannel] : Unsubscribe Channel
//   void unSubscribeChannel({required String channelName}) async {
//     if (!_subscribedChannels.contains(channelName)) {
//       return;
//     }
//     try {
//       await pusher.unsubscribe(channelName: channelName);
//       _subscribedChannels.remove(channelName);
//     } catch (e) {
//       log('::: Pusher Channel Unsubscribe Error [$channelName] ::: $e');
//     }
//   }
//
//   /// FUNC [disconnectPusher] : Terminate Pusher & All Unsubscribe All Subscribed Channels
//   void disconnectPusher() async {
//     if (isPusherInitialized) {
//       await pusher.disconnect();
//       _subscribedChannels = [];
//       isPusherInitialized = false;
//     }
//   }
//
//   /// FUNC [onConnectionStateChange] : Status of Pusher Current & Previous State
//   /// State Like: CONNECTING, DISCONNECTION, CONNECTED, DISCONNECTED
//   void onConnectionStateChange(dynamic currentState, dynamic previousState) {
//     log('Connection: $currentState');
//   }
//
//   /// FUNC [onError] : Display Error Message If Any Issue Aries
//   void onError(String message, int? code, dynamic e) {
//     log('onError: $message code: $code exception: $e');
//   }
//
//   /// FUNC [onEvent] : Global Function That Listen Events Related To Subscribed Channel
//   void onEvent(PusherEvent event) {
//     if (!_subscribedChannels.contains(event.channelName)) {
//       _subscribedChannels.add(event.channelName);
//     }
//     if (event.data != null) {
//       Map<String, dynamic> decodedData = json.decode(event.data.toString());
//       pusherEventLister.listenAndHandlePusherEvent(
//         type: event.eventName,
//         data:
//             decodedData.containsKey('data') ? decodedData['data'] : decodedData,
//       );
//     }
//   }
//
//   void onSubscriptionSucceeded(String channelName, dynamic data) {
//     log('onSubscriptionSucceeded: $channelName data: $data');
//   }
//
//   void onSubscriptionError(String message, dynamic e) {
//     log('onSubscriptionError: $message Exception: $e');
//   }
//
//   void onDecryptionFailure(String event, String reason) {
//     log('onDecryptionFailure: $event reason: $reason');
//   }
//
//   void onMemberAdded(String channelName, PusherMember member) {
//     log('onMemberAdded: $channelName user: $member');
//   }
//
//   void onMemberRemoved(String channelName, PusherMember member) {
//     log('onMemberRemoved: $channelName user: $member');
//   }
//
//   void onSubscriptionCount(String channelName, int subscriptionCount) {
//     log('onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount');
//   }
// }
