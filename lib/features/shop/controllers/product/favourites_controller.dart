import 'dart:convert';

import 'package:get/get.dart';
import '/data/repositories/product/product_repository.dart';
import '/utils/local_storage/storage_utility.dart';
import '/utils/popups/loaders.dart';
import '/features/shop/models/product_model.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  /// Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize by fetching the list of already added favorites
    initFavorites();
  }

  // Method to initialize favorites by reading from storage
  Future<void> initFavorites() async {
    final json = ALocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  /// Method to check if a product is selected (favorite)
  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  /// Add Product to Favourites
  void toggleFavoriteProduct(String productId) {
    // If favorites do not have this product, Add. Else Toggle
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      ALoaders.customToast(message: 'Product has been added to the Wishlist.');
    } else {
      ALocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      ALoaders.customToast(
          message: 'Product has been removed from the Wishlist.');
    }
  }

  // Save the updated favorites to storage
  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    ALocalStorage.instance().writeData('favorites', encodedFavorites);
  }

  /// Method to get the list of favorite products
  Future<List<ProductModel>> favoriteProducts() {
    return ProductRepository.instance
        .getFavouriteProducts(favorites.keys.toList());
  }
}
