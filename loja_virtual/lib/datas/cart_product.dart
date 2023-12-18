import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/datas/product_data.dart';

class CartProduct {
  late String cid;

  late String category;
  late String pid;

  late int quantity;
  late String size;

  ProductData? productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot doc) {
    cid = doc.id;
    category = doc.get("category");
    pid = doc.get("pid");
    quantity = doc.get("quantity") ?? 0;
    size = doc.get("size");
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "pid": pid,
      "quantity": quantity,
      "size": size,
      "product": productData?.toResumedMap()
    };
  }
}
