import 'package:productos/dao/product_dao.dart';
import 'package:productos/dto/product_dto.dart';

class InsertProductsService{
  ProductDao _productDao;
  InsertProductsService(this._productDao);
  Future<void> addProductToDatabase(ProductDto productDto) async {
    await _productDao.insertProduct(productDto);
}
}