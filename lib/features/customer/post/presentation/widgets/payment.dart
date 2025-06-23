import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Parcelo/core/common/widgets/show_toast.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/features/customer/maps/logic/maps_cubit.dart';
import 'package:Parcelo/features/customer/post/logic/post_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../main_screen/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Parcelo/core/common/widgets/show_toast.dart';
import 'package:Parcelo/core/extensions/context_extension.dart';
import 'package:Parcelo/features/customer/maps/logic/maps_cubit.dart';
import 'package:Parcelo/features/customer/post/logic/post_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../main_screen/presentation/main_screen.dart';

class PaymobWebViewScreen extends StatefulWidget {
  final String paymentToken;
  final double distance;
  final String price;

  const PaymobWebViewScreen({
    super.key,
    required this.paymentToken,
    required this.distance,
    required this.price,
  });

  @override
  State<PaymobWebViewScreen> createState() => _PaymobWebViewScreenState();
}

class _PaymobWebViewScreenState extends State<PaymobWebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            if (url.contains('success')) {
              // ✅ بعد نجاح الدفع
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                final postCubit = context.read<PostCubit>();
                final mapCubit = context.read<MapCubit>();

                await postCubit.addPost(
                  distance: widget.distance,
                  priceController: widget.price,
                );
                print('added' ' ${widget.distance}' '${widget.price}');

                mapCubit.setStartPoint(null);
                mapCubit.setEndPoint(null);
                mapCubit.resetValues();
                postCubit.clear();

                ShowToast.showSuccessToast('تم إرسال الطلب بنجاح');

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => MainScreen()),
                  (route) => false,
                );
              });
            } else if (url.contains('failure')) {
              ShowToast.showFailureToast('فشل الدفع. حاول مرة أخرى.');
              Navigator.pop(context); // يرجع
            }
          },
        ),
      );

    startPayment();
  }

  void startPayment() {
    controller.loadRequest(
      Uri.parse(
        'your token',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: context.color.greenLight),
      body: WebViewWidget(controller: controller),
    );
  }
}
