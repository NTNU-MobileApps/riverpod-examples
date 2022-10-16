import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Stores a boolean which signals when the authentication is in progress
final authProgressProvider = StateProvider<bool>((ref) {
  return false;
});
