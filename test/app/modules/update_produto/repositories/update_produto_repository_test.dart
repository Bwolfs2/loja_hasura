import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:loja_hasura/app/modules/update_produto/repositories/update_produto_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  UpdateProdutoRepository repository;
  MockClient client;

  setUp(() {
    repository = UpdateProdutoRepository(null);
    client = MockClient();
  });

  group('UpdateProdutoRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<UpdateProdutoRepository>());
    });
    
  });
}
