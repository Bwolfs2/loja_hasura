import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja_hasura/app/modules/splash/splash_controller.dart';
import 'package:loja_hasura/app/modules/splash/splash_module.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var controller = SplashModule.to.get<SplashController>();
  checkLogin() async {
    var result = await controller.checkLogin();

    if (result) {
      Modular.to.pushReplacementNamed("/home");
    } else {
      Modular.to.pushReplacementNamed("/auth");
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
