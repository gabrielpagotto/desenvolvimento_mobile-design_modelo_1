import 'package:mobile_modelo_1/src/constants/global_constants.dart';
import 'package:mobile_modelo_1/src/data/bebida.dart';

class BebidaUtils {
  static String createBebidaTag(Bebida bebida) {
    return BEBIDA_IMAGE_TAG + bebida.nome;
  }
}
