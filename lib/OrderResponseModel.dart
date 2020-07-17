class OrderResponseModel {
  List<OrderResponse> order;

  OrderResponseModel({this.order});

  OrderResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      order = new List<OrderResponse>();
      json['user'].forEach((v) {
        order.add(new OrderResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['user'] = this.order.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderResponse {
  String productId;
  String productName;
  int amount;
  int price;
  String productSize;
  int customerContactNumber;
  String customerEmail;
  String customerLocation;
  String paymentStatus;
  String orderStatus;

  OrderResponse(
      {this.productId,
      this.productName,
      this.amount,
      this.price,
      this.productSize,
      this.customerContactNumber,
      this.customerEmail,
      this.customerLocation,
      this.paymentStatus,
      this.orderStatus});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    productId = json['ProductId'];
    productName = json['ProductName'];
    amount = json['Amount'];
    price = json['Price'];
    productSize = json['ProductSize'];
    customerContactNumber = json['CustomerContactNumber'];
    customerEmail = json['CustomerEmail'];
    customerLocation = json['CustomerLocation'];
    paymentStatus = json['PaymentStatus'];
    orderStatus = json['OrderStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductId'] = this.productId;
    data['ProductName'] = this.productName;
    data['Amount'] = this.amount;
    data['Price'] = this.price;
    data['ProductSize'] = this.productSize;
    data['CustomerContactNumber'] = this.customerContactNumber;
    data['CustomerEmail'] = this.customerEmail;
    data['CustomerLocation'] = this.customerLocation;
    data['PaymentStatus'] = this.paymentStatus;
    data['OrderStatus'] = this.orderStatus;
    return data;
  }
}
