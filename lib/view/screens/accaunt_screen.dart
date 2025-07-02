import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccauntScreen extends StatelessWidget {
  const AccauntScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account'.tr(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/Clara.png'),
              ),
              title: Text(
                'Claire Cooper',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'claire.cooper@email.com',
                style: TextStyle(fontSize: 14),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.teal),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.logout, color: Colors.teal),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/onboarding1',
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'General'.tr(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              leading: Icon(Icons.receipt, color: Colors.grey),
              title: Text('Transaction'.tr(), style: TextStyle(fontSize: 16)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              leading: Icon(Icons.favorite, color: Colors.grey),
              title: Text('Wishlist'.tr(), style: TextStyle(fontSize: 16)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              leading: Icon(Icons.location_on, color: Colors.grey),
              title: Text('Saved Address'.tr(), style: TextStyle(fontSize: 16)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              leading: Icon(Icons.payment, color: Colors.grey),
              title: Text(
                'Payment Methods'.tr(),
                style: TextStyle(fontSize: 16),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              leading: Icon(Icons.notifications, color: Colors.grey),
              title: Text('Notification'.tr(), style: TextStyle(fontSize: 16)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              leading: Icon(Icons.lock, color: Colors.grey),
              title: Text('Security'.tr(), style: TextStyle(fontSize: 16)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),
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
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/home');
          if (index == 1) Navigator.pushNamed(context, '/cart');
        },
      ),
    );
  }
}
