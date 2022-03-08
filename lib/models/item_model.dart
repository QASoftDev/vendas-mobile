import 'package:ven_das/models/product_model.dart';

import 'order_model.dart';

class Item {
  int? qtdade;
  ProductModel? product;

  Item({
    this.qtdade,
    this.product,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        qtdade: json["qtdade"],
        product: ProductModel.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "qtdade": qtdade,
        "product": product!.toJson(),
      };
}
