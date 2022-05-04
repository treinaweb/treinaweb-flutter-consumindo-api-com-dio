import 'package:cadastro/cadastro/controller.dart';
import 'package:cadastro/home/home.dart';
import 'package:cadastro/userMode.dart';
import 'package:flutter/material.dart';

class CadastroView extends StatelessWidget {
  CadastroView({Key? key, required this.user}) : super(key: key);
  final User? user;
  final controller = CadastroController();
  final nameController = TextEditingController();
  final idadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      nameController.text = user!.nome;
      idadeController.text = user!.idade.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
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
                      controller: nameController,
                      decoration: const InputDecoration(
                        label: Text('Nome'),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: idadeController,
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
                  final listUsers = controller.addUser(
                      nome: nameController.text, idade: idadeController.text);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    "/home",
                    (route) => false,
                    arguments: listUsers,
                  );
                },
                child: Visibility(
                  visible: user == null,
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
