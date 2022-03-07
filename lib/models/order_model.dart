import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) =>
    List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
  int? id;
  String? date;
  List<Item>? items;
  Client? client;

  OrderModel({
    this.id,
    this.date,
    this.items,
    this.client,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        date: json["date"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        client: Client.fromJson(json["client"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "client": client!.toJson(),
      };
}

class Client {
  int? id;
  String? cpf;
  String? name;
  String? lastname;

  Client({
    this.id,
    this.cpf,
    this.name,
    this.lastname,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
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

class Item {
  int? qtdade;
  Product? product;

  Item({
    this.qtdade,
    this.product,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        qtdade: json["qtdade"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "qtdade": qtdade,
        "product": product!.toJson(),
      };
}

class Product {
  int? id;
  String? description;

  Product({
    this.id,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
      };
}
