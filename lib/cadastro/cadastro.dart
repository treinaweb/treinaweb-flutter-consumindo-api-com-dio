import 'package:cadastro/cadastro/controller.dart';
import 'package:cadastro/home/home.dart';
import 'package:cadastro/userMode.dart';
import 'package:flutter/material.dart';

class CadastroView extends StatelessWidget {
  CadastroView({Key? key, required this.userId}) : super(key: key);
  final String? userId;
  final controller = CadastroController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        actions: [
          FutureBuilder<User>(
            future: controller.getUser(userId),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                final user = snapshot.data!;
                if (user.id != null) {
                  return const Icon(Icons.edit);
                }
                return const Icon(Icons.person);
              } else if (snapshot.hasError) {
                return const Icon(Icons.error);
              } else {
                return const Text("Carregando...");
              }
            },
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TextField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        label: Text('Nome'),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: controller.idadeController,
                      decoration: const InputDecoration(
                        label: Text('Idade'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  controller.addUser(context: context);
                },
                child: Visibility(
                  visible: userId == null,
                  child: const Text('Cadastrar'),
                  replacement: const Text("Editar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
