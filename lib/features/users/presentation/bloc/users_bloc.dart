import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:inside/features/users/domain/entities/user_entity.dart';
import 'package:inside/features/users/domain/use_cases/fetch_users_usecase.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final IFetchUsersUseCase fetchUsersUseCase;
  List<UserEntity> users = [];
  List<UserEntity> usersFiltered = [];

  UsersBloc(this.fetchUsersUseCase) : super(UsersInitialState()) {
    on<FetchUsersEvent>(onFetch);

    on<SearchUsersEvent>(onSearch);

    on<CleanSearchEvent>(onCleanSearch);
  }

  Future<void> onFetch(FetchUsersEvent event, Emitter<UsersState> emit) async {
    
    users.clear();
    Future.delayed(const Duration(seconds: 1));
    users.addAll(await fetchUsersUseCase.call());

    emit(UsersLoadedState(users));
  }

  Future<void> onSearch(
      SearchUsersEvent event, Emitter<UsersState> emit) async {
    usersFiltered.clear();

    usersFiltered = users
        .where((user) =>
            user.nome.toLowerCase().contains(event.search.toLowerCase()))
        .toList();
    emit(UsersLoadedState(usersFiltered));
  }

  onCleanSearch(CleanSearchEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoadedState(users));
  }

  TextEditingController searchUser = TextEditingController();
}
