import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GroceriesScreen(),
    );
  }
}

class GroceriesScreen extends StatefulWidget {
  const GroceriesScreen({Key? key}) : super(key: key);

  @override
  State<GroceriesScreen> createState() => _GroceriesScreenState();
}
class _GroceriesScreenState extends State<GroceriesScreen> {

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
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart_Screen()));
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 2),
          Expanded(
            child: ListView(
              children: [
                buildProductCard('assets/images/g1.jpeg', 'Product: Almond', 'Price: \$ 200', 5, 'The almond ( Prunus amygdalus, syn. Prunus dulcis) is a species of small tree from the genus Prunus, cultivated worldwide for its seed, a culinary nut. Along with the peach, it is classified in the subgenus Amygdalus, distinguished from the other subgenera by corrugations on the shell ( endocarp) surrounding the seed.'),
                buildProductCard('assets/images/g2.jpeg', 'Product: Sugar', 'Price: \$ 10', 4.5, 'Simple sugars, also called monosaccharides, include glucose, fructose, and galactose. Compound sugars, also called disaccharides or double sugars, are molecules made of two bonded monosaccharides; common examples are sucrose (glucose + fructose), lactose (glucose + galactose), and maltose (two molecules of glucose).'),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildProductCard(String imagePath, String name, String price, double rating, String detail) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Card(
        child: Container(
          height: 455,
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
                  image: AssetImage(imagePath),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                bottom: 49,
                left: 5, // Adjusted to position on the left side
                right: 5, // Adjusted to align with the width of the container
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name\n$price',
                      textAlign: TextAlign.left, // Align text to the left
                      style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      detail,
                      maxLines: 5,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      textAlign: TextAlign.left, // Align text to the left
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: ElevatedButton(
                  onPressed: () {
                    // Add to cart logic here
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
                  rating: rating,
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
