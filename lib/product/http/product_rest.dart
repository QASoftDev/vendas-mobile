import 'dart:convert';
import 'package:ven_das/api.dart';
import 'package:http/http.dart' as http;
import 'package:ven_das/models/product_model.dart';

class ProductRest {
  Future<ProductModel> find(int id) async {
    final http.Response response =
        await http.get(Uri.http(API.endpoint, '/products/${id}'));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Erro ao buscar produto: ${id} [code: ${response.statusCode}]');
    }
  }

  Future<List<ProductModel>> findAll() async {
    List<ProductModel> productModel = [];
    final http.Response response =
        await http.get(Uri.http(API.endpoint, 'products'));
    if (response.statusCode == 200) {
      var json = response.body;

      return productModelFromJson(json);

      //return productModel = ProductModel.fromJson(jsonMap) as List<ProductModel>;

      //return ProductModel.fromJsonList(json.decode(response.body));
    } else {
      throw Exception('Erro ao buscar todos os produto.');
    }
  }

  Future<ProductModel> create(ProductModel product) async {
    final http.Response response =
        await http.post(Uri.http(API.endpoint, 'products'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: product.toJson());
    if (response.statusCode == 201) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao inserir Produto');
    }
  }

  Future<ProductModel> update(ProductModel product) async {
    final http.Response response =
        await http.put(Uri.http(API.endpoint, 'products/${product.id}'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: product.toJson());
    if (response.statusCode == 200) {
      return product;
    } else {
      throw Exception('Erro ao alterar o produto: ${product.id} .');
    }
  }

  Future<ProductModel> delete(int id) async {
    final http.Response response = await http.delete(
        Uri.http(API.endpoint, 'products/${id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao remover o produto: ${id} .');
    }
  }
}
