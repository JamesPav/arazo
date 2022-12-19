import 'package:flutter/material.dart';
import 'package:arazo/models/cart_model.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../models/pizza.dart';
import 'food_item.dart';

class FoodListView extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final Food food;
  final void Function()? onPressed;

  const FoodListView(
      {Key? key,
      required this.selected,
      required this.callback,
      required this.pageController,
      required this.food, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataList = Provider.of<CartModel>(context);
    final category = food.menu.keys.toList();
    final pizzaList = CatalogItem.generateCatalogItemList();


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: PageView(
        controller: pageController,

        onPageChanged: (index) => callback(index),
        children:
          pizzaList.map((pizza) => Consumer<CartModel>(
              builder: (context, value,child) => GridView.builder(
                padding: const EdgeInsets.only(bottom: 80,left: 8,right: 8),
                itemBuilder: (context,index) => FoodItem(
                  pizza: food.menu[category[selected]]![index],
                  onPressed: (){
                    Provider.of<CartModel>(context,listen: false).addItemToCart(index,food.menu[category[selected]]![index].name,food.menu[category[selected]]![index].price.toString(),food.menu[category[selected]]![index].quantity.toString());
                  print(dataList.cartItems);
                    },
                ),
                itemCount: food.menu[category[selected]]!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 2/1),
              )

          )).toList()
        ,
      ),
    );
  }
}
