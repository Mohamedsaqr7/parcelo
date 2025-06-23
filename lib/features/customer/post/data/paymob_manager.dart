import 'package:dio/dio.dart';
import 'package:Parcelo/core/constants/app_constants.dart';

class PaymobManager {
  // PaymobManager class implementation
  // This class is responsible for managing Paymob payment operations
  // It includes methods for initializing payment, processing transactions, etc.
  Dio dio = Dio();

  Future<String> payWithPaymob(int amount) async {
    try {
      String token = await getToken();
      int orderId = await getOrderId(token, (100 * amount).toString());
      String paymentKey = await getPaymentKey(
        token: token,
        orderId: orderId.toString(),
        amount: (100 * amount).toString(),
      );
      return paymentKey;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    try {
      Response response = await dio.post(
          'https://accept.paymob.com/api/auth/tokens',
          data: {'api_key': AppConstants.paymob_api_key});
      return response.data['token'];
    } catch (e) {
      rethrow;
    }
  }

  //////second func////
  Future<int> getOrderId(String token, String amount) async {
    try {
      final response = await dio.post(
        'https://accept.paymob.com/api/ecommerce/orders',
        data: {
          'auth_token': token,
          'delivery_needed': true,
          'amount_cents': amount,
          'currency': 'EGP',
          'items': [],
        },
      );
      return response.data['id'];
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getPaymentKey({
    required String token,
    required String orderId,
    required String amount,
  }) async {
    final response = await dio.post(
      'https://accept.paymob.com/api/acceptance/payment_keys',
      data: {
        'auth_token': token,
        'amount_cents': amount,
        'expiration': 3600,
        'order_id': orderId,
        'billing_data': {
          'apartment': 'NA',
          'email': 'user@test.com',
          'floor': 'NA',
          'first_name': 'Customer',
          'last_name': 'Name',
          'street': 'Street',
          'building': 'NA',
          'phone_number': '+201000000000',
          'city': 'Cairo',
          'country': 'EG',
          'state': 'EG',
        },
        'currency': 'EGP',
        'integration_id': 5076950,
      },
    );
    return response.data['token'];
  }

  // ✅ دالة رابط الـ iframe
  String getIframeUrl(String paymentToken) {
    final iframeUrl =
        'your url';
    return iframeUrl;
  }
}
