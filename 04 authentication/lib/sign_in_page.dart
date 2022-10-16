import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth/auth_progress_provider.dart';
import 'auth/auth_provider.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(children: [_buildText(ref), _buildButton(ref)]),
    );
  }

  Widget _buildButton(WidgetRef ref) {
    final bool loading = ref.watch(authProgressProvider);
    return ElevatedButton(
      onPressed: !loading ? () => _signIn(ref) : null,
      child: Text("Sign in"),
    );
  }

  _buildText(WidgetRef ref) {
    final bool loading = ref.watch(authProgressProvider);
    return !loading
        ? const Text("You have not signed in yet")
        : CircularProgressIndicator();
  }

  void _signIn(WidgetRef ref) {
    final auth = ref.read(authProvider);
    auth.signIn();
  }
}
