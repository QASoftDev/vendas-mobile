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
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var products = snapshot.data;

                  return Container(
                    child: Column(children: <Widget>[
                      Card(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(snapshot.data![index].id.toString()),
                                Text(snapshot.data![index].date.toString()),
                                Text(
                                    '${snapshot.data![index].client.name.toString()} ${snapshot.data![index].client.lastname.toString()} '),

                                // ListView.builder(
                                //   itemCount: snapshot.data![index].items.length,
                                //   itemBuilder: (context1, index1) {
                                //     return Text(
                                //         '${snapshot.data![index].items[index1].product.toString()} ');
                                //   },
                                // )
                              ],
                            ),
                            SizedBox(
                                height: 250,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data![index].items.length,
                                  itemBuilder: (context, index1) {
                                    return Column(children: <Widget>[
                                      Text(
                                          '${snapshot.data![index].items[index1].qtdade.toString()}'),
                                      Text(
                                          '${snapshot.data![index].items[index1].product.description.toString()}'),
                                    ]);
                                  },
                                )),
                          ],
                        ),
                      )
                    ]),
                  );

                  //Text(snapshot.data![index].id.toString()),
                  // ListTile(
                  //   title: Text(snapshot.data![index].id.toString()),
                  //   subtitle: Text(snapshot.data![index].date.toString()),
                  // ),
                  // ListTile(
                  //   title: Text(
                  //       snapshot.data![index].itens[index].qtdade.toString()),
                  // )
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
      showError(
          context, "Erro ao obter a lista de pedidos", exception.toString());
    }

    return listTemp;
  }
}
