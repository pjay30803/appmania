import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'cartpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SmartPhonescreen(),
    );
  }
}

class Product {
  final String imagePath;
  final String name;
  final String price;
  final double rating;
  final String detail;
  int quantity;

  Product({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.rating,
    required this.detail,
    this.quantity = 0,
  });
}

class SmartPhonescreen extends StatefulWidget {
  const SmartPhonescreen({Key? key}) : super(key: key);

  @override
  State<SmartPhonescreen> createState() => _SmartPhoneScreenState();
}

class _SmartPhoneScreenState extends State<SmartPhonescreen> {
  List<Product> products = [
    Product(
      imagePath: 'assets/images/iphone9.jpeg',
      name: 'SmartPhone: iphone 9',
      price: 'Price: \$ 500',
      rating: 3.5,
      detail: 'Display: 5.2 inches (13.21 cm)OLED.\nscreen resolution: 750 x 1334 pixels.\nprocessor: Apple A13 Bionic processor.\nBattery: 2050 mAh.',
    ),
    Product(
      imagePath: 'assets/images/iphone.jpeg',
      name: 'SmartPhone: iphone X',
      price: 'Price: \$ 550',
      rating: 5,
      detail: 'Display:  5.8″.\nscreen resolution: 1125 x 2436 pixels.\nprocessor: Apple A11 Bionic processor.\nBattery: Endurance rating 74h.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Page',
          style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple.shade100,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return buildProductCard(products[index]);
        },
      ),
    );
  }

  Widget buildProductCard(Product product) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Card(
        child: Container(
          height: 400,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: 0.50,
                widthFactor: 1,
                child: Image(
                  image: AssetImage(product.imagePath),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                bottom: 45,
                left: 5, 
                right: 5, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.name}\n${product.price}',
                      textAlign: TextAlign.left, 
                      style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      product.detail,
                      maxLines: 5,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      textAlign: TextAlign.left, 
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      product.quantity++;
                    });
                  },
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: RatingBarIndicator(
                  rating: product.rating,
                  itemCount: 5,
                  itemSize: 30.0,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
