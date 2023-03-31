import 'package:get/get.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/cart/cart_result/cart_result.dart';
import 'package:greengrocer/src/pages/cart/repository/cart_repository.dart';
import 'package:greengrocer/src/services/utils_service.dart';

class CartController extends GetxController {
  final CartRepository cartRepository = CartRepository();

  final authController = Get.find<AuthController>();

  List<CartItemModel> cartItems = [];

  @override
  void onInit() {
    super.onInit();

    getCartItem();
  }

  double cartTotalPrice() {
    double total = 0;
    for (final item in cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  Future<void> getCartItem() async {
    final CartResult<List<CartItemModel>> result =
        await cartRepository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );

    result.when(success: (data) {
      cartItems = data;
      update();
      print(data);
    }, error: (message) {
      UtilsService.showToast(message: message, isError: true);
    });
  }

  int getItemIndex(ItemModel item) {
    return cartItems.indexWhere((itemInList) => itemInList.id == item.id);
  }

  Future<void> addItemToCart({
    required ItemModel item,
    int quantity = 1,
  }) async {
    int itemIndex = getItemIndex(item);

    if (itemIndex >= 0) {
      cartItems[itemIndex].quantity += quantity;
    } else {
      // TODO: Adicionando item no carrinho
      // cartRepository.addItemToCart(userId: userId, token: token, productId: productId, quantity: quantity)

      cartItems.add(CartItemModel(item: item, id: '', quantity: quantity));
    }

    update();
  }
}
