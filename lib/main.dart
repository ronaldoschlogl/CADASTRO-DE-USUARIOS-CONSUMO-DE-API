import 'package:flutter/material.dart';
import 'package:inside/features/users/presentation/list_users_page.dart';
import 'package:inside/features/users/users_module.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...usersModule],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(245, 80, 47, 126)),
        ),
        home: const UsersPage(),
      ),
    );
  }
}
