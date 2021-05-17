class Vacina {
  int id = 0;
  String tipo = "";
  String motivo = "";
  String data = "";
  int animal_id = 0;

  Vacina(int id, String tipo, String data, String motivo, int animal_id) {
    this.id = id;
    this.tipo = tipo;
    this.motivo = motivo;
    this.data = data;
    this.animal_id = animal_id;
  }

  Vacina.fromJson(Map json)
      : id = json['id'],
        tipo = json['tipo'],
        motivo = json['motivo'],
        data = json['data'],
        animal_id = json['animal_id'];

  Map toJson() {
    return {
      'id': id,
      'tipo': tipo,
      'motivo': motivo,
      'data': data,
      'animal_id': animal_id
    };
  }
}
