import 'package:flutter/material.dart';

import '../../PaymentForm/payment_form.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.network(
            "https://img1.wsimg.com/isteam/ip/c70ea4a7-060c-4312-a41a-2e386f29b92e/ec412118-0beb-48b6-b55a-33f183ebb22c.jpg"),
        SizedBox(
          height: 20,
        ),
        SizedBox(
            width: size.width / 1.3,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentForm()));
                },
                child: Text("Donate"))),
      ],
    );
  }
}
