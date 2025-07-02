import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart'.tr(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          _buildCartItem(
            'EKERÖ',
            '\$230.00',
            '\$512.58',
            '45% OFF',
            'assets/images/yellow_fur.png',
            'Yellow',
          ),
          _buildCartItem(
            'STRANDMON',
            '\$274.13',
            '\$856.60',
            '45% OFF',
            'assets/images/grey_fur.png',
            'Grey',
          ),
          _buildCartItem(
            'PLATTLÄNS',
            '\$24.99',
            '\$69.99',
            '45% OFF',
            'assets/images/lamp.png',
            'Yellow',
          ),
          _buildCartItem(
            'MALM',
            '\$130.00',
            '',
            '',
            'assets/images/lamp.png',
            'Black',
          ),
          _buildCartItem(
            'VITTSJÖ',
            '\$89.99',
            '\$179.99',
            '50% OFF',
            'assets/images/lamp.png',
            'Silver',
          ),
          _buildCartItem(
            'BILLY',
            '\$59.00',
            '\$99.50',
            '40% OFF',
            'assets/images/grey_fur.png',
            'White',
          ),
          _buildCartItem(
            'POÄNG',
            '\$129.95',
            '\$259.90',
            '50% OFF',
            'assets/images/yellow_fur.png',
            'Brown',
          ),
          _buildCartItem(
            'KALLAX',
            '\$45.00',
            '\$90.00',
            '50% OFF',
            'assets/images/lamp.png',
            'Black',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'.tr()),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'My Cart'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Account'.tr(),
          ),
        ],
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/home');
          if (index == 2) Navigator.pushNamed(context, '/accaunt');
        },
      ),
    );
  }

  Widget _buildCartItem(
    String name,
    String price,
    String originalPrice,
    String discount,
    String imagePath,
    String color,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      if (originalPrice.isNotEmpty)
                        Text(
                          originalPrice,
                          style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      if (discount.isNotEmpty)
                        Text(
                          discount,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text('Color: $color', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.grey),
                  onPressed: () {},
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove, color: Colors.teal),
                      onPressed: () {},
                    ),
                    Text('1', style: TextStyle(fontSize: 16)),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.teal),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
