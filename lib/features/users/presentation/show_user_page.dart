import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inside/features/users/domain/entities/user_entity.dart';

class ShowUser extends StatefulWidget {
  const ShowUser({super.key, required this.user});
  final UserEntity user;
  @override
  State<ShowUser> createState() => ShowUserState();
}

class ShowUserState extends State<ShowUser> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(widget.user.nome),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "ID: ${widget.user.id}",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nome: ${widget.user.nome}",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Email: ${widget.user.email}",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Ativo: ${widget.user.ativo}",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "data cadastro: ${widget.user.dataCadastro}",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Telefone: ${widget.user.telefone}",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
