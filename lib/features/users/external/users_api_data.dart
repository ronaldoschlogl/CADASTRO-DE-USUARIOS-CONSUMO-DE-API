import 'package:dio/dio.dart';
import 'package:inside/features/users/data/datasource/user_datasource.dart';
import 'package:inside/features/users/domain/entities/user_entity.dart';
import 'package:inside/features/users/presentation/user_model.dart';

class UsersApiDataSourceImp implements IUsersDataSource {
  final Dio dio;
  UsersApiDataSourceImp(this.dio);

  @override
  Future<List<UserEntity>> fetchUsers() async {
    String path = 'https://acme-cadastro.herokuapp.com/Usuario';

    late List<UserEntity> newUsers = [];

    final Response result = await dio.get(path);

    newUsers = (result.data as List<dynamic>)
        .map((e) => UserModel.fromMap(e))
        .toList();

    return newUsers;
  }

  @override
  Future<void> editUser(UserEntity user) async {
    String path =
        'https://acme-cadastro.herokuapp.com/Usuario/alterar-senha/${user.id}';

    dio.post(path, data: {
      'senha': "senha atual",
      'novaSenha': "nova senha",
    });
  }
}
