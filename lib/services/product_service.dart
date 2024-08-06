import 'package:productos/dao/product_dao.dart';
import 'package:productos/util/log.dart';
class ProductService {
  static const TAG = 'ProductService';
  ProductDao _productDao;

  ProductService(this._productDao);

  Future<bool> updateAvailability(int codigo, int isAvailable) async {
    Log.d(TAG, 'Actualizando disponibilidad con codigo: $codigo, isAvailable: $isAvailable');
    try {
      bool result = await this._productDao.updateIsAvailable(codigo, isAvailable);
      Log.i(TAG, 'Disponibilidad actualizada: $result');
      return result;
    } catch (e) {
      Log.e(TAG, 'Error actualizando disponibilidad: $e');
      return false;
    }
  }
}
