import 'package:chapa_mekedonia/Presentation/Pages/HomeScreen/homescreen.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              child: Icon(Icons.verified),
            ),
            const Text(
              "Payment successful",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false,
                  );
                },
                child: const Text("Go Back"))
          ],
        ),
      ),
    );
  }
}
