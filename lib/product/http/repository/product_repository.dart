import 'package:ven_das/models/product_model.dart';

import '../product_rest.dart';

class ProductRepository {
  final ProductRest api = ProductRest();

  Future<ProductModel> find(int id) async {
    return await api.find(id);
  }

  Future<List<ProductModel>> findAll() async {
    return await api.findAll();
  }

  Future<ProductModel> create(ProductModel product) async {
    return await api.create(product);
  }

  Future<ProductModel> update(ProductModel product) async {
    return await api.update(product);
  }

  Future<ProductModel> delete(int id) async {
    return await api.delete(id);
  }
}
