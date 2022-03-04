import 'package:ven_das/order/http/order_rest.dart';

import '../../../models/order_model.dart';

class OrderRepository {
  final OrderRest api = OrderRest();

  Future<OrderModel> find(int id) async {
    return await api.find(id);
  }

  Future<List<OrderModel>> findAll() async {
    return await api.findAll();
  }

  Future<OrderModel> create(OrderModel order) async {
    return await api.create(order);
  }

  Future<OrderModel> update(OrderModel order) async {
    return await api.update(order);
  }

  Future<OrderModel> delete(int id) async {
    return await api.delete(id);
  }
}
