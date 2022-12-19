import 'package:arazo/models/pizza.dart';

class Food{

  Map<String, List<CatalogItem>> menu;

  Food(
      this.menu
      );

  static Food generateFood() {
    return Food(
        {
          "Σαλάτες": CatalogItem.generateCatalogItemList(),
          "Ορεκτικά": CatalogItem.generateOrektikaList(),
          "Γάστρες":CatalogItem.generateGastresList(),
          "Σούβλα":CatalogItem.generateSouvlaList(),
          "Της ώρας":CatalogItem.generateOrasList(),
        }
    );
  }

}