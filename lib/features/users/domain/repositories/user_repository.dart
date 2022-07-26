import 'package:inside/features/users/domain/entities/user_entity.dart';

abstract class IUserRepository {
  Future<List<UserEntity>> fetchUsers();
  Future<void> editUser(UserEntity user);

  
}
