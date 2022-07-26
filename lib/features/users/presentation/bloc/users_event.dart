part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class FetchUsersEvent extends UsersEvent {}

class SearchUsersEvent extends UsersEvent {
  final String search;
  SearchUsersEvent(this.search);
}

class CleanSearchEvent extends UsersEvent {

}
