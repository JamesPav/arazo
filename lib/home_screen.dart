import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:arazo/menu_screen.dart';
import 'package:arazo/models/cart_model.dart';
import 'package:arazo/widgets/custom_appbar.dart';
import 'package:arazo/widgets/food_list.dart';
import 'package:arazo/widgets/food_list_view.dart';
import 'package:arazo/widgets/ingredient_category.dart';
import 'package:arazo/widgets/ingredient_item.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';
import 'colors.dart';
import 'models/food.dart';
import 'models/pizza.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin {
  
  final ZoomDrawerController z = ZoomDrawerController();
  
  bool pizzaSelected = true;
  bool crepizzaSelected = false;
  bool isChecked = false;
  var selected = 0;
  var selectedIngredient = 0;
  double scrollPoint = 0.0;
  List selectedPoints = [0.00,284.34,470.58,630.10,1380.10];
  PageController pageController = PageController();
  PageController crepizzaPageController = PageController();
  final food = Food.generateFood();

  final pizzaList = CatalogItem.generateCatalogItemList();
  ScrollController scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(() {
      // print out the scroll offset
    });
    super.initState();
  }

int returnIndex(String name){
  int index = Provider.of<CartModel>(context, listen: false)
      .ingredientsItems.indexWhere((element) => element.keys.first == name);
  return index;
}

void removeIngredientQuantity(int index ,String name,double price,int quantity){
  Provider.of<CartModel>(context, listen: false).removeOneQuantityFromIngredients(index, price, quantity);

}

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final dataList = Provider.of<CartModel>(context);
    List ingredients = [];


    for(int i =0;i < dataList.ingredientsItems.length;i++){
      var key = dataList.ingredientsItems[i].keys.elementAt(0);

      ingredients.add(key);
    }
    print(ingredients);



    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    //index slider
    //


    return ZoomDrawer(
      controller: z,
      borderRadius: 24,
      style: DrawerStyle.style1,
      showShadow: true,
      openCurve: Curves.easeInOutBack,
     
     mainScreen: Scaffold(
        backgroundColor: kBackGround,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

        CustomAppBar(leftIcon: Icons.menu, rightIcon: Icons.person,leftCallback: (){z.toggle!();}),

            Padding(
              padding: const EdgeInsets.only(top: 35.0, left: 35),
              child: Row(
                children: const [
                  Text(
                    'Νέα Παραγγελία',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kLight),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pizzaSelected = false;
                        selectedIngredient = 0;
                      });
                      crepizzaPageController.initialPage;
                      print(pizzaSelected);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: pizzaSelected == false ? ksecColor : Colors.white,
                      ),
                      child: const Text(
                        "Ποτά",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            FoodList(
                pizzaSelected: pizzaSelected,
                selected: selected,
                callback: (int index) {
                  setState(() {
                    pizzaSelected = true;
                    crepizzaSelected = false;
                    selected = index;
                  });
                  if (pageController.hasClients) {
                    pageController.jumpToPage(index);
                  }
                }),
            !pizzaSelected ? IngredientList(
              pizzaSelected: crepizzaSelected,
              selected: selectedIngredient,
              callback: (int index) {
                setState(() {
                  crepizzaSelected = true;
                  selectedIngredient = index;
                });
                if (pageController.hasClients) {

                }
              },scrollCallback: (int index){
              setState(() {
                scrollPoint = selectedPoints[index];
              });

              if (crepizzaPageController.hasClients) {
                scrollController.animateTo(scrollPoint, duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
              }

            },
            ) : Container(),
            Expanded(
              child: pizzaSelected
                  ? FoodListView(
                selected: selected,
                pageController: pageController,
                callback: (int index) {
                  setState(() {
                    pizzaSelected = true;
                    selected = index;
                  });
                },
                food: food,
              )
                  : Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: PageView(
                    controller: crepizzaPageController,
                    children:[
                      GridView.count(
                        padding: const EdgeInsets.only(bottom: 80),
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        controller: scrollController,
                        childAspectRatio:
                        MediaQuery.of(context).size.width / 100,
                        children: [
                          const Center(child: Text("ΜΠΥΡΕΣ",style:TextStyle(fontWeight: FontWeight.bold,color: kdarkColor)),),
                          const SizedBox(),
                           IngredientItem(name:"Amstel",price:3,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Αλφα",price:3,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Βεργίνα",price:2.5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Κάιζερ",price:3.5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Μάμος",price:3.5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Χωρίς Αλκοόλ",price:3,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                          IngredientItem(name:"Heineken",price:3.5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                          IngredientItem(name:"Βεργίνα Weiss",price:3.5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                          const Center(child: Text("ΟΥΖΟ - ΤΣΙΠΟΥΡΟ",style:TextStyle(fontWeight: FontWeight.bold,color: kdarkColor)),),
                          const SizedBox(),
                           IngredientItem(name:"Ούζο Πλωμάρι 50ράκι",price:6,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Τσίπουρο 50ράκι",price:5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Γράπα 50ράκι",price:5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                          const SizedBox(),
                          const Center(child: Text("ΤΟΠΙΚΑ ΚΡΑΣΙΑ",style:TextStyle(fontWeight: FontWeight.bold,color: kdarkColor)),),
                           const SizedBox(),
                           IngredientItem(name:"Λευκό Ημίξηρο 500ml",price:5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Κόκκινο Ξινόμαυρο 500ml",price:5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Κόκκινο Ημίγλυκο 500ml",price:5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Ροζέ Ξινόμαυρο 500ml",price:5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                          const Center(child: Text("ΕΜΦΙΑΛΩΜΕΝΑ ΚΡΑΣΙΑ",style:TextStyle(fontWeight: FontWeight.bold,color: kdarkColor)),),
                           const SizedBox(),
                           IngredientItem(name:"Θοός Δαλαμάρα Λευκός Οίνος",price:14,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Δογματικός VAENI",price:14,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Καστανιώτη Chardonnay",price:12,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Naoussa Dalamara",price:18,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Grande Reserve Vaeni",price:15,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Damascenos Vaeni",price:15,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Παράγκα Κυρ-Γιάννη",price:15,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                          IngredientItem(name:"Χαρούλα Λευκός Οίνος",price:15,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                          const Center(child: Text("ΚΑΡΑΦΑΚΙ ΑΠΟΣΤΑΞΗΣ",style:TextStyle(fontWeight: FontWeight.bold,color: kdarkColor)),),
                           const SizedBox(),
                          IngredientItem(name:"Καραφάκι Τσίπουρο 250ml",price:5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Καραφάκι Γράπα 250ml*",price:5,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Εμφιαλωμένη γράπα 200ml",price:8,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                           IngredientItem(name:"Εμφιαλωμένo ούζο 200ml",price:8,ingredientExist: ingredients,callback: returnIndex,removeQCallback: removeIngredientQuantity),
                        ],
                      )
                    ]
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 15,),
            FloatingActionButton(
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return const CartPage();
                } ));


              },
              backgroundColor: kbuttonColord,
              elevation: 2,
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 30,
              ),
            ),
          ],
        ),
      ), menuScreen: MenuScreen(callback: (){z.toggle!();}),
    );
  }
}
