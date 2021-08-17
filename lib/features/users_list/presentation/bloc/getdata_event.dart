part of 'getdata_bloc.dart';

@immutable
abstract class GetdataEvent {}

class FetchDataEvent extends GetdataEvent {}

class AddUserEvent extends GetdataEvent {
  final user;

  AddUserEvent(this.user);
}
