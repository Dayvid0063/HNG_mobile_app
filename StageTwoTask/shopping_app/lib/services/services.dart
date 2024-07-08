import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class Apicall {
  final String baseUrl = 'https://api.timbu.cloud/products';
  final String organizationId = 'c9ad1fc74ad84acba6bce2fcc26a6e08';
  final String appId = '1QIK2YE6HUURBNH';
  final String apiKey = '495f4e76ebae469f8c55d39b5e45ff1820240708181732372546';

  Future<List<Product>> fetchProducts(int page, int size) async {
    final response = await http.get(
      Uri.parse('$baseUrl?organization_id=$organizationId&Appid=$appId&Apikey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final items = jsonResponse['items'] as List;
      return items.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
