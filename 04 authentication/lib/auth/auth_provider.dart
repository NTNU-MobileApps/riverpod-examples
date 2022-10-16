import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_progress_provider.dart';

import 'auth_service.dart';

/// Provides an authentication service (singleton)
final authProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(authProgressProvider.notifier));
});

