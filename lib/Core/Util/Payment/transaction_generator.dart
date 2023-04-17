import 'dart:math';

class TxRefRandomGenerator {
  static String txRef = "";
  static String generate() {
    final random = Random();
    txRef = 'Pharmabet-${random.nextInt(200)}';
    return txRef;
  }
}
