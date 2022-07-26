part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitialState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<UserEntity> users;
  UsersLoadedState(this.users);
}

class UsersFilteredState extends UsersState {
  final List<UserEntity> users;
  UsersFilteredState(this.users);
}