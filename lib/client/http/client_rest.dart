import 'dart:convert';
import 'package:ven_das/api.dart';
import 'package:http/http.dart' as http;
import 'package:ven_das/models/client_model.dart';

class ClientRest {
  Future<ClientModel> find(int id) async {
    final http.Response response =
        await http.get(Uri.http(API.endpoint, '/clients/${id}'));
    if (response.statusCode == 200) {
      return ClientModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Erro ao buscar cliente: ${id} [code: ${response.statusCode}]');
    }
  }

  Future<List<ClientModel>> findAll() async {
    List<ClientModel> clientModel = [];
    final http.Response response =
        await http.get(Uri.http(API.endpoint, 'clients'));
    if (response.statusCode == 200) {
      var json = response.body;

      return clientModelFromJson(json);

      //return clientModel = ClientModel.fromJson(jsonMap) as List<ClientModel>;

      //return ClientModel.fromJsonList(json.decode(response.body));
    } else {
      throw Exception('Erro ao buscar todos os clientes.');
    }
  }

  Future<ClientModel> create(ClientModel client) async {
    final http.Response response =
        await http.post(Uri.http(API.endpoint, 'clients'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: client.toJson());
    if (response.statusCode == 201) {
      return ClientModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao inserir Pedido');
    }
  }

  Future<ClientModel> update(ClientModel client) async {
    final http.Response response =
        await http.put(Uri.http(API.endpoint, 'clients/${client.id}'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: client.toJson());
    if (response.statusCode == 200) {
      return client;
    } else {
      throw Exception('Erro ao alterar o cliente: ${client.id} .');
    }
  }

  Future<ClientModel> delete(int id) async {
    final http.Response response = await http.delete(
        Uri.http(API.endpoint, 'clients/${id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      return ClientModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao remover o cliente: ${id} .');
    }
  }
}
