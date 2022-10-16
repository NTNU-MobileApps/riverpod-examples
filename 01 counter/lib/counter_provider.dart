import 'package:flutter_riverpod/flutter_riverpod.dart';

// Riverpod state provider - we define the type of the stored value (int) and
// the default value (zero)
final counterProvider = StateProvider<int>((ref) {
  return 0;
});
