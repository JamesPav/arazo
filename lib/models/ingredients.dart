class Ingredient{
  String name;
  double price;

  Ingredient(
      this.name,
      this.price
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price":price,
    // "radius":radius
  };

}


Map<String,dynamic> ingredientsAllantika =
{
};






