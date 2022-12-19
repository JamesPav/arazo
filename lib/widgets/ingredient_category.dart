import 'package:flutter/material.dart';
import 'package:arazo/models/pizza.dart';

import '../colors.dart';

class IngredientList extends StatelessWidget {
  final bool pizzaSelected;
  final int selected;
  final Function callback;
  final CatalogItem? pizza;
  final Function scrollCallback;

  const IngredientList({Key? key, required this.selected, required this.callback,this.pizza, required this.pizzaSelected, required this.scrollCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = ["Μπύρες","Ρετσίνες","Τοπ. Κρασιά","Εμφ. Κρασιά","Καραφάκι Αποστ."];

    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              callback(index);
              scrollCallback(index);
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
