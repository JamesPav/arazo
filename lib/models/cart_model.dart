import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {


  String _name = "";
  String _address = "";
  String _comments = "";

  List _tables = [];



  //List of cart Items
  List _cartItems = [];

  List _ingredientsItems = [{"Ποτά":0}];
  List _ingredientsQuantity = [0,];
  List _ingredientsSinglePriceList = [0.0,];
  double _potaPrice = 0;


  get cartItems => _cartItems;

  get potaPrices => _potaPrice;


  get ingredientsItems => _ingredientsItems;
  get ingredientsQuantity => _ingredientsQuantity;

  get ingredientsSinglePriceList => _ingredientsSinglePriceList;

  String get comments {
    return _comments;
  }

  String get orderAddress {
    return _address;
  }

  String get orderName {
    return _name;
  }

  void addComments(String comment){
    _comments = comment;
    notifyListeners();
  }

  void addOrderName(String name){
    _name = name;
    notifyListeners();
  }

  void addOrderAddress(String address){
    _address = address;
    notifyListeners();
  }


  //add FOOD item  to cart
  void addItemToCart(int index,String name,String price,String quantity){
    List item = [name,price,quantity];
    _cartItems.add(item);
    print("pizza added");
    notifyListeners();
  }

  //add ingredient
  void addIngredientToList(String name,double price,) {
    int quantity = 1;
    _potaPrice += price;


    int index = _ingredientsItems.indexWhere((element) => element.keys.first == name);

    if(index >= 0){
      quantity = _ingredientsQuantity[index];
      quantity++;
      _ingredientsItems.removeAt(index);
      _ingredientsItems.insert(index,{name : quantity});
      _ingredientsSinglePriceList.removeAt(index);
      _ingredientsSinglePriceList.insert(index,price);
      _ingredientsQuantity.removeAt(index);
      _ingredientsQuantity.insert(index, quantity);
    } else{
      _ingredientsItems.add({name : quantity});
      _ingredientsSinglePriceList.add(price);
      _ingredientsQuantity.add(quantity);
    }



    print("ingredient added to the list");
    if(_cartItems.isNotEmpty){
      if(_cartItems[0][0] != "Ποτά"){
        _cartItems.insert(0, ["Ποτά","0"]);
      }
    }else {
      _cartItems.add(["Ποτά","0"]);
    }
    notifyListeners();
  }

  void removeIngredientFromList(int index,double price){

    _ingredientsSinglePriceList.removeAt(index);
    _ingredientsQuantity.removeAt(index);
    _ingredientsItems.removeAt(index);
    _potaPrice -= price;
    if(_ingredientsItems.length == 1){
      _cartItems.removeAt(0);
    }
    calculateTotal();
    notifyListeners();
  }

  void removeOneQuantityFromIngredients(int index, double price,int quantity){

    _ingredientsQuantity.removeAt(index);
    _ingredientsQuantity.insert(index, quantity-1);
    _potaPrice -= price;
    if(quantity == 1){
      _ingredientsItems.removeAt(index);
    }
    calculateTotal();
    notifyListeners();
  }

  void removeAllIngredientsFromList(){
    _ingredientsItems = [{"Ποτά":0}];
    _ingredientsQuantity = [0,];
    _ingredientsSinglePriceList = [0.0,];
    _potaPrice = 0;
    calculateTotal();
    notifyListeners();

  }

  //remove item from cart
  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }


  void resetIngredients() {
    _ingredientsItems = [{"Ποτά":0}];
    _ingredientsQuantity = [0,];
    _ingredientsSinglePriceList = [0.0,];
    _potaPrice = 0;
    calculateTotal();
    notifyListeners();
  }

  void resetCartItems(){
    _cartItems = [];
    notifyListeners();
  }

  void resetOrderInfo(){
    _name ="";
    _address="";
    _comments="";
    notifyListeners();
  }

  String calculateTotal(){
    double totalPrice = 0;
    for(int i=0;i<_cartItems.length;i++){
      totalPrice+= double.parse(_cartItems[i][1]);
    }
    totalPrice += _potaPrice;

    return totalPrice.toStringAsFixed(2);
  }

  void resetOrder(){
    resetCartItems();
    resetOrderInfo();
    resetIngredients();
    notifyListeners();
  }


}