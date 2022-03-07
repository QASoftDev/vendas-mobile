import 'package:flutter/material.dart';
import 'package:ven_das/models/product_model.dart';
import 'package:ven_das/product/http/repository/product_repository.dart';

import 'error.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Produtos'),
        ),
        body: FutureBuilder<List>(
          future: getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar produtos.'),
              );
            }

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].id.toString()),
                    subtitle:
                        Text(snapshot.data![index].description.toString()),
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
  Future<List<ProductModel>> getAll() async {
    List<ProductModel> listTemp = <ProductModel>[];

    try {
      ProductRepository repository = ProductRepository();

      listTemp = await repository.findAll();
      print(listTemp);
    } catch (exception) {
      print(exception);
      showError(
          context, "Erro ao obter a lista de productes", exception.toString());
    }

    return listTemp;
  }
}
