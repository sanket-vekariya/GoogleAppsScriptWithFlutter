import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';

import 'OrderCard.dart';
import 'OrderResponseModel.dart';
import 'OrderSubmitModel.dart';
import 'ScriptRepo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  List<OrderResponse> productList = List<OrderResponse>();

  // submit order
  void _submitOrder() {
    OrderSubmitModel orderModel = OrderSubmitModel(
        amount: 2,
        price: 550,
        productId: "prod0001",
        productName: "Stranger Things T-Shirt",
        customerContactNumber: 1234567890,
        customerEmail: "ssvekariya11@gmail.com",
        customerLocation: "Junagadh",
        orderStatus: "Pending",
        paymentStatus: "Success",
        productSize: 'M');

    ScriptRepo scriptController = ScriptRepo((String response) {
      if (response == ScriptRepo.STATUS_SUCCESS) {
        showToast("Order Submit Successfully!", Colors.green);
      } else {
        showToast("Error Occurred While Submitting!", Colors.red);
      }
    });
    showToast("Submitting Order", Colors.blueGrey);
    scriptController.submitOrder(orderModel);
  }

  // delete order
  void _deleteOrder() {
    ScriptRepo scriptController = ScriptRepo((String response) {
      if (response == ScriptRepo.STATUS_SUCCESS) {
        showToast("Order Removed Successfully!", Colors.green);
      } else {
        showToast("Error Occurred While Deleting!", Colors.red);
      }
    });
    showToast("Deleting Order", Colors.blueGrey);
    scriptController.deleteOrder("prod0001");
  }

  // update order
  void _updateOrder() {
    ScriptRepo scriptController = ScriptRepo((String response) {
      if (response == ScriptRepo.STATUS_SUCCESS) {
        showToast("Order Updated Successfully!", Colors.green);
      } else {
        showToast("Error Occurred While Updating!", Colors.red);
      }
    });
    showToast("Updating Order", Colors.blueGrey);
    scriptController.updateOrder("prod0001", "prod0003");
  }

  // get all the products
  Future<List<OrderResponse>> _getProducts() async {
    productList.clear();
    setState(() {});
    ScriptRepo scriptController = ScriptRepo((String response) {});
    await scriptController.fetchProducts().then((value) {
      if (value != null) {
        productList..addAll(value);
        showToast("Data Fetched Successfully", Colors.green);
      }
    });
    setState(() {});
    return productList;
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  // initially get data from Google Sheet
  init() async {
    await _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("App Script Demo"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: productList == null
          ? Center(
              child: Text("No Data Found!"),
            )
          : productList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    OrderResponse product = productList[index];
                    return OrderCard(product: product);
                  },
                ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            label: Text("Place Order"),
            backgroundColor: Colors.blueGrey,
            onPressed: _submitOrder,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            label: Text("Fetch Order"),
            backgroundColor: Colors.blueGrey,
            onPressed: _getProducts,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            label: Text("Update Order"),
            isExtended: true,
            backgroundColor: Colors.blueGrey,
            onPressed: _updateOrder,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            label: Text("Delete Order"),
            isExtended: true,
            backgroundColor: Colors.blueGrey,
            onPressed: _deleteOrder,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void showToast(message, Color color) {
    FlutterFlexibleToast.showToast(
        message: message,
        toastGravity: ToastGravity.BOTTOM,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
