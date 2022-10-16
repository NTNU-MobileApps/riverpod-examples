import '../services/book_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provides a singleton instance to BookService.
// Always use this provider instead of creating BookService directly!
final bookServiceProvider = Provider<BookService>((ref) {
  return BookService();
});
