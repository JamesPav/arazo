import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:arazo/tables.dart';

import 'colors.dart';

class MenuScreen extends StatelessWidget {
  final Function callback;
  final ZoomDrawerController? z;

  const MenuScreen({Key? key, required this.callback, this.z}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: kbuttonColord,
        body: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      callback();
                    },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Νέα Παραγγελία',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TablesScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Τραπέζια',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Ιστορικό',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
