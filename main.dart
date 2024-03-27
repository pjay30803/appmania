// import 'package:appmania/DetailScreen.dart';
// import 'package:flutter/material.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String _selectedCategory = 'Select Category...';
//
//   List<Map<String, dynamic>> arrProduct = [
//     {'id': 1, "image": "images/iphone9.jpg", 'title': 'iPhone 9', 'amount': 500.0, 'qty': 0},
//     {'id': 2, "image": "images/iphonex.jpeg", 'title': 'iPhone X', 'amount': 550.0, 'qty': 0},
//     {'id': 3, "image": "images/macbook.webp", 'title': 'Apple macbook pro', 'amount': 800.0, 'qty': 0},
//     {'id': 4, "image": "images/laptop.jpg", 'title': 'HP Victus 15', 'amount': 899.0, 'qty': 0},
//     {'id': 5, "image": "images/f1.jpeg", 'title': 'Plum Perfume', 'amount': 1000.0, 'qty': 0},
//     {'id': 6, "image": "images/f2.jpg", 'title': 'Citrus&Lavender', 'amount': 2500.0, 'qty': 0},
//     {'id': 7, "image": "images/s1.jpg", 'title': 'Hyaluronic Water', 'amount': 300.0, 'qty': 0},
//     {'id': 8, "image": "images/s2.jpg", 'title': 'Cleanser', 'amount': 350.0, 'qty': 0},
//     {'id': 9, "image": "images/g1.jpeg", 'title': 'Coffee', 'amount': 200.0, 'qty': 0},
//     {'id': 10, "image": "images/g2.jpeg", 'title': 'Maggi', 'amount': 10.0, 'qty': 0},
//     {'id': 11, "image": "images/h1.jpeg", 'title': 'HomeDecor', 'amount': 100.0, 'qty': 0},
//     {'id': 12, "image": "images/h2.jpeg", 'title': 'Ballons', 'amount': 50.0, 'qty': 0},
//   ];
//
//   int cartCount = 0;
//   double cartAmount = 0;
//
//   void addToCart(int index) {
//     setState(() {
//       if (arrProduct[index]['qty'] == 0) {
//         arrProduct[index]['qty']++; // Increment quantity
//         cartCount++; // Increment cart count
//         cartAmount += arrProduct[index]['amount'];
//       } else {
//         arrProduct[index]['qty']--; // Decrement quantity
//         cartCount--; // Decrement cart count
//         cartAmount -= arrProduct[index]['amount'];
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Home Page',
//           style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.blue.shade200,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart, color: Colors.black),
//             onPressed: () {
//               List<Map<String, dynamic>> cartProducts = [];
//               for (var element in arrProduct) {
//                 if (element['qty'] > 0) {
//                   cartProducts.add(element);
//                 }
//               }
//
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CartScreen(cartProducts: cartProducts, totalAmount: cartAmount)),
//               );
//             },
//           )
//         ],
//       ),
//       backgroundColor: Colors.white,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 2),
//           Container(
//             height: 70,
//             width: 216,
//             color: Colors.blueGrey.shade50,
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     _selectedCategory,
//                     style: const TextStyle(color: Colors.black, fontSize: 20),
//                   ),
//                   PopupMenuButton<String>(
//                     icon: const Icon(Icons.arrow_drop_down, color: Colors.black, size: 40),
//                     onSelected: (value) {
//                       setState(() {
//                         _selectedCategory = value;
//
//                         if (value == 'Smartphones') {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const SmartPhonescreen()),
//                           );
//                         }
//                         if (value == 'Laptops') {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const SmartPhonescreen()),
//                           );
//                         }
//                         if (value == 'Fragrances') {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const SmartPhonescreen()),
//                           );
//                         }
//                         if (value == 'Skincare') {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) =>const SmartPhonescreen()),
//                           );
//                         }
//                         if (value == 'Groceries') {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) =>const SmartPhonescreen()),
//                           );
//                         }
//                         if (value == 'Home Decoration') {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const SmartPhonescreen()),
//                           );
//                         }
//
//                         // Navigation logic for different categories goes here
//                       });
//                     },
//                     itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//                       const PopupMenuItem<String>(
//                         value: 'Smartphones',
//                         child: Text('Smartphones'),
//                       ),
//                       const PopupMenuItem<String>(
//                         value: 'Laptops',
//                         child: Text('Laptops'),
//                       ),
//                       const PopupMenuItem<String>(
//                         value: 'Fragrances',
//                         child: Text('Fragrances'),
//                       ),
//                       const PopupMenuItem<String>(
//                         value: 'Skincare',
//                         child: Text('Skincare'),
//                       ),
//                       const PopupMenuItem<String>(
//                         value: 'Groceries',
//                         child: Text('Groceries'),
//                       ),
//                       const PopupMenuItem<String>(
//                         value: 'Home Decoration',
//                         child: Text('Home Decoration'),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: ListView.builder(
//                 itemCount: arrProduct.length,
//                 itemBuilder: (context, index) {
//                   Map data = arrProduct[index];
//                   return Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(color: Colors.blueGrey.shade100, borderRadius: BorderRadius.circular(10)),
//                         padding: const EdgeInsets.all(20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Image.asset(
//                                   data['image'],
//                                   height: 150,
//                                   width: 120,
//                                   fit: BoxFit.fitHeight,
//                                 ),
//                                 const SizedBox(width: 30),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       data['title'].toString(),
//                                       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                                     ),
//                                     Text(
//                                       '\$ ${data['amount'].toString()}',
//                                       style: const TextStyle(fontSize: 16),
//                                     ),
//                                     const SizedBox(height: 10),
//                                     InkWell(
//                                       onTap: () {
//                                         addToCart(index);
//                                       },
//                                       child: Text(
//                                         (data['qty'] == 0) ? 'Add to cart' : 'Remove from cart',
//                                         style: const TextStyle(fontSize: 16, color: Colors.blueAccent, decoration: TextDecoration.underline),
//                                         textAlign: TextAlign.right,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20,),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CartScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> cartProducts;
//   final double totalAmount;
//
//   const CartScreen({Key? key, required this.cartProducts, required this.totalAmount}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cart'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               'Cart Items',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: cartProducts.length,
//               itemBuilder: (context, index) {
//                 final product = cartProducts[index];
//                 return ListTile(
//                   leading: Image.asset(
//                     product['image'],
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text(product['title']),
//                   subtitle: Text('Quantity: ${product['qty']}'),
//                   trailing: Text('\$ ${product['amount'] * product['qty']}'),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   'Total Items: ${cartProducts.length}',
//                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Total Amount: \$ $totalAmount',
//                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }