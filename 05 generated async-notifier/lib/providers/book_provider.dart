import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/book.dart';

import 'book_notifier.dart';

final bookProvider = NotifierProvider<BookNotifier, List<Book>>(() {
  return BookNotifier();
});

