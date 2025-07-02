import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furnuture_app/core/utils/cache/cache_helper.dart';
import 'package:furnuture_app/view/screens/home_screen.dart';
import 'package:furnuture_app/view/screens/onboarding_screen.dart';
import 'package:furnuture_app/view/screens/signin_screen.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (CacheHelper().getFirstTimer()) {
          return const OnboardingScreen();
        } else if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return const LoginScreen();
          } else {
            return const HomeScreen();
          }
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
