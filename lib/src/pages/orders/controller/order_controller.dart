import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/orders/repository/orders_repository.dart';

class OrderController extends GetxController {
  final OrdersRepository ordersRepository = OrdersRepository();
  final authController = AuthController();

  Future<void> getOrderItems() async {
    ordersRepository.getOrderItems(
      orderId: orderId,
      token: authController.user.token!,
    );
  }
}
