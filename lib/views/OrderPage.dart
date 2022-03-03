// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:ven_das/models/order_model.dart';
import 'package:ven_das/order/http/repository/order_repository.dart';

import 'error.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Pedidos'),
        ),
        body: FutureBuilder<List>(
          future: getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar pedidos.'),
              );
            }

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index]['id']),
                    subtitle: Text(snapshot.data![index]['date']),
                    trailing: Text(snapshot.data![index]['client']),
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
  Future<List<OrderModel>> getAll() async {
    List<OrderModel> listTemp = <OrderModel>[];
    try {
      OrderRepository repository = OrderRepository();

      listTemp = await repository.findAll();
    } catch (exception) {
      print(exception);
      showError(
          context, "Erro ao obter a lista de pedidos", exception.toString());
    }

    return listTemp;
  }
}
