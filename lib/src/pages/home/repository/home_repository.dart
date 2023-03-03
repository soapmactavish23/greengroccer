import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();
  getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.get,
    );

    if (result['result'] != null) {
    } else {}
  }
}
