class Animal {
  int id = 0;
  String nome = "";
  String raca = "";
  int userId = 0;

  Animal(int id, String nome, String raca, int userId) {
    this.id = id;
    this.nome = nome;
    this.raca = raca;
    this.userId = userId;
  }

  Animal.fromJson(Map json)
      : id = json['id'],
        nome = json['nome'],
        raca = json['raca'],
        userId = json['user_id'];

  Map toJson() {
    return {'id': id, 'nome': nome, 'raca': raca, 'user_id': userId};
  }
}
