import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:furnuture_app/core/utils/cache/cache_helper.dart';
import 'package:furnuture_app/view/screens/accaunt_screen.dart';
import 'package:furnuture_app/view/screens/cart_screen.dart';
import 'package:furnuture_app/view/screens/home_screen.dart';
import 'package:furnuture_app/view/screens/product_detail_screen.dart';
import 'package:furnuture_app/view/screens/signin_screen.dart';
import 'firebase_options.dart';
import 'view/screens/splash_screen.dart';
import 'view/screens/register_screen.dart';
import 'view/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper().initCache();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru'), Locale('uz')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SplashScreen(),
      routes: {
        "/login": (_) => const LoginScreen(),
        "/register": (_) => const RegisterScreen(),
        "/onboarding1": (_) => const OnboardingScreen(),
        "/home": (_) => const HomeScreen(),
        "/detail": (_) => const ProductDetailScreen(),
        "/cart": (_) => const CartScreen(),
        "/accaunt": (_) => const AccauntScreen(),
      },
    );
  }
}
