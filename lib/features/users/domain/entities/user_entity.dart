class UserEntity {
  int id;
  String nome;
  String email;
  String telefone;
  String dataCadastro;
  bool ativo;

  UserEntity({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.dataCadastro,
    required this.ativo,
  });
}
