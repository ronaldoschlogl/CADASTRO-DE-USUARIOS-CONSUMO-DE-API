import 'package:flutter_test/flutter_test.dart';
import 'package:inside/features/users/presentation/user_model.dart';

import '../../../../../mocks.dart';

void main() {
  test('user model ...', () async {
    final list =
        apiResponseMock.map((item) => UserModel.fromMap(item)).toList();

    expect(list.first.id, 1);
    expect(list.first.nome, "Pedro Paulo");
    expect(list.first.email, "pedro@acme.com.br");
    expect(list.first.telefone, "45999990001");
    expect(list.first.dataCadastro, "2022-01-02T00:00:00");
    expect(list.first.ativo, true);
  });
}
