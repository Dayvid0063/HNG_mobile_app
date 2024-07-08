import 'package:flutter/material.dart';
import '../cart.dart';
import 'ordersuccess_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final Function viewProducts;

  const CheckoutScreen({Key? key, required this.viewProducts}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  void _placeOrder(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderSuccessScreen()),
    ).then((_) {
      setState(() {
        Cart.clearCart();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Cart.products.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Cart is empty.'),
                        SizedBox(height: 16),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: Cart.products.length,
                    itemBuilder: (context, index) {
                      final product = Cart.products[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(12.0),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                product.image_url,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/noImage.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            title: Text(product.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4.0),
                                Text('\$${product.price.toStringAsFixed(2)}'),
                                SizedBox(height: 4.0),
                                Text(product.description),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove_circle),
                              onPressed: () {
                                setState(() {
                                  Cart.removeProduct(product);
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (Cart.products.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => _placeOrder(context),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Submit Order'),
              ),
            ),
        ],
      ),
    );
  }
}
