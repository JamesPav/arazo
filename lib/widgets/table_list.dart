import 'package:flutter/material.dart';


class TableList extends StatefulWidget {
  final Function callback;
  final int selected;

  const TableList({Key? key, required this.callback, required this.selected}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> with AutomaticKeepAliveClientMixin {

  final controller = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final categories = [
      "Εσωτερικός Χώρος",
      "Πατάρι",
      "Γκαζόν",
      "Τέντα"
    ];

    return Column(
      children: [
        Container(
          height: 55,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            controller: controller,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      widget.callback(index);
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: widget.selected == index ? Colors.black : Colors.grey,
                      ),
                      child: Text(
                        categories[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
              separatorBuilder: (_, index) => const SizedBox(
                    width: 20,
                  ),
              itemCount: categories.length),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          // child: PageView(
          //   controller: pageController,
          //   onPageChanged: (index) => callback(index),
          //   children: pizzaList
          //       .map((pizza) => Consumer<CartModel>(
          //           builder: (context, value, child) => GridView.builder(
          //                 padding: const EdgeInsets.only(
          //                     bottom: 80, left: 8, right: 8),
          //                 itemBuilder: (context, index) => FoodItem(
          //                   pizza: food!.menu[category[selected]]![index],
          //                   onPressed: () {
          //                     Provider.of<CartModel>(context, listen: false)
          //                         .addItemToCart(
          //                             index,
          //                             food!.menu[category[selected]]![index]
          //                                 .name,
          //                             food!.menu[category[selected]]![index]
          //                                 .price
          //                                 .toString(),
          //                             food!.menu[category[selected]]![index]
          //                                 .quantity
          //                                 .toString());
          //                     print(dataList.cartItems);
          //                   },
          //                 ),
          //                 itemCount: food.menu[category[selected]]!.length,
          //                 gridDelegate:
          //                     const SliverGridDelegateWithFixedCrossAxisCount(
          //                         crossAxisCount: 2,
          //                         crossAxisSpacing: 10,
          //                         mainAxisSpacing: 10,
          //                         childAspectRatio: 2 / 1),
          //               )))
          //       .toList(),
          // ),
        )
      ],
    );
  }
}
