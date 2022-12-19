import 'package:flutter/material.dart';
import 'package:arazo/models/pizza.dart';

import '../colors.dart';

class FoodList extends StatelessWidget {
  final bool pizzaSelected;
  final int selected;
  final Function callback;
  final CatalogItem? pizza;

  const FoodList({Key? key, required this.selected, required this.callback,this.pizza, required this.pizzaSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = ["Σαλάτες","Ορεκτικά","Γάστρες","Σούβλα","Της ώρας"];

    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              callback(index);

            } ,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                    color: selected == index && pizzaSelected ? ksecColor : Colors.white,
              ),
              child: Text(categories[index],style: const TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
          separatorBuilder: (_,index)=> const SizedBox(width: 20,),
          itemCount: categories.length),
    );
  }
}
