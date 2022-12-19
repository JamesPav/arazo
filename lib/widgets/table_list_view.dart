import 'package:arazo/models/table.dart';
import 'package:arazo/widgets/table_item.dart';
import 'package:flutter/material.dart';
import '../models/trapezi_item.dart';

class TableListView extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final Trapezi table;
  final void Function()? onPressed;

  const TableListView(
      {Key? key,
      required this.selected,
      required this.callback,
      required this.pageController,
      required this.table,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = table.trapezi.keys.toList();
    final trapeziList = TrapeziItem.generateGkazonList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: trapeziList.map((trapezi) => GridView.builder(
                  addAutomaticKeepAlives: true,
                      padding:
                          const EdgeInsets.only(bottom: 80, left: 8, right: 8),
                      itemBuilder: (context, index) => TableItem(
                        trapezi: table.trapezi[category[selected]]![index],
                        onPressed: () {
                          // Provider.of<CartModel>(context,listen: false).addItemToCart(index,food!.menu[category[selected]]![index].name,food!.menu[category[selected]]![index].price.toString(),food!.menu[category[selected]]![index].quantity.toString());
                          // print(dataList.cartItems);
                        },
                      ),
                      itemCount: table.trapezi[category[selected]]!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(

                        crossAxisCount: 5,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 10,
                        childAspectRatio: 8 / 7,
                      ),
                    ))
            .toList(),
      ),
    );
  }
}
