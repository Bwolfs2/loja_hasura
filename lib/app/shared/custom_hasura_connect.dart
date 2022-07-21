import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hive_cache_interceptor/hive_cache_interceptor.dart';

// ignore: avoid_classes_with_only_static_members
class CustomHasuraConnect {
  static HasuraConnect getConnect(FirebaseAuth auth) {
    return HasuraConnect(
      "https://loja-hasura.herokuapp.com/v1/graphql",
      interceptors: [
        TokenInterceptor(auth),
        LogInterceptor(),
        HiveCacheInterceptor(),
      ],
      headers: {},
    );
  }
}

class TokenInterceptor extends InterceptorBase implements Interceptor {
  final FirebaseAuth auth;
  TokenInterceptor(this.auth);

  @override
  Future? onRequest(Request request, HasuraConnect connect) async {
    var user = await auth.currentUser;
    var token = await user?.getIdToken(true);
    if (token != null) {
      try {
        request.headers["Authorization"] = "Bearer $token";
        return request;
      } on Exception {
        return null;
      }
    } else {
      Modular.to.pushReplacementNamed("/login");
    }
    return super.onRequest(request, connect);
  }
}
