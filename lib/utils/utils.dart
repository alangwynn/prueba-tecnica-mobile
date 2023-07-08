
import 'dart:math';

class Utils {

  static int generarNumerosAleatorios() {
    final random = Random();
    return 1 + random.nextInt(100 - 1);
  }

}