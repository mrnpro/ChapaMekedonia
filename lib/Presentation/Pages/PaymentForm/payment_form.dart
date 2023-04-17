import 'package:chapa_mekedonia/Core/Util/Payment/transaction_generator.dart';
import 'package:chapa_mekedonia/Presentation/Pages/PaymentReady/payment_ready_screen.dart';
import 'package:chapa_mekedonia/Presentation/bloc/PaymentUrlBloc/payment_url_bloc.dart';
import 'package:chapa_mekedonia/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  late PaymentUrlBloc _paymentUrlBloc;
  @override
  void initState() {
    _paymentUrlBloc = container<PaymentUrlBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RepositoryProvider.value(
      value: _paymentUrlBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("payment form "),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                  controller: firstName,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "first name",
                    hintText: "Enter first name",
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 13,
                    ),
                  )),
              TextField(
                  keyboardType: TextInputType.name,
                  controller: lastName,
                  decoration: const InputDecoration(
                    labelText: "last name",
                    hintText: "Enter last name",

                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 13,
                    ), //label style
                  )),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: "email",
                    hintText: "Enter email adress",

                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 13,
                    ), //label style
                  )),
              TextField(
                  keyboardType: TextInputType.phone,
                  controller: phoneNumber,
                  decoration: const InputDecoration(
                    labelText: "phone number",
                    hintText: "enter phone number",

                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 13,
                    ), //label style
                  )),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: amount,
                  decoration: const InputDecoration(
                    labelText: "amount to donate",
                    hintText: "enter amount to donate",

                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 13,
                    ), //label style
                  )),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<PaymentUrlBloc, PaymentUrlState>(
                listener: (context, state) {
                  if (state is PaymentProcessingError) {
                    Fluttertoast.showToast(msg: state.error);
                  }
                  if (state is PaymentUrlFetched) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contex) => PaymentReadyScreen(
                                checkoutUrl: state.checkoutUrl)));
                  }
                },
                builder: (context, state) {
                  if (state is PaymentUrlProccessing) {
                    return SizedBox(
                        width: size.width / 1.3,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            )));
                  }
                  return SizedBox(
                      width: size.width / 1.3,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            _paymentUrlBloc.add(GetPaymentUrlEvent(
                                amount.text.trim(),
                                email.text.trim(),
                                firstName.text.trim(),
                                lastName.text.trim(),
                                phoneNumber.text.trim(),
                                TxRefRandomGenerator.generate()));
                          },
                          child: const Text("Procceed")));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
