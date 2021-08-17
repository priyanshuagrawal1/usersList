import 'package:dartz/dartz.dart';
import 'package:newproject/core/error/failures.dart';

import 'package:newproject/features/users_list/domain/entities/user.dart';

abstract class UsersListRepository {
  Future<Either<Failure, List<User>>> getUserList();
}
