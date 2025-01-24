import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_service/network/failure_state.dart';

import '../../enums/sociair_enums.dart';
import '../../typedef/sociair_type_def.dart';
import '../abs_state/abs_normal_state.dart';
import '../abs_state/abs_pagination_state.dart';
import '../abs_state/abs_state_extension.dart';

mixin class APICallMethodMx {
  Future<AbsPaginationState<List<T>>> callApiForPagination<T>({
    required AbsPaginationState<List<T>> absPaginationState,
    required Future<DynamicFailure> Function() apiCall,
    required bool isToRefresh,
    required Function fromJson,
    required void Function(Response<dynamic> l) onSuccess,
    required void Function(FailureState failure) onFailure,
  }) async {
    AbsPaginationState<List<T>> updatedStated = absPaginationState;
    if (updatedStated.currentPage <= updatedStated.lastPage) {
      DynamicFailure responseData = await apiCall();
      responseData.fold((Response<dynamic> l) {
        onSuccess(l);
        updatedStated = updatedStated.copyWith(
          absNormalStatus: AbsNormalStatus.success,
          data: getPaginationListData<T>(
            stateData: absPaginationState.data ?? <T>[],
            isToRefresh: isToRefresh,
            l: l,
            fromJson: fromJson,
          ),
          currentPage: (getCurrentStatePage(l: l).currentPage ?? 1),
          lastPage: getCurrentStatePage(l: l).lastPage ?? 1,
          totalRecord: getCurrentStatePage(l: l).total ?? 0,
        );
      }, (FailureState r) {
        onFailure(r);
        updatedStated = updatedStated.copyWith(
          absNormalStatus: AbsNormalStatus.error,
          failure: r,
        );
      });
    }
    return updatedStated;
  }

  Future<AbsNormalState<List<T>>> callApiForList<T>({
    required AbsNormalState<List<T>> absNormalState,
    required Future<DynamicFailure> Function() apiCall,
    required Function fromJson,
    required void Function() onSuccess,
    required void Function(FailureState failure) onFailure,
  }) async {
    AbsNormalState<List<T>> updatedStated = absNormalState;
    DynamicFailure responseData = await apiCall();
    responseData.fold((Response<dynamic> l) {
      updatedStated = updatedStated.copyWith(
        absNormalStatus: AbsNormalStatus.success,
        data: getSuccessDataOnList<T>(
          l: l,
          fromJson: fromJson,
        ),
      );
      onSuccess();
    }, (FailureState r) {
      onFailure(r);
      updatedStated = updatedStated.copyWith(
        absNormalStatus: AbsNormalStatus.error,
        failure: r,
      );
    });
    return updatedStated;
  }

  Future<AbsNormalState<T>> callApiForMap<T>({
    required AbsNormalState<T> absNormalState,
    required Future<DynamicFailure> Function() apiCall,
    required Function fromJson,
    required void Function(Response<dynamic>? l) onSuccess,
    required void Function(FailureState failure) onFailure,
  }) async {
    AbsNormalState<T> updatedStated = absNormalState;
    DynamicFailure responseData = await apiCall();
    responseData.fold((Response<dynamic> l) {
      updatedStated = updatedStated.copyWith(
        absNormalStatus: AbsNormalStatus.success,
        data: getSuccessDataOnMap<T>(
          l: l,
          fromJson: fromJson,
        ),
      );
      onSuccess(l);
    }, (FailureState r) {
      onFailure(r);
      updatedStated = updatedStated.copyWith(
        absNormalStatus: AbsNormalStatus.error,
        failure: r,
      );
    });
    return updatedStated;
  }

  Future<AbsNormalState<T>> callApiForSuccess<T>({
    required AbsNormalState<T> absNormalState,
    required Future<DynamicFailure> Function() apiCall,
    required void Function(Response<dynamic> responseData) onSuccess,
    required void Function(FailureState failure) onFailure,
  }) async {
    AbsNormalState<T> updatedStated = absNormalState;
    DynamicFailure responseData = await apiCall();
    responseData.fold((Response<dynamic> l) {
      updatedStated =
          updatedStated.copyWith(absNormalStatus: AbsNormalStatus.success);
      onSuccess(l);
    }, (FailureState r) {
      onFailure(r);
      updatedStated = updatedStated.copyWith(
        absNormalStatus: AbsNormalStatus.error,
        failure: r,
      );
    });
    return updatedStated;
  }
}

abstract class BaseCubit<State> extends Cubit<State> with APICallMethodMx {
  BaseCubit(super.initialState);
}

abstract class BaseBloc<Event, State> extends Bloc<Event, State>
    with APICallMethodMx {
  BaseBloc(super.initialState);
}

class APICallMethod extends APICallMethodMx {}
