// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) =>
          GetUsersList(usersListRepository: c<UsersListRepositoriesImpl>()))
      ..registerFactory((c) => const UsersListRepositoriesImpl())
      ..registerSingleton((c) => GetdataBloc());
  }
}
