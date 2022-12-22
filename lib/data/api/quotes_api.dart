import '../../core/exceptions/http_exception.dart';
import '../services/web_service.dart';

class QuotesApi extends WebService {
  /// get products '/popular.json'
  /// Sucess: return data
  /// Insucess: throw exception

  Future<List<dynamic>> getPopularQuotes() async {
    final response = await get(
      endpoint: '/popular.json',
    );

    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 500) {
      throw ServerFailure();
    }
    throw RequestFailure();
  }
}
