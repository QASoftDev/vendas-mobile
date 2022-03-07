import 'dart:convert';

List<ClientModel> clientModelFromJson(String str) => List<ClientModel>.from(
    json.decode(str).map((x) => ClientModel.fromJson(x)));

String clientModelToJson(List<ClientModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientModel {
  int? id;
  String? cpf;
  String? name;
  String? lastname;

  ClientModel({
    this.id,
    this.cpf,
    this.name,
    this.lastname,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        cpf: json["cpf"],
        name: json["name"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cpf": cpf,
        "name": name,
        "lastname": lastname,
      };
}
