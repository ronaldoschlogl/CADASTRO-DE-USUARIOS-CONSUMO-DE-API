import 'package:inside/features/users/data/datasource/user_datasource.dart';
import 'package:inside/features/users/domain/entities/user_entity.dart';
import 'package:inside/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImp implements IUserRepository {
  final IUsersDataSource userDataSource;

  UserRepositoryImp(this.userDataSource);

  @override
  Future<List<UserEntity>> fetchUsers() async =>
      await userDataSource.fetchUsers();

  @override
  Future<void> editUser(UserEntity user) async {
    // TODO: implement editUser
    userDataSource.editUser(user);
  }
}
