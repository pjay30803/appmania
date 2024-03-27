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
      home: SkincareScreen(),
    );
  }
}

class SkincareScreen extends StatefulWidget {
  const SkincareScreen({Key? key}) : super(key: key);

  @override
  State<SkincareScreen> createState() => _SkincareScreenState();
}
class _SkincareScreenState extends State<SkincareScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home Page',
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
                buildProductCard('assets/images/s1.jpeg', 'Product: Lotion', 'Price: \$ 300', 5, 'Murti literally means any solid body or form with a definite shape or limits produced from material elements. It contrasts with the mind, thought, and immaterial in ancient Indian literature. The term also refers to any embodiment, manifestation, incarnation, personification, appearance, image, idol, or statue of a deity.'),
                buildProductCard('assets/images/s2.jpeg', 'Product: Serum', 'Price: \$ 350', 4.5, 'Face serum is a special addition to your skin care routine that can deliver added benefits and extra oomph. Serums differ from moisturizers and creams in that they offer concentrated amounts of one or two key ingredients that create powerful results for specific skin care needs.'),
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
