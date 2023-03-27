import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/cart/repository/cart_repository.dart';

class CartController extends GetxController {
  final CartRepository cartRepository = CartRepository();

  final authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();

    getCartItem();
  }

  Future<void> getCartItem() async {
    await cartRepository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );
  }
}
