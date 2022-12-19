import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../models/cart_model.dart';

class IngredientItem extends StatefulWidget {
  final String name;
  final double price;
  final List ingredientExist;
  final Function callback;
  final Function removeQCallback;

  const IngredientItem({
    Key? key,
    required this.name,
    required this.price,
    required this.ingredientExist,
    required this.callback, required this.removeQCallback,
  }) : super(key: key);

  @override
  State<IngredientItem> createState() => _IngredientItemState();
}

class _IngredientItemState extends State<IngredientItem>
    with AutomaticKeepAliveClientMixin {
  int quantity = 0;

  double totalPrice = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final dataList = Provider.of<CartModel>(context);

    return GestureDetector(
      onLongPress: () {

        setState(() {
          quantity--;
          totalPrice -= widget.price;
        });
        int index =widget.callback(widget.name);
        int newQuant = dataList.ingredientsQuantity[widget.callback(widget.name)];

        if(newQuant >= 1){
          Provider.of<CartModel>(context, listen: false).removeOneQuantityFromIngredients(index, widget.price, newQuant);
        }

      },
      onTap: () {
        setState(() {
          quantity++;
          totalPrice += widget.price;
        });

        Provider.of<CartModel>(context, listen: false).addIngredientToList(
          widget.name,
          widget.price,
        );

        print(dataList.ingredientsItems);
        print(dataList.ingredientsQuantity);
      },
      child: Stack(
        children: [
          Container(
            height: 50,
          decoration: BoxDecoration(
              color: widget.ingredientExist.contains(widget.name)
                  ? Colors.green
                  : ksecColor,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: 100,
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
              Text(
                widget.price.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              )
            ],
          ),
        ),
          widget.ingredientExist.contains(widget.name) ?
          Positioned(
            top: -3,
              right: -3,
              child: Container(
               padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBackGround
                ),
                child: Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
            ),
            child: Center(
                child: Text("${dataList.ingredientsQuantity[widget.callback(widget.name)]}",style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),),
            ),
          ),
              )) : Container()
        ]
      ),
    );
  }
}
