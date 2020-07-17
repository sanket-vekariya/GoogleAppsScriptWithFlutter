import 'dart:convert' as convert;

import 'package:AppScriptDemo/OrderResponseModel.dart';
import 'package:http/http.dart' as http;

import 'OrderSubmitModel.dart';

class ScriptRepo {
  final void Function(String) callback;
  static const String ORDER_INSERT_URL =
      "https://script.google.com/macros/s/AKfycbyRIgJ-9DC9v-RJwxAneFyIh8DVGPIneciwor-Q2VZXy8X_S5U/exec";
  static const String ORDER_DELETE_URL =
      "https://script.google.com/macros/s/AKfycbz4A6VU4ht5vR6WyZtXZBxZn9IEvhUtYxrUicl-iaoLXBnAw54/exec";
  static const String ORDER_UPDATE_URL =
      "https://script.google.com/macros/s/AKfycbwpwBp2XN6HEzKHU8NB2WEoPOi56v2pXGcwc3Fj08CWOZ6a0Q_3/exec";
  static const String ORDER_FETCH_URL =
      "https://script.google.com/macros/s/AKfycbzBU_zO7EWHY08unSehWRTBeCdXIRF2Vy4_MPiKxkUBqFanbs35/exec";

  static const STATUS_SUCCESS = "SUCCESS";
  static const STATUS_FAILURE = "FAILURE";

  ScriptRepo(this.callback);

  // submit order
  void submitOrder(OrderSubmitModel orderDetails) async {
    try {
      await http
          .get(ORDER_INSERT_URL + orderDetails.toParams())
          .then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      callback(STATUS_FAILURE);
    }
  }

  // delete order
  void deleteOrder(String productId) async {
    try {
      await http
          .get(ORDER_DELETE_URL + "?ProductId=$productId")
          .then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      callback(STATUS_FAILURE);
    }
  }

  // update order
  void updateOrder(String productId, String updateValue) async {
    try {
      await http
          .get(ORDER_UPDATE_URL +
              "?ProductId=$productId&UpdateValue=$updateValue")
          .then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      callback(STATUS_FAILURE);
    }
  }

  // fetch products
  Future<List<OrderResponse>> fetchProducts() async {
    OrderResponseModel myModels = new OrderResponseModel();
    await http.get(ORDER_FETCH_URL).then((response) {
      // if error occurs, response is in html form here
      if (response.body.toString().contains('<')) {
        return null;
      } else {
        myModels =
            OrderResponseModel.fromJson(convert.jsonDecode(response.body));
      }
    });
    return myModels.order;
  }
}
