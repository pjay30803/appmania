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
      home: FragrancesScreen(),
    );
  }
}

class FragrancesScreen extends StatefulWidget {
  const FragrancesScreen({Key? key}) : super(key: key);

  @override
  State<FragrancesScreen> createState() => _FragrancesScreenState();
}
class _FragrancesScreenState extends State<FragrancesScreen> {

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
                buildProductCard('assets/images/f1.jpeg', 'Fragrance: Plum Perfume', 'Price: \$ 1000', 5, 'Its olfactory profile is soft, fruity and sweet, with subtle notes of flowers and spices. Its trail can be described as sweet, fruity and slightly woody. Top notes of plum offer juicy sweetness and a delicately fruity fragrance to perfumes.'),
                buildProductCard('assets/images/f2.jpeg', 'Fragrance: Lavender', 'Price: \$ 2500', 4.5, 'Citrus&Lavender opens with a mix of citrus notes before it evolves to reveal its true nature with a blend of the three greatest floral notes: lavender, rose and iris.Finishing touch is based on a solid cedar-sandalwood accord with soft musk ...'),
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
