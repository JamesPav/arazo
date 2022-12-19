import 'package:flutter/material.dart';
import 'package:arazo/colors.dart';
import 'package:arazo/home_screen.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';


class CustomAppBar extends StatefulWidget {

  final IconData leftIcon;
  final IconData rightIcon;
  final Function? leftCallback;
  final bool? backButton;

  const CustomAppBar({Key? key, required this.leftIcon, required this.rightIcon, this.leftCallback, this.backButton}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {


void goBack() {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage()));
}



  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.backButton == true ?  GestureDetector(
            onTap: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  contentPadding: const EdgeInsets.only(top: 24),
                  shadowColor: Colors.grey,

                  backgroundColor: kbuttonColord,
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                          child: Text("Πατήστε συνέχεια ή ακύρωση της παραγγελίας",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white) ),

                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }, child: const Text("Συνέχεια",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
                    const SizedBox(width: 10,),
                    TextButton(onPressed: (){
                      Provider.of<CartModel>(context,listen: false).resetOrder();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
                    }, child: const Text("Ακύρωση",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)))
                  ],
                );
              });

            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ksecColor,
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ):
          GestureDetector(
            onTap: widget.leftCallback != null ? () => widget.leftCallback!() : (){
            },
            child: _buildIcon(widget.leftIcon),
          ),

          Container(

              decoration: const BoxDecoration(
                  color: Colors.white,
                shape: BoxShape.circle
              ),
              child: const CircleAvatar(
                radius: 40,

                  backgroundImage: AssetImage("assets/images/arazo.jpg",)),),
          _buildIcon(widget.rightIcon)

        ],
      ),
    );

  }

  Widget _buildIcon(IconData icon) {
    return Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ksecColor,
            ),
            child: Icon(icon),
          );
  }
}
