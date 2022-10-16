import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth/auth_progress_provider.dart';
import 'auth/auth_provider.dart';

/// Home page shown when the user has signed-in
class HomePage extends ConsumerWidget {
  final User? user;

  HomePage({Key? key, this.user}) : super(key: key);

  /// Build the main content
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          _buildUserText(ref),
          _buildSignOutButton(ref),
        ],
      ),
    );
  }

  /// Show the user-text of loading spinner when loading...
  Widget _buildUserText(WidgetRef ref) {
    final bool inProgress = ref.watch(authProgressProvider);
    if (!inProgress) {
      final String userId = user != null ? user!.uid : "<invalid>";
      return Text("You have signed as $userId");
    } else {
      return CircularProgressIndicator();
    }
  }

  /// Show the "Sign out" button, disable it while loading...
  Widget _buildSignOutButton(WidgetRef ref) {
    final bool inProgress = ref.watch(authProgressProvider);
    return ElevatedButton(
      onPressed: !inProgress ? () => _signOut(ref) : null,
      child: Text("Sign out"),
    );
  }

  /// Ask the authentication service to sign out from Firebase
  void _signOut(WidgetRef ref) {
    final auth = ref.read(authProvider);
    auth.signOut();
  }
}
