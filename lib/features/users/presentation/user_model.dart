import 'dart:convert';

import 'package:inside/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {

  final int id;
  final String nome;
  final String email;
  final String dataCadastro;
  final String telefone;
  final bool ativo;


  

  UserModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.dataCadastro,
    required this.telefone,
    required this.ativo,
  }):super(
    id: id,
    ativo: ativo,
    dataCadastro: dataCadastro,
    email: email,
    nome: nome,
    telefone: telefone

  );

  UserModel copyWith({
    int? id,
    String? nome,
    String? email,
    bool? ativo,
    String? dataCadastro,
    String? telefone,
  }) {
    return UserModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      ativo: ativo ?? this.ativo,
      dataCadastro: dataCadastro ?? this.dataCadastro,
      telefone: telefone ?? this.telefone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'ativo': ativo,
      'dataCadastro': dataCadastro,
      'telefone': telefone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      ativo: map['ativo'],
      dataCadastro: map['dataCadastro'],
      telefone: map['telefone'],
    );
  }

  String toJson() => json.encode(toMap());

  // factory UserModel.fromJson(String source) =>
  //     UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, nome: $nome, email: $email, ativo: $ativo, dataCadastro: $dataCadastro, telefone: $telefone)';
  }
}
