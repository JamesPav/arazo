import 'package:arazo/models/trapezi_item.dart';
import 'package:flutter/material.dart';


class TableItem extends StatefulWidget {
  final TrapeziItem trapezi;
  final void Function()? onPressed;

  const TableItem({Key? key, required this.trapezi, this.onPressed})
      : super(key: key);

  @override
  State<TableItem> createState() => _TableItemState();
}

class _TableItemState extends State<TableItem>
    with AutomaticKeepAliveClientMixin {

  bool isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: (){
        setState(() {
          isChecked = true;

        });
        widget.onPressed!();
      },
      onLongPress: (){
        setState(() {
          isChecked = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            border:
            Border.all(width: 4,color: !isChecked ? Colors.white : Colors.greenAccent,),
            color:  Colors.white,
            shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 50,
            decoration: BoxDecoration(
                color: !isChecked ? Colors.grey : Colors.green,
                shape: BoxShape.circle),
            child: Center(child: Text(widget.trapezi.name,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),)),),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
