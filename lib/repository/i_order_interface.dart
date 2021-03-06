import '../../../models/order_model.dart';

abstract class IOrderRepository {
  Future<List<OrderModel>> findAllOrders();
}
