import 'package:dartz/dartz.dart';
import 'package:newproject/features/users_list/data/datasources/remote_data.dart';
import 'package:newproject/features/users_list/domain/entities/user.dart';
import 'package:newproject/core/error/failures.dart';
import 'package:newproject/features/users_list/domain/repositories/users_repositories.dart';

class UsersListRepositoriesImpl implements UsersListRepository {
  const UsersListRepositoriesImpl();
  @override
  Future<Either<Failure, List<User>>> getUserList() async {
    try {
      final usersList = await GetData.fetchData();
      return Right(usersList);
    } on Exception catch (e) {
      return Left(ServerFailure());
    }
  }
}
