import 'package:arazo/widgets/table_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:arazo/widgets/custom_appbar.dart';
import 'package:arazo/widgets/table_list.dart';

import 'colors.dart';
import 'menu_screen.dart';
import 'models/cart_model.dart';
import 'models/pizza.dart';
import 'models/table.dart';


class TablesScreen extends StatefulWidget {
  const TablesScreen({Key? key}) : super(key: key);

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> with AutomaticKeepAliveClientMixin {


  @override
  bool get wantKeepAlive => true;
  final table = Trapezi.generateTrapezi();

  var selected = 0;

  final ZoomDrawerController z = ZoomDrawerController();
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    super.build(context);


    final dataList = Provider.of<CartModel>(context);
    final pizzaList = CatalogItem.generateCatalogItemList();

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
          body: Column(
            children: [
              CustomAppBar(leftIcon: Icons.menu, rightIcon: Icons.person,leftCallback: (){z.toggle!();}),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 35),
                child: Row(
                  children: const [
                    Text(
                      'Τραπέζια',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kBackGround),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
               TableList(selected: selected,callback: (int index) {
                setState(() {
                  selected = index;
                });
                if (pageController.hasClients) {
                  pageController.jumpToPage(index);
                }
              }),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child: TableListView(selected: selected,callback: (int index) {
                  setState(() {
                    selected = index;
                  });
                }, pageController: pageController, table: table,),
              )
            ],
          ),

        ),
      menuScreen: MenuScreen(callback: (){z.toggle!();}),
    );
  }
}
