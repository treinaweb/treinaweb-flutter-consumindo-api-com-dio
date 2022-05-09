import 'package:cadastro/app/modules/cadastro/cadastro.dart';
import 'package:cadastro/app/modules/home/home.dart';
import 'package:cadastro/userMode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (setting) {
        if (setting.name == "/cadastro") {
          final user = setting.arguments as User?;
          return MaterialPageRoute(
            builder: (ctx) => CadastroView(userId: user?.id),
          );
        }
      },
      routes: {
        "/home": (ctx) => const HomeView(),
      },
      initialRoute: "/home",
    );
  }
}
