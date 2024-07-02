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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4.0,
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                    child: Image.asset(
                      product.image_url,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          product.description,
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(height: 12.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Cart.addProduct(product);
                            _showAlert(context, '${product.name} added to cart');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.shopping_cart),
                              SizedBox(width: 5),
                              Text('Add to Cart'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
