import 'package:isar/isar.dart';
import 'package:my_app/data/models/quote.dart';

import '../../core/database.dart';
import '../api/quotes_api.dart';

class QuotesRepository {
  QuotesRepository({QuotesApi? quotesApi})
      : _quotesApi = quotesApi ?? QuotesApi();

  final QuotesApi _quotesApi;

  /// Save on database all the quotes retrieved from the api

  Future<void> getQuotesFromApi() async {
    List<dynamic> response = await _quotesApi.getPopularQuotes();

    List<Quote> listQuotes = List<Quote>.from(
      response.map((e) => Quote.fromMap(e)),
    );

    await (await DBProvider.instance.database).writeTxn(() async {
      await (await DBProvider.instance.database).quotes.putAll(listQuotes);
    });
  }

  /// Return all quotes saved locally

  Future<List<Quote>> getQuotes() async {
    return await (await DBProvider.instance.database).quotes.where().findAll();
  }

  ///Receive a 'quote' and update locally

  Future<void> putQuote(Quote quote) async {
    await (await DBProvider.instance.database).writeTxn(() async {
      await (await DBProvider.instance.database).quotes.put(quote);
    });
  }
}
