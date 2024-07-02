import 'package:flutter/material.dart';
import '../cart.dart';
import 'ordersuccess_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final Function viewProducts;

  const CheckoutScreen({super.key, required this.viewProducts});

  @override
  // ignore: library_private_types_in_public_api
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
    return Column(
      children: [
        Expanded(
          child: Cart.products.isEmpty
              ? const Center(
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
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          product.image_url,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle),
                        onPressed: () {
                          setState(() {
                            Cart.removeProduct(product);
                          });
                        },
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
    );
  }
}
