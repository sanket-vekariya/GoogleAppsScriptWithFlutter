class OrderSubmitModel {
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

  OrderSubmitModel(
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

  OrderSubmitModel.fromJson(Map<String, dynamic> json) {
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

  String toParams() =>
      "?ProductId=$productId&ProductName=$productName&Amount=$amount"
      "&Price=$price&ProductSize=$productSize&CustomerContactNumber=$customerContactNumber"
      "&CustomerEmail=$customerEmail&CustomerLocation=$customerLocation"
      "&PaymentStatus=$paymentStatus&OrderStatus=$orderStatus";
}
