import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/book.dart';
import '../services/book_service.dart';

/// State storage for books, with modification actions
class BookNotifier extends StateNotifier<List<Book>> {
  // We can "inject" other services into the notifier object
  // This will be done in the Provider object which creates this notifier
  final BookService bookService;
  BookNotifier(this.bookService) : super([]) {
    print("Creating BookNotifier...");
  }

  /// Refresh all books "from the database"
  void refreshAll() {
    print("Loading all books from database...");
    state = bookService.fetchAllBooks();
  }

  /// Remove the last book from the list
  void deleteBook() {
    // Note: in real life you would probably send commands to the service...
    state = [
      // Re-insert all but the last book
      for (var i = 0; i < state.length - 1; ++i)
        state[i]
    ];
  }

  /// Add a random book to the list
  void addBook() {
    // Note: in real life you would probably send commands to the service...
    state = [...state, bookService.createRandomBook()];
  }
}
