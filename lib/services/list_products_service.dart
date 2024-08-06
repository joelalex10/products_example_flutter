import 'package:productos/dao/product_dao.dart';
import 'package:productos/dto/marca_list_dto.dart';

class ListProductsService{
  final ProductDao _productDao;
  ListProductsService(this._productDao);

  Future<List<MarcaListDto>> getTotalProductsByBrand() async {
    return await _productDao.selectTotalProductsByBrand();
  }
}