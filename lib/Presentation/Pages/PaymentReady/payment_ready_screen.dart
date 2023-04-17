import 'package:flutter/material.dart';

import 'Body/payment_ready_body.dart';

class PaymentReadyScreen extends StatelessWidget {
  const PaymentReadyScreen({super.key, required this.checkoutUrl});
  final String checkoutUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose"),
      ),
      body: PaymentReadyBody(checkoutUrl: checkoutUrl),
    );
  }
}
