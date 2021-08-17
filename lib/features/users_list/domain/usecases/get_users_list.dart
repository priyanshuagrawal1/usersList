import 'package:dartz/dartz.dart';
import 'package:newproject/core/error/failures.dart';
import 'package:newproject/features/users_list/data/repositories/users_repositories_impl.dart';
import 'package:newproject/features/users_list/domain/entities/user.dart';

import '../repositories/users_repositories.dart';

class GetUsersList {
  final UsersListRepository usersListRepository;
  GetUsersList({this.usersListRepository = const UsersListRepositoriesImpl()});

  Future<Either<Failure, List<User>>> call() async {
    return await usersListRepository.getUserList();
  }
}
