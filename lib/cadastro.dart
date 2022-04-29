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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cadastro',
              style: TextStyle(fontSize: 30),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (ctx) => const HomeView(),
                  ),
                  (route) => false,
                );
              },
              child: const Text('Acessar'),
            )
          ],
        ),
      ),
    );
  }
}
