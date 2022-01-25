import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
    };
    return map;
  }

  factory ProductModel.fromFirestore(QueryDocumentSnapshot doc) {
    return ProductModel(
      id: doc['id'],
      name: doc['name'],
      price: doc['price'],
    );
  }
}
