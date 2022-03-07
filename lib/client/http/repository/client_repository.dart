import 'package:ven_das/models/client_model.dart';

import '../client_rest.dart';

class ClientRepository {
  final ClientRest api = ClientRest();

  Future<ClientModel> find(int id) async {
    return await api.find(id);
  }

  Future<List<ClientModel>> findAll() async {
    return await api.findAll();
  }

  Future<ClientModel> create(ClientModel client) async {
    return await api.create(client);
  }

  Future<ClientModel> update(ClientModel client) async {
    return await api.update(client);
  }

  Future<ClientModel> delete(int id) async {
    return await api.delete(id);
  }
}
