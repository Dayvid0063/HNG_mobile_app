import 'package:flutter/material.dart';
import '../cart.dart';
import '../models/product.dart';

class ProductsScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'watch one',
      description: 'Unique Wrist',
      price: 200.0,
      image_url: 'assets/images/watch1.webp',
    ),
    Product(
      name: 'watch two',
      description: 'Unique Wrist for Gentlemen',
      price: 400.0,
      image_url: 'assets/images/watch2.webp',
    ),
    Product(
      name: 'watch three',
      description: 'Wrist Blast',
      price: 600.0,
      image_url: 'assets/images/watch3.webp',
    ),
    Product(
      name: 'watch four',
      description: 'Wrist Infinity',
      price: 800.0,
      image_url: 'assets/images/watch4.webp',
    ),
  ];

  void _showAlert(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
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
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\$${product.price}'),
              Text(product.description),
            ],
          ),
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_cart),
                SizedBox(width: 5),
                Text('Add to Cart'),
              ],
            ),
            onPressed: () {
              Cart.addProduct(product);
              _showAlert(context, '${product.name} added to cart');
            },
          ),
        );
      },
    );
  }
}
