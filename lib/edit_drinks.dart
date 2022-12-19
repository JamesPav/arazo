import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:arazo/widgets/custom_appbar.dart';

import 'colors.dart';
import 'models/cart_model.dart';

class DrinksScreen extends StatefulWidget {
  const DrinksScreen({Key? key}) : super(key: key);

  @override
  State<DrinksScreen> createState() => _DrinksScreenState();
}

class _DrinksScreenState extends State<DrinksScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: kBackGround,
      body: Consumer<CartModel>(builder: (context, value, child) {
        return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const CustomAppBar(
              leftIcon: Icons.menu, rightIcon: Icons.person, backButton: true),
          Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 35, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ποτά',
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: kLight),
                ),
                Row(
                  children: [
                    Text(
                      "${value.ingredientsItems.length - 1}",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kLight),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: kLight,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              key: UniqueKey(),
              itemCount: Provider.of<CartModel>(context, listen: false)
                      .ingredientsItems
                      .length -
                  1,
              itemBuilder: (context, index) {
                List pota = [];
                List potaQuantity = [];

                for (int i = 1; i < value.ingredientsItems.length; i++) {
                  var key = value.ingredientsItems[i].keys.elementAt(0);
                  potaQuantity.add(value.ingredientsItems[i][key]);
                  pota.add(key);
                }

                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: kBackGround,
                              title: Text(
                                "Διαγραφή? ${value.ingredientsSinglePriceList[index + 1]} - apo ${value.potaPrices}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              content: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: ksecColor),
                                      child: TextButton(
                                        onPressed: () {
                                          value.removeIngredientFromList(
                                              index + 1,
                                              potaQuantity[index] *
                                                  value.ingredientsSinglePriceList[
                                                      index + 1]);
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "NAI",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: ksecColor),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "OXI",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )))
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: ListTile(
                        title: Row(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Chip(
                             backgroundColor: kbuttonColord,
                               label: Text(pota[index],style: const TextStyle(color: Colors.white),)),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(
                               padding: const EdgeInsets.all(5),
                               width: 30,
                               decoration: const BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: kbuttonColord,
                               ),
                               child: Center(child: Text(potaQuantity[index].toString(),style: const TextStyle(color: Colors.white),)),
                             ),
                           ),
                           Text("${value.ingredientsSinglePriceList[index + 1]}/τεμάχιο",style: const TextStyle(fontWeight: FontWeight.bold),)
                         ],
                        ),
                        trailing: Text(
                          "${potaQuantity[index] * value.ingredientsSinglePriceList[index + 1]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kbuttonColord,
              ),
              padding: const EdgeInsets.all(24),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ΣΥΝΟΛΙΚΗ ΤΙΜΗ ΠΟΤΑ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          value.potaPrices.toStringAsFixed(2),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ]);
      }),
    );
  }
}
