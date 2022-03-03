import 'dart:convert';

import 'package:ven_das/api.dart';
import 'package:ven_das/models/order_model.dart';
import 'package:http/http.dart' as http;

class OrderRest {
  Future<OrderModel> find(int id) async {
    final http.Response response =
        await http.get(Uri.http(API.endpoint, '/orders/${id}'));
    if (response.statusCode == 200) {
      return OrderModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Erro ao buscar pedido: ${id} [code: ${response.statusCode}]');
    }
  }

  Future<List<OrderModel>> findAll() async {
    final http.Response response =
        await http.get(Uri.http(API.endpoint, '/orders'));
    if (response.statusCode == 200) {
      return OrderModel.fromJsonList(json.decode(response.body));
    } else {
      throw Exception('Erro ao buscar todas os pedidos.');
    }
  }

  Future<OrderModel> create(OrderModel order) async {
    final http.Response response =
        await http.post(Uri.http(API.endpoint, '/orders'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: order.toJson());
    if (response.statusCode == 201) {
      return OrderModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao inserir Pedido');
    }
  }

  Future<OrderModel> update(OrderModel order) async {
    final http.Response response =
        await http.put(Uri.http(API.endpoint, '/orders'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: order.toJson());
    if (response.statusCode == 200) {
      return order;
    } else {
      throw Exception('Erro ao alterar o pedido: ${order.id} .');
    }
  }

  Future<OrderModel> delete(int id) async {
    final http.Response response = await http.delete(
        Uri.http(API.endpoint, '/orders/${id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      return OrderModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao remover o  pedido: ${id} .');
    }
  }
}
