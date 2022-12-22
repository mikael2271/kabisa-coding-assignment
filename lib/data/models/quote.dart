import 'dart:convert';

import 'package:isar/isar.dart';

part 'quote.g.dart';

@Collection()
class Quote {
  Quote({
    required this.id,
    required this.author,
    required this.quote,
    this.rate = false,
  });

  Id id;
  String author;
  String quote;
  bool rate;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'quote': quote,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['id'],
      author: map['author'],
      quote: map['quote'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Quote.fromJson(String source) => Quote.fromMap(json.decode(source));
}
