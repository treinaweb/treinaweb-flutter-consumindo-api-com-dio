import 'package:flutter/material.dart';

class CadastroView extends StatelessWidget {
  const CadastroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
              onPressed: () {},
              child: const Text('Acessar'),
            )
          ],
        ),
      ),
    );
  }
}
