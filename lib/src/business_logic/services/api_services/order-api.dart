import 'dart:convert';
import 'package:online_shop/src/business_logic/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/src/business_logic/services/api_services/api.dart';

void getOrders(String userId) async {

  final response = await http.post(Api.urlPrefix + 'get_orders.php', body: {
    "userIdCode": userId,
  });

  var datauser = json.decode(response.body);
  //print(datauser);
  orders.clear();
  for (var sName in datauser) {
    Order order = new Order(
      id: sName["id"].toString(),
      title: sName["title"].toString(),
      image: sName["image"].toString(),
      numOfItems: sName["counter"].toString(),
      price: sName["price"].toString(),
      status: sName["status"].toString(),
      payment: sName["payment"].toString(),
      transport: sName["transport"].toString(),
      mobile: sName["mobile"].toString(),
      name: sName["name"].toString(),
      line1: sName["line1"].toString(),
      line2: sName["line1"].toString(),
      city: sName["city"].toString(),
      country: sName["country"].toString(),
      subTotal: sName["subTotal"].toString(),
      createdAt: sName["createdAt"].toString(),
    );
    orders.add(order);
  }
}