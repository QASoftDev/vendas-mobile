import 'dart:convert';

import 'package:ven_das/models/order_model.dart';
import 'package:ven_das/repository/i_order_interface.dart';
import 'package:http/http.dart' as http;

class OrderRepository implements IOrderRepository {
  final String getURL = "http://localhost:8080/orders";
  final Uri url = Uri.parse("http://localhost:8080/orders");

  @override
  Future<List<OrderModel>> findAllOrders() async {
    final response = await http.get(url);

    final List<Map<String, dynamic>> responseMap = jsonDecode(response.body);

    return responseMap
        .map<OrderModel>((resp) => OrderModel.fromMap(resp))
        .toList();
  }
}
