// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:ven_das/models/client_model.dart';
import 'package:ven_das/client/http/repository/client_repository.dart';

import 'error.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Clientes'),
        ),
        body: FutureBuilder<List>(
          future: getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar clientes.'),
              );
            }

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].id.toString()),
                    subtitle: Text(snapshot.data![index].name.toString()),
                    trailing: Text(snapshot.data![index].cpf.toString()),
                  );
                },
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );

//Functions
  Future<List<ClientModel>> getAll() async {
    List<ClientModel> listTemp = <ClientModel>[];

    try {
      ClientRepository repository = ClientRepository();

      listTemp = await repository.findAll();
      print(listTemp);
    } catch (exception) {
      print(exception);
      showError(
          context, "Erro ao obter a lista de clientes", exception.toString());
    }

    return listTemp;
  }
}
