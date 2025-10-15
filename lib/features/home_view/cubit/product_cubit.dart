import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nti_laptop_api/features/home_view/model/product_data.dart';
import 'package:nti_laptop_api/features/home_view/model/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitialState());

  getProductData() async {
    emit(ProductLoadingState());

    emit(ProductLoadedState(listProduct: await ProductData().getProducts()));
  }
}
