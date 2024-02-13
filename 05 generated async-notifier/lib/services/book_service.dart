import 'dart:math';

import '../model/book.dart';

/// Represents a service having access to a book storage
/// Note: in real-life scenarios you would use streams or Futures
/// Here we want to skip that, because otherwise we won't be able to
/// use StateNotifierProvider (we would use StreamProvider or
/// FutureProvider instead)
class BookService {
  BookService() {
    print("Creating BookService...");
  }

  /// Read all books from the database
  List<Book> fetchAllBooks() {
    return List.from(staticBookStorage); // Return a copy of the static list
  }

  Book createRandomBook() {
    return Book(_pickRandomFrom(authors), _pickRandomFrom(titles));
  }

}

/// Pick a random value from the provided range
String _pickRandomFrom(List<String> values) {
  final randomizer = Random();
  return values[randomizer.nextInt(values.length)];
}

// Static dummy books in the database
const kuroseBook = Book("Jim Kurose", "Computer networks");
const robbinsBook = Book("Jennifer Niederst Robbins", "Learning Web Design");
const spectorBook = Book("Ian Spector", "The Truth About Chuck Norris");

const staticBookStorage = [kuroseBook, robbinsBook, spectorBook];

const authors = [
  "John Doe",
  "Michael Dackson",
  "Jon Norman",
  "Sigrid Spring",
  "Leo Drum",
  "Chuck the Great"
];

const titles = [
  "The Three Wonders",
  "Get Rich in Seven Days",
  "Computer Science Trends",
  "Spiritual Guide to Flutter",
  "Unit Testing Masterclass"
];
