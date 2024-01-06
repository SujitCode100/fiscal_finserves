import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../bottom_bar/bottom_bar_screen.dart';
import '../onboarding/onboarding_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong!'),
            );
          } else if (snapshot.hasData) {
            return BottomBarScreen();
          } else {
            return OnboardingScreen();
          }
        });
  }
}