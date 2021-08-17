import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newproject/core/di/injector.dart';
import 'package:newproject/core/error/failures.dart';
import 'package:newproject/features/users_list/domain/entities/user.dart';
import 'package:newproject/features/users_list/domain/usecases/get_users_list.dart';

part 'getdata_event.dart';
part 'getdata_state.dart';

class GetdataBloc extends Bloc<GetdataEvent, GetdataState> {
  GetdataBloc() : super(GetdataInitial());
  GetUsersList? getUsersList = Injector.resolve<GetUsersList>();
  @override
  Stream<GetdataState> mapEventToState(
    GetdataEvent event,
  ) async* {
    if (event is FetchDataEvent) {
      final users = await getUsersList!.call();
      yield* getUsersListOrError(users);
    }
  }

  Stream<GetdataState> getUsersListOrError(
      Either<Failure, List<User>> users) async* {
    try {
      yield users.fold(
        (l) => Error(message: l.toString()),
        (r) => GetInitialData(users: r),
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
