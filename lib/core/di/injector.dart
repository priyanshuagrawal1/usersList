import 'package:kiwi/kiwi.dart';
import 'package:newproject/features/users_list/data/repositories/users_repositories_impl.dart';
import 'package:newproject/features/users_list/domain/repositories/users_repositories.dart';
import 'package:newproject/features/users_list/domain/usecases/get_users_list.dart';
import 'package:newproject/features/users_list/presentation/bloc/getdata_bloc.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer? container;

  static void setup() {
    container = KiwiContainer();
    _$Injector().configure();
  }

  static final resolve = container!.resolve;
  @Register.singleton(GetUsersList)
  @Register.factory(UsersListRepositoriesImpl)
  @Register.singleton(GetdataBloc)
  void configure();
}
