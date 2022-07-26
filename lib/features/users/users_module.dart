import 'package:dio/dio.dart';
import 'package:inside/features/users/data/datasource/user_datasource.dart';
import 'package:inside/features/users/data/repositories/user_repository_imp.dart';
import 'package:inside/features/users/domain/repositories/user_repository.dart';
import 'package:inside/features/users/domain/use_cases/fetch_users_usecase.dart';
import 'package:inside/features/users/external/users_api_data.dart';
import 'package:provider/provider.dart';

final usersModule = [
  Provider<Dio>.value(value: Dio(),),


  Provider<IUsersDataSource>(create: (context) => UsersApiDataSourceImp(context.read<Dio>())),

  Provider<IUserRepository>(create: (context) => UserRepositoryImp(context.read<IUsersDataSource>())),
  Provider<IFetchUsersUseCase>(
      create: (context) =>
          FetchUsersUseCaseImp(context.read<IUserRepository>()))
];
