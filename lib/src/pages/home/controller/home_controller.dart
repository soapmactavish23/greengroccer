import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/home/repository/home_repository.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/utils_service.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();

  bool isLoading = false;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  onInit() {
    super.onInit();
    getAllCategories();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();

    getAllProducts();
  }

  Future<void> getAllCategories() async {
    setLoading(true);

    HomeResult<CategoryModel> homeResult =
        await homeRepository.getAllCategories();

    setLoading(false);

    homeResult.when(success: (data) {
      allCategories.assignAll(data);

      if (allCategories.isEmpty) return;

      selectCategory(allCategories.first);
    }, error: (message) {
      UtilsService.showToast(
        message: message,
        isError: true,
      );
    });
  }

  Future<void> getAllProducts() async {
    setLoading(true);

    Map<String, dynamic> body = {
      "page": 0,
      "title": null,
      "categoryId": "aGN3NQKlXp",
      "itemsPerPage": 6
    };

    HomeResult<ItemModel> result = await homeRepository.getAllProducts(body);

    setLoading(false);

    result.when(success: (data) {
      print(data);
    }, error: (message) {
      UtilsService.showToast(message: message, isError: true);
    });
  }
}
