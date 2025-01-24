import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:network_service/network/failure_state.dart';

typedef FutureDynamicFailure = Future<Either<Response<dynamic>, FailureState>>;
typedef DynamicFailure = Either<Response<dynamic>, FailureState>;
typedef GestureTapCallback = void Function();
typedef VoidCallback = void Function()?;
typedef VoidCallbackWithValue<T> = void Function(T? value)?;
