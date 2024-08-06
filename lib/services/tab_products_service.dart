import 'package:productos/dao/product_dao.dart';
import 'package:productos/dto/product_dto.dart';

class TabProductsService{
  ProductDao _productDao;
  TabProductsService(this._productDao);
  Future<List<ProductDto>>getAllProducts() async {
    final result =  await _productDao.selectAllProducts();
    return result ?? [];
  }
  Future<List<ProductDto>>getProductsByBrand(String brand) async {
    final result =  await _productDao.selectProductsByBrand(brand);
    return result ?? [];
  }

}