import 'package:cadastro/cadastro/cadastro.dart';
import 'package:cadastro/components/card.dart';
import 'package:cadastro/home/controller.dart';
import 'package:cadastro/userMode.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<List<User>?>(
                future: controller.getAllUser(),
                builder: (ctx, snapshot) {
                  if (snapshot.hasData) {
                    final listUser = snapshot.data;
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.70,
                      child: Column(
                        children: listUser
                                ?.map(
                                  (user) => CardName(
                                    name: user.nome,
                                    idade: user.idade,
                                    userId: user.id!,
                                    onDelete: () async {
                                      await controller.deleteUser(user.id!);
                                      setState(() {});
                                    },
                                  ),
                                )
                                .toList() ??
                            [],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Text(
                      "Erro inesperado",
                      style: TextStyle(fontSize: 30),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
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
