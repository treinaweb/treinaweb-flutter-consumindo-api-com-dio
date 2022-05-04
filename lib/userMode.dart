class User {
  String nome;
  int idade;
  String? id;
  User({required this.nome, required this.idade, this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        nome: json["name"],
        idade: json["idade"].runtimeType == int
            ? json["idade"]
            : int.parse(json["idade"]),
        id: json["id"]);
  }
}
