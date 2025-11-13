import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum Product {
  dart(image: 'images/ex3/dart.png', title: 'Dart', description: 'The Best Object Language'),
  flutter(image: 'images/ex3/flutter.png', title: 'Flutter', description: 'The Best Mobile Widget Libary'),
  firebase(image: 'images/ex3/firebase.png', title: 'Firebase', description: 'The Best Cloud Database');

  final String image;
  final String title;
  final String description;

  const Product({ required this.image, required this.title, required this.description});
}

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Product'),
        backgroundColor: Color(0xffdddddd),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image, width: 100),
            Gap(10),
            Text(product.title, style: TextStyle(fontSize: 24)),
            Gap(10),
            Text(product.description, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}