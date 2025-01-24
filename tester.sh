#!/bin/zsh

# Navigate to the lib directory
cd lib/feature || { echo "Failed to cd to lib directory"; exit 1; }
# Print the current directory to confirm
pwd

# Prompt the user for the folder name
echo "Enter the name of the module you want to create:"
read module_name

# Check if the folder name is not empty
if [ -z "$module_name" ]; then
    echo "Error: Folder name cannot be empty."
    exit 1
fi

# Create the folder
mkdir "$module_name"

# Check if mkdir was successful
if [ $? -eq 0 ]; then
    echo "Folder '$module_name' created successfully."
else
    echo "Error: Failed to create folder '$module_name'."
fi

mkdir -p "${module_name}"/data/{dto,repo_impl} "${module_name}"/domain/{dao,repo} "${module_name}"/presentation/{screens,widget,cubit,bloc}

echo "Enter the file name of repository you want to keep:"
read repo_file_name

# Check if the folder name is not empty
if [ -z "$repo_file_name" ]; then
    echo "Error: Repository file name cannot be empty."
    exit 1
fi

# Prompt the user for the folder name
echo "Enter the name of the repository you want to create:"
read repo_name

# Check if the folder name is not empty
if [ -z "$repo_name" ]; then
    echo "Error: Repository name cannot be empty."
    exit 1
fi


# Prompt the user to enter 0 or 1
echo ""
echo "=========== Generate pagination state or normal state ================= "
echo "Please enter 0 or 1: "
echo "Enter 1 to generate pagination state else it will generate normal state "
read is_pagination_state
echo "======================================================================= "

echo ""
echo "=========== Generate bloc or cubit ================= "
echo "Please re-enter 0 or 1: "
echo "Enter 1 to generate bloc else it will generate cubit"
read is_to_create_bloc

# Compact conditional assignment
pageNo=$( [ "$is_pagination_state" -eq 1 ] && echo 'int pageNo = 1,' || echo '' )
# Compact conditional assignment for queryParams
queryParams=''
if [ "$is_pagination_state" -eq 1 ]; then
  queryParams="queryParams: <String, dynamic>{
    'page': pageNo,
  },"
else
  queryParams="queryParams: <String, dynamic>{},"
fi

# Create a repository implementation
echo "
import 'package:injectable/injectable.dart';
import 'package:network_service/export.dart';
import 'package:record_keeping/core/network/base_api_request.dart';
import 'package:record_keeping/core/typedef/sociair_type_def.dart';
import 'package:record_keeping/core/config/di/di_injectable.dart';
import '../../data/repo_impl/"$repo_file_name"_repo_impl.dart';

interface class "$repo_name"Endpoint {

}

@LazySingleton(as: "$repo_name"Repo)
class "$repo_name"RepoImpl extends "$repo_name"Repo {
  "$repo_name"Endpoint get _endPoints => "$repo_name"Endpoint();

    @override
    FutureDynamicFailure get"$repo_name"List({
      $pageNo
      bool isToRefresh = false,
    }) async {
      return getIt<BaseApiRequest>().getResponse(
        endPoint: _endPoints.,
        $queryParams
        apiMethods: ApiMethods.get,
        isToCache: false,
        isToRefresh: isToRefresh,
      );
    }
}
" > "${module_name}/domain/repo/"$repo_file_name"_repo.dart"


# Create a repository
echo "
import 'package:record_keeping/core/typedef/sociair_type_def.dart';

abstract class "$repo_name"Repo {
    FutureDynamicFailure get"$repo_name"List({
      $pageNo
      bool isToRefresh = false,
    });
}
" > "${module_name}/data/repo_impl/"$repo_file_name"_repo_impl.dart"

# Check if the commands were successful
if [ $? -eq 0 ]; then
    echo "Directories and files created successfully."
else
    echo "Error: Failed to create directories or files."
    exit 1
fi


echo ""
echo "=========== Which method to call to handle your current api response ? ================= "
echo "Enter 1 : callApiForMap"
echo "Enter 2 : callApiForSuccess"
echo "Enter 3 : callApiForList"
echo "Enter 4 : callApiForPagination"
read method_type


bloc_pagination_state=""
bloc_normal_state=""

cubit_pagination_state="
  import 'package:dio/dio.dart';
  import 'package:network_service/network/failure_state.dart';
  import 'package:record_keeping/core/utils/abs_state/abs_pagination_state.dart';
  import 'package:record_keeping/core/utils/base/base_bloc.dart';

  class "$repo_name"Cubit extends BaseCubit<AbsPaginationState<List<>>> {
    "$repo_name"Cubit() : super(initialPaginationState<List<>>());

    void resetState() => emit(initialPaginationState<List<>>());

    void get"$repo_name"Data({bool isToRefresh = false}) async {
      if (isToRefresh || state.currentPage == 1) {
        emit(refreshPaginationState(<>[]));
      }
      AbsPaginationState<List<>> updatedState = await callApiForPagination(
        absPaginationState: state,
        isToRefresh: isToRefresh,
        fromJson: .fromJson,
        apiCall: ()=>getIt<"$repo_name"Repo>(),
        onSuccess: (Response<dynamic> responseData){},
        onFailure: (FailureState r){},
      );

      emit(updatedState);
    }
  }
"

cubit_for_map="
  import 'package:dio/dio.dart';
  import 'package:network_service/network/failure_state.dart';
  import 'package:record_keeping/core/config/di/di_injectable.dart';
  import 'package:record_keeping/core/utils/abs_state/abs_normal_state.dart';
  import 'package:record_keeping/core/utils/base/base_bloc.dart';
  class "$repo_name"Cubit extends BaseCubit<AbsNormalState<>> {
    "$repo_name"Cubit() : super(initialState<>());

    void resetState() => emit(initialState<>());

    void get"$repo_name"Data({bool isToRefresh = false}) async {
      if (isToRefresh) {
        emit(refreshState<>(null));
      }

      AbsNormalState<> updatedState = await callApiForMap(
        absNormalState: state,
        apiCall: ()=>getIt<"$repo_name"Repo>(),
        onSuccess: (Response<dynamic>? responseData){},
        onFailure: (FailureState r){}, fromJson: .fromJson,
      );

      emit(updatedState);
    }
  }
"

cubit_for_list="
  import 'package:dio/dio.dart';
  import 'package:network_service/network/failure_state.dart';
  import 'package:record_keeping/core/config/di/di_injectable.dart';
  import 'package:record_keeping/core/utils/abs_state/abs_normal_state.dart';
  import 'package:record_keeping/core/utils/base/base_bloc.dart';
  class "$repo_name"Cubit extends BaseCubit<AbsNormalState<List<>>> {
    "$repo_name"Cubit() : super(initialState<List<>>());

    void resetState() => emit(initialState<List<>>());

    void get"$repo_name"Data({bool isToRefresh = false}) async {
      if (isToRefresh) {
        emit(refreshState<List<>>(<>[]));
      }

      AbsNormalState<List<String>> updatedState = await callApiForList(
        absNormalState: state,
        apiCall: ()=>getIt<"$repo_name"Repo>(),
        onSuccess: () {},
        onFailure: (FailureState r) {}, fromJson: .fromJson,
      );

      emit(updatedState);
    }
  }
"

cubit_for_success="
  import 'package:dio/dio.dart';
  import 'package:network_service/network/failure_state.dart';
  import 'package:record_keeping/core/config/di/di_injectable.dart';
  import 'package:record_keeping/core/utils/abs_state/abs_normal_state.dart';
  import 'package:record_keeping/core/utils/base/base_bloc.dart';
  class "$repo_name"Cubit extends BaseCubit<AbsNormalState<>> {
    "$repo_name"Cubit() : super(initialState<>());

    void resetState() => emit(initialState<>());

    void get"$repo_name"Data({bool isToRefresh = false}) async {
      if (isToRefresh) {
        emit(refreshState<>(null));
      }

      AbsNormalState<> updatedState = await callApiForSuccess(
        absNormalState: state,
        apiCall: ()=>getIt<"$repo_name"Repo>(),
        onSuccess: (Response<dynamic> responseData){},
        onFailure: (FailureState r){},
      );

      emit(updatedState);
    }
  }
"

# Generate bloc or cubit
if [ "$is_to_create_bloc" -eq 1 ]; then
    echo "" > "${module_name}/presentation/bloc/${repo_file_name}_bloc.dart"
    if [ "$is_pagination_state" -eq 1 ]; then

        echo "generate pagination state"
    elif [ "$is_pagination_state" -eq 0 ]; then
        echo "generate normal state"
    else
        echo ""
    fi
elif [ "$is_to_create_bloc" -eq 0 ]; then
      case "$method_type" in
          1)
              echo "$cubit_for_map" > "${module_name}/presentation/cubit/${repo_file_name}_cubit.dart"
              ;;
          2)
              echo "$cubit_for_success" > "${module_name}/presentation/cubit/${repo_file_name}_cubit.dart"
              ;;
          3)
              echo "$cubit_for_list" > "${module_name}/presentation/cubit/${repo_file_name}_cubit.dart"
              ;;
          4)
              echo "$cubit_pagination_state" > "${module_name}/presentation/cubit/${repo_file_name}_cubit.dart"
              ;;
          *)
              echo 'invalid key'
              ;;
      esac
else
    echo ""
fi





