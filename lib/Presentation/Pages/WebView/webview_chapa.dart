import 'package:chapa_mekedonia/Presentation/Pages/SuccessScreen/success_screen.dart';
import 'package:chapa_mekedonia/Presentation/bloc/VerifyPaymentBloc/verify_payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewChapa extends StatelessWidget {
  const WebViewChapa({super.key, required this.chapaCheckoutUrl});
  final String chapaCheckoutUrl;
  @override
  Widget build(BuildContext context) {
    print(chapaCheckoutUrl);
    return SafeArea(
      child: Column(children: <Widget>[
        Expanded(
            child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(chapaCheckoutUrl)),
                onWebViewCreated: (controller) {},
                onUpdateVisitedHistory: (InAppWebViewController controller,
                    Uri? uri, androidIsReload) async {
                  if (uri.toString().contains('checkout/payment-receipt/')) {
                    // payment successful
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SuccessScreen()),
                        (route) => false);
                  }
                }))
      ]),
    );
  }
}
