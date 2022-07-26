import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inside/features/users/data/datasource/user_datasource.dart';
import 'package:inside/features/users/external/users_api_data.dart';
import 'package:inside/features/users/presentation/user_model.dart';

void main() {
  test('should return a list of users when call fetchUsers', () async {
    final dio = Dio();
    String path = 'https://acme-cadastro.herokuapp.com/Usuario';

    IUsersDataSource _dataSource;
    _dataSource = UsersApiDataSourceImp(dio);
    
    final newUsers =  await _dataSource.fetchUsers();

    expect(newUsers.length, greaterThan(0));
  });

  test('should edit a user', () async {
    final dio = Dio();

    IUsersDataSource _dataSource;
    _dataSource = UsersApiDataSourceImp(dio);

    final user = await _dataSource.fetchUsers();

    _dataSource.editUser(user.first);

    // expect( a, b);
  });
}
