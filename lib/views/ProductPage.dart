import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Produtos'),
        ),
        body: Center(child: Text('Cadastro de Produtos')),
      );
}
