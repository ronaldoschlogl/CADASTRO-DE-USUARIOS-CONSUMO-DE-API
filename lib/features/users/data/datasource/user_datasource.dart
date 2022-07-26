import 'package:inside/features/users/domain/entities/user_entity.dart';

abstract class IUsersDataSource {
  Future<List<UserEntity>> fetchUsers();
  Future<void> editUser(UserEntity user);
}
