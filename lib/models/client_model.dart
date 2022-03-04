class ClientModel {
  String? id;
  String? cpf;
  String? name;
  String? lastname;

  ClientModel({
    this.id,
    this.cpf,
    this.name,
    this.lastname,
  });

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cpf = json['cpf'];
    name = json['name'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cpf': cpf,
      'name': name,
      'lastname': lastname,
    };
  }
}
