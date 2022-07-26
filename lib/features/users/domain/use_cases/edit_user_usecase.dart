import 'package:inside/features/users/domain/entities/user_entity.dart';
import 'package:inside/features/users/domain/repositories/user_repository.dart';

abstract class IEditUserUseCase {
  Future<void> call(UserEntity user);
}

class EditUserCaseImp implements IEditUserUseCase {
  final IUserRepository repository;
  EditUserCaseImp(this.repository);

  @override
  Future<void> call(UserEntity user) async {
    return await repository.editUser(user);
  }
}