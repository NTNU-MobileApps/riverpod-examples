import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth/user_provider.dart';
import 'home_page.dart';
import 'sign_in_page.dart';

/// A demo app for Firebase authentication with Riverpod streams
class AuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build app");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Firebase auth with StreamProvider")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildContent(context),
        ),
      ),
    );
  }

  /// Build the main content
  Widget _buildContent(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      // This is how we can use the StreamProvider
      final userAsyncData = ref.watch(userProvider);
      return userAsyncData.when(
        data: (user) {
          String userId = user != null ? user.uid : "<unknown>";
          print("Rebuild content, user = $userId");
          return user != null ? HomePage(user: user) : SignInPage();
        },
        error: (err, stack) => Text("Error in auth stream: $err"),
        loading: () => const CircularProgressIndicator(),
      );
    });
  }
}
