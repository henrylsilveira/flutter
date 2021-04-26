class Animal {
  int id;
  String nome;
  String raca;
  int userId;

  Animal(
      {required this.id,
      required this.nome,
      required this.raca,
      required this.userId});

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      nome: json['nome'],
      raca: json['raca'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['raca'] = this.raca;
    data['user_id'] = this.userId;
    return data;
  }
}
