import 'package:hasura_connect/hasura_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomHasuraConnect {
  static HasuraConnect getConnect(SharedPreferences shared) {
    if (shared.containsKey('token')) {
      String token = shared.get('token');
      return HasuraConnect(
        "https://loja-hasura.herokuapp.com/v1/graphql",
        token: (_) async => 'Bearer $token',
      );
    } else {
      return HasuraConnect(
        "https://loja-hasura.herokuapp.com/v1/graphql",
      );
    }
  }
}
