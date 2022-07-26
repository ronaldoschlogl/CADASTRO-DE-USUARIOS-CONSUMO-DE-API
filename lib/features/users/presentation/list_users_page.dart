import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inside/features/users/domain/entities/user_entity.dart';
import 'package:inside/features/users/domain/use_cases/fetch_users_usecase.dart';
import 'package:inside/features/users/presentation/bloc/users_bloc.dart';
import 'package:inside/features/users/presentation/show_user_page.dart';
import 'dart:async';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late UsersBloc bloc;
  bool _isSearch = false;
  Timer? _debounce;

  @override
  void initState() {
    bloc = UsersBloc(context.read<IFetchUsersUseCase>());
    bloc.add(FetchUsersEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: _isSearch ? _searchTextField() : const Text('Lista de Usuários'),
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        actions: [
          _isSearch
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      bloc.add(CleanSearchEvent());
                      bloc.searchUser.text='';
                      _isSearch = !_isSearch;
                    });
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearch = !_isSearch;
                    });
                  },
                ),
        ],
        centerTitle: true,
      ),
      body: BlocProvider<UsersBloc>(
          create: (context) {
            return bloc;
          },
          child: BlocConsumer<UsersBloc, UsersState>(
            listener: (context, state) {},
            builder: (context, state) {
              return getBody(state);
            },
          )),
    );
  }

  Widget getBody(UsersState state) {
    if (state is UsersInitialState) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    } else if (state is UsersLoadedState) {
      return RefreshIndicator(
          onRefresh: () async {
            bloc.add(FetchUsersEvent());
          },
          child: listUsers(state.users));
    } else if (state is UsersFilteredState) {
      return listUsers(state.users);
    } else {
      return const Center(
        child: Text("Erro"),
      );
    }
  }

  Widget listUsers(List<UserEntity> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(2.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ShowUser(user: users[index]))),
            child: Card(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: SizedBox(
                width: 300,
                height: 100,
                child: Center(
                  child: Text(
                    users[index].nome,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _searchTextField() {
    return TextField(
      controller: bloc.searchUser,
      onChanged: (value) {
        if (_debounce?.isActive ?? false) _debounce!.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () {
          bloc.add(SearchUsersEvent(value));
        });
      },
      autofocus: true,
      cursorColor: Theme.of(context).colorScheme.secondaryContainer,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 2)),
        hintText: 'Filtrar',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 20,
        ),
      ),
    );
  }
}
