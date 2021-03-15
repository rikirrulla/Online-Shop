import 'dart:convert';
import 'package:online_shop/src/business_logic/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/src/business_logic/services/api_services/api.dart';

void getDataBag() async {
  final response = await http.get(Api.urlPrefix + 'products.php');
  var datauser = json.decode(response.body);
  products.clear();
  for (var sName in datauser) {

    Product pro = new Product(
        id: sName["id"].toString(),
        price: sName["price"].toString(),
        title: sName["title"].toString(),
        description: sName["description"].toString(),
        sku: sName["sku"].toString(),
        createdAt: sName["createdAt"].toString(),
        updatedAt: sName["updatedAt"].toString(),
        category: sName["category"].toString(),
        discount: sName["discount"].toString());
    products.add(pro);
  }
}

Future<List> getDataCategory(String category) async {
  final response =
      await http.post(Api.urlPrefix + "products_category.php", body: {
    "category": category,
  });


  var datauser = jsonDecode(response.body);

  products.clear();
  for (var sName in datauser) {
    Product pro = new Product(
      id: sName["id"],
      price: sName["price"],
      title: sName["title"],
      description: sName["description"],
      sku: sName["sku"],
      createdAt: sName["createdAt"],
      updatedAt: sName["updatedAt"],
      category: sName["category"],
      discount: sName["discount"],
      image: sName["image"],
    );
    products.add(pro);
  }
}
