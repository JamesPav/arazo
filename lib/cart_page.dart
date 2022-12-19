import 'package:flutter/material.dart';
import 'package:arazo/edit_drinks.dart';
import 'package:arazo/print_screen.dart';
import 'package:arazo/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import 'colors.dart';
import 'models/cart_model.dart';

final _formKey = GlobalKey();

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  final TextEditingController _onomaTextController = TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();
  final TextEditingController _commentsTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final dataList = Provider.of<CartModel>(context);
    _onomaTextController.text = dataList.orderName;
    _commentsTextController.text = dataList.comments;
    _addressTextController.text = dataList.orderAddress;

    return Scaffold(
        backgroundColor: kBackGround,
        body: Consumer<CartModel>(
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomAppBar(
                leftIcon: Icons.menu,
                rightIcon: Icons.person,
                backButton: true),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 35, right: 25),
              child: Row(
                children: [
                   Chip(
                     padding:const  EdgeInsets.only(left: 5),
                       label: Row(
                     mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Τραπέζι',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            ),
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )),
                  const SizedBox(width: 15,),
                  Chip(
                      padding:const  EdgeInsets.symmetric(horizontal: 10),
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.person),
                          Text("1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 35, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Παραγγελία',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kLight),
                  ),
                  Row(
                    children: [
                      Text(
                        value.cartItems.length.toString(),
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: kLight),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Icon(Icons.shopping_bag_outlined,color: kLight,),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            value.cartItems.length > 0
                ? Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Provider.of<CartModel>(context, listen: false)
                                  .resetOrder();
                              _onomaTextController.clear();
                              setState(() {});
                            },
                            child: const Text(
                              "Καθαρισμός",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                            )),
                      ],
                    ),
                  )
                : Container(),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 12),
                    itemCount: value.cartItems.length,
                    itemBuilder: (context, index) {
                      List<Widget> pota = [];
                      List potaQuantity = [];
                      String ingredients = "";

                      for(int i = 1; i< value.ingredientsItems.length;i++){
                        var key = value.ingredientsItems[i].keys.elementAt(0);
                        potaQuantity.add(value.ingredientsItems[i][key]);
                        print(potaQuantity);
                        pota.add(
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Chip(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                backgroundColor: kbuttonColord,
                                padding:const EdgeInsets.symmetric(horizontal: 2),

                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(key,style: const TextStyle(fontSize: 12,color: Colors.white),),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3.0),
                                      child: Container(
                                        width: 20,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: Center(child: Text("${potaQuantity[i - 1]}")),
                                      ),
                                    )
                                  ],
                                ),),
                            )
                        );

                      }

                      print(ingredients);
                      print(value.ingredientsItems);





                      return   value.cartItems[index][0] != "Ποτά" ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.cartItems[index][0],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kbuttonColord,
                                  ),
                                ),
                                const Text(
                                        "",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kbuttonColord,
                                            fontSize: 12),
                                      ),
                              ],
                            ),
                            subtitle: Text(
                              "€ ${value.cartItems[index][1]}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kbuttonColord,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () {
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index);
                                print(dataList.cartItems);
                              },
                            ),
                          ),
                        ),
                        /// ΠΟΤΑ ///

                      ) : Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DrinksScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  const Text(
                                    "ΠΟΤΑ - ΜΠΥΡΕΣ - ΚΡΑΣΙΑ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kbuttonColord,
                                    ),
                                  ),
                                  Wrap(
                                    children: pota,
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                "€ ${value.potaPrices.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kbuttonColord,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.cancel),
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemFromCart(index);
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeAllIngredientsFromList();
                                  print(dataList.cartItems);
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
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
                          "ΣΥΝΟΛΙΚΗ ΤΙΜΗ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          value.calculateTotal(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: kbuttonColord,
                                isScrollControlled: true,

                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25)
                                    )
                                  ),
                                  context: context, builder: (context){
                                return SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 24,
                                        left:24,right: 24,
                                        bottom: MediaQuery.of(context).viewInsets.bottom),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();

                                            },
                                            icon: const Icon(Icons.close),
                                          ),
                                        ),
                                        const SizedBox(height: 25,),
                                        Form(
                                          key: _formKey,
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 15,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: Colors.white,
                                                  ),

                                                  padding: const EdgeInsets.all(4),
                                                  child: TextFormField(
                                                      onChanged: (value){
                                                dataList.addOrderName(value);
                                                },
                                                    initialValue: _onomaTextController.text,
                                                    decoration:  const InputDecoration(
                                                      border: InputBorder.none,
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      labelText: "Ονομα",
                                                      labelStyle: TextStyle(color: kbuttonColord),
                                                      contentPadding: EdgeInsets.all(12),

                                                    ),

                                                  ),
                                                ),
                                                const SizedBox(height: 25,),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(12),
                                                      color: Colors.white,
                                                    ),
                                                    padding: const EdgeInsets.all(4),
                                                  child: TextFormField(
                                                    onChanged: (value){
                                                      dataList.addOrderAddress(value);
                                                    },
                                                    initialValue: _addressTextController.text,
                                                    decoration:  const InputDecoration(
                                                      border: InputBorder.none,
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      labelText: "Διεύθυνση",
                                                      labelStyle: TextStyle(color: kbuttonColord),
                                                      contentPadding: EdgeInsets.all(12),

                                                    ),

                                                  ),
                                                ),
                                                const SizedBox(height: 25,),
                                                 Container(
                                                   decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(12),
                                                     color: Colors.white,
                                                   ),

                                                   padding: const EdgeInsets.all(4),
                                                   child: TextFormField(
                                                     onChanged: (value){
                                                       dataList.addOrderAddress(value);
                                                     },
                                                     initialValue: _addressTextController.text,
                                                      minLines: 5,
                                                      maxLines:50,
                                                      decoration:   const InputDecoration(
                                                        alignLabelWithHint: true,
                                                        border: InputBorder.none,
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        labelText: "Σχόλια",
                                                        labelStyle: TextStyle(color: kbuttonColord),
                                                        contentPadding: EdgeInsets.all(12),

                                                      ),

                                                    ),
                                                 ),

                                                const SizedBox(height: 25,),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                    height:50,
                                                    width:300,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(12),
                                                      color: ksecColor,
                                                    ),

                                                    padding: const EdgeInsets.all(4),
                                                    child: const Center(
                                                      child: Text("Καταχώρηση",style: TextStyle(color: kbuttonColord,fontWeight: FontWeight.bold,fontSize: 20,letterSpacing: 1.2),),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 25,),
                                              ],
                                            )

                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                            icon: const Icon(Icons.message_outlined),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            onPressed: () {



                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>  const PrintScreen()));
                            },
                            icon: const Icon(Icons.delivery_dining_outlined),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    ));
  }


}
