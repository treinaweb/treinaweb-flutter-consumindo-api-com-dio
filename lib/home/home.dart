import 'package:cadastro/cadastro/cadastro.dart';
import 'package:cadastro/components/card.dart';
import 'package:cadastro/userMode.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listUser = ModalRoute.of(context)!.settings.arguments as List<User>?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.70,
                child: Column(
                  children: listUser
                          ?.map(
                            (user) =>
                                CardName(name: user.nome, idade: user.idade),
                          )
                          .toList() ??
                      [],
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/cadastro");
                },
                child: const Text('Acessar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
