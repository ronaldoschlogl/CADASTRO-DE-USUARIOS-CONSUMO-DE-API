import 'package:inside/features/users/domain/entities/user_entity.dart';

import '../repositories/user_repository.dart';

abstract class IFetchUsersUseCase {
  Future<List<UserEntity>> call();
}

class FetchUsersUseCaseImp implements IFetchUsersUseCase {
  final IUserRepository repository;
  FetchUsersUseCaseImp(this.repository);

  @override
  Future<List<UserEntity>> call() async {
    return await repository.fetchUsers();
  }
}
