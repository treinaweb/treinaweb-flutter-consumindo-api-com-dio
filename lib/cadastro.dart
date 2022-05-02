import 'package:cadastro/home.dart';
import 'package:flutter/material.dart';

class CadastroView extends StatelessWidget {
  const CadastroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  children: const [
                    TextField(
                      decoration: InputDecoration(
                        label: Text('Nome'),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
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
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    "/home",
                    (route) => false,
                  );
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
