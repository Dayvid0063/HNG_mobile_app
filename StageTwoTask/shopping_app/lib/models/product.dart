class Product {
  final String name;
  final double price;
  final String image_url;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.image_url,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    String image_url;
    if (json['photos'] != null && json['photos'].isNotEmpty) {
      image_url = 'https://api.timbu.cloud/images/${json['photos'][0]['url']}';
    } else {
      image_url = 'https://shj.org/wp-content/uploads/2018/04/no_product_image.jpg';
    }

    return Product(
      name: json['name'],
      price: json['current_price'] != null && json['current_price'].isNotEmpty
          ? json['current_price'][0]['USD'][0]?.toDouble() ?? 0.0
          : 0.0,
      image_url: image_url,
      description: json['description'],
    );
  }
}
