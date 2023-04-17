import 'package:chapa_mekedonia/Core/Util/Payment/transaction_generator.dart';
import 'package:chapa_mekedonia/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../bloc/VerifyPaymentBloc/verify_payment_bloc.dart';
import '../../SuccessScreen/success_screen.dart';
import '../../WebView/webview_chapa.dart';

class PaymentReadyBody extends StatefulWidget {
  const PaymentReadyBody({super.key, required this.checkoutUrl});
  final String checkoutUrl;

  @override
  State<PaymentReadyBody> createState() => _PaymentReadyBodyState();
}

class _PaymentReadyBodyState extends State<PaymentReadyBody> {
  late VerifyPaymentBloc _verifyPaymentBloc;
  @override
  void initState() {
    _verifyPaymentBloc = container<VerifyPaymentBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _verifyPaymentBloc,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    Clipboard.setData(ClipboardData(text: widget.checkoutUrl));
                    Fluttertoast.showToast(
                        msg: "payment url coppied to clipboard");
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.share,
                        size: 40,
                      ),
                      Text("Share link")
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewChapa(
                                  chapaCheckoutUrl: widget.checkoutUrl,
                                )));
                  },
                  child: Column(
                    children: const [
                      Icon(
                        Icons.payment,
                        size: 40,
                      ),
                      Text("in app pay")
                    ],
                  ),
                ),
                BlocConsumer<VerifyPaymentBloc, VerifyPaymentState>(
                  listener: (context, state) {
                    if (state is VerifyError) {
                      Fluttertoast.showToast(msg: state.error);
                    } else if (state is PaymentUnsuccessful) {
                      Fluttertoast.showToast(msg: "Payment not paid yet ");
                    } else if (state is PaymentSuccessful) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessScreen()));
                    }
                  },
                  builder: (context, state) {
                    if (state is Verifying) {
                      return const CircularProgressIndicator();
                    }
                    return InkWell(
                      onTap: () {
                        _verifyPaymentBloc
                            .add(Verify(TxRefRandomGenerator.txRef));
                      },
                      child: Column(
                        children: const [
                          Icon(
                            Icons.verified,
                            size: 40,
                          ),
                          Text("verify payment")
                        ],
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
