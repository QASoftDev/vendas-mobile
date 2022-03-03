import 'dart:convert';
import 'package:ven_das/models/client_model.dart';

import 'order_item_model.dart';

class OrderModel {
  int? id;
  String? date;
  List<OrderItem>? itens;
  ClientModel? client;

  OrderModel({
    this.id,
    this.date,
    this.itens,
    this.client,
  });

  static List<OrderModel> fromJsonList(String j) {
    final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
    return parsed.map<OrderModel>((map) => OrderModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'client': client?.toJson(),
      'itens': itens?.map((e) => (e) => e.toJson()).toList(),
    };
  }

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = (json['cpf']);
    client = ClientModel.fromJson(json['name']);
    itens = json['itens']
        .map<OrderItem>((itens) => OrderItem.fromJsom(json))
        .toList();
  }
}




// Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'date': date,
  //     'client': client,
  //     'itens': itens?.map((x) => x.toMap()).toList(),
  //   };
  // }

  // factory OrderModel.fromMap(Map<String, dynamic> map) {
  //   return OrderModel(
  //     id: map['id'] ?? '',
  //     date: (map['date']),
  //     client: map['client'],
  //     itens:
  //         List<OrderItem>.from(map['itens']?.map((x) => OrderItem.fromMap(x))),
  //   );
  // }

  //   //static OrderModel fromJson(String j) => OrderModel.fromMap(jsonDecode(j));
  // static List<OrderModel> fromJsonList(String j) {
  //   final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
  //   return parsed.map<OrderModel>((map) => OrderModel.fromJson(map)).toList();
  // }

  // //String toJson() => json.encode(toMap());


// OrderModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   date = DateTime.parse(json['cpf']);
  //   client = ClientModel.fromJson(json['name']);
  //   itens = json['itens']
  //       .map<OrderItem>((itens) => OrderItem.fromJsom(json))
  //       .toList();
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'date': date,
  //     'client': client?.toJson(),
  //     'itens': itens?.map((e) => (e) => e.toJson()).toList(),
  //   };
  // }

//   static OrderModel fromJson(String j) => OrderModel.fromMap(jsonDecode(j));

//   static List<OrderModel> fromJsonList(String j) {
//     final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
//     return parsed.map<OrderModel>((map) => OrderModel.fromMap(map)).toList();
//   }

//   String toJson() => jsonEncode(toMap());

//   static fromMap(jsonDecode) {}
// }

// Object? toMap() {}
