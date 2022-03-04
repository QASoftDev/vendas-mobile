import 'dart:convert';

class OrderItem {
  String? id;
  int? qtdade;

  OrderItem({
    this.id,
    this.qtdade,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'qtdade': qtdade,
    };
  }

  OrderItem.fromJsom(Map<String, dynamic> json) {
    id = json['id'];
    qtdade = json['qtdade'];
  }
}
