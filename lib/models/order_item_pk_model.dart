import 'package:ven_das/models/order_model.dart';

import 'product_model.dart';

class OderItemPK {
  OrderModel order;
  ProductModel product;

  OderItemPK({
    required this.order,
    required this.product,
  });
}
