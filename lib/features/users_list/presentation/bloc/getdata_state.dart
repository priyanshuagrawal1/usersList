part of 'getdata_bloc.dart';

@immutable
abstract class GetdataState {
  List<User>? users;
  User? user;
  GetdataState({this.users});
}

class GetdataInitial extends GetdataState {}

class GetInitialData extends GetdataState {
  @override
  final List<User>? users;

  GetInitialData({
    this.users,
  });
}

class Error extends GetdataState {
  final String message;

  Error({required this.message});
}
