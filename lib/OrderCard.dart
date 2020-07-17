import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'OrderResponseModel.dart';

// Reusable card widget
class OrderCard extends StatelessWidget {
  final OrderResponse product;

  OrderCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView(
        padding: EdgeInsets.all(20),
        shrinkWrap: true,
        primary: false,
        children: [
          Text(
            "Product Id: " + product.productId,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Name: " + product.productName,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Status: " + product.orderStatus,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Email: " + product.customerEmail,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Contact: " + product.customerContactNumber.toString(),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
