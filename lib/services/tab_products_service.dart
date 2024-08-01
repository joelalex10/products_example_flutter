import 'package:productos/dao/product_dao.dart';
import 'package:productos/dto/product_dto.dart';

class TabProductsService{
  ProductDao _productDao;
  TabProductsService(this._productDao);
  Future<List<ProductDto>>getAllProducts() async {
    return await _productDao.selectAllProducts();

  }
}