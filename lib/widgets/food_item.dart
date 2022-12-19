import 'package:flutter/material.dart';
import 'package:arazo/colors.dart';

import '../models/pizza.dart';

class FoodItem extends StatefulWidget {
  final CatalogItem pizza;
  final void Function()? onPressed;

  const FoodItem({Key? key, required this.pizza, this.onPressed})
      : super(key: key);

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem>
    with AutomaticKeepAliveClientMixin {
  bool isChecked = false;
  int quantity = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: (){
        widget.onPressed!();
        quantity++;
        setState(() {
          isChecked = true;
        });
      },
      onLongPress: (){
        quantity = 0;
        setState(() {
          isChecked = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: !isChecked ? kLight : Colors.green,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 5),
                  child:
                      Text(
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        widget.pizza.name,
                        style: TextStyle
                          (
                            fontWeight: FontWeight.bold,
                            color: isChecked ? kLight : kbuttonColord,
                            fontSize: 14),
                      ),
                ),
              ],
            ),

            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "€${widget.pizza.price}",
                    style: TextStyle(
                        color: !isChecked ? kdarkColor : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.onPressed!();
                          quantity++;
                          setState(() {
                            isChecked = true;
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isChecked ? kLight : kbuttonColord),
                          child: Center(
                            child: quantity == 0 ? Icon(
                              Icons.add,
                              color: isChecked ? kbuttonColord : Colors.white,
                            ) : Text(quantity.toString(),style: const TextStyle(fontWeight: FontWeight.bold,color: kbuttonColord,fontSize: 16,),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
