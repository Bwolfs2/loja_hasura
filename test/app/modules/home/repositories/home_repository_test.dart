import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:loja_hasura/app/modules/home/repositories/home_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  HomeRepository repository;
  MockClient client;

  setUp(() {
    repository = HomeRepository(null);
    client = MockClient();
  });

  group('HomeRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<HomeRepository>());
    });

  });
}
