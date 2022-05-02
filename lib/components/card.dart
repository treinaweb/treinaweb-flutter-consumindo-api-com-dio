import 'package:cadastro/userMode.dart';
import 'package:flutter/material.dart';

class CardName extends StatelessWidget {
  final String name;
  final int idade;
  const CardName({Key? key, required this.name, required this.idade})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                '$idade anos',
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  "/cadastro",
                  arguments: User(nome: name, idade: idade),
                );
              },
              icon: const Icon(Icons.edit),
            ),
          )
        ],
      ),
    );
  }
}
