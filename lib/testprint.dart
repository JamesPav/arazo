import 'printerenum.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';


class TestPrint {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;



  sample() async {

    bluetooth.isConnected.then((isConnected) {
      if (isConnected == true) {
        bluetooth.printNewLine();
        bluetooth.printCustom("ΕΛ ΚΑΜΙΝΩ", Size.extraLarge.val, Align.center.val,charset: "greek");
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printCustom("================================", Size.bold.val, Align.left.val,charset: "Greek");
        // bluetooth.printLeftRight(mode!,arithmos!.toString(), 3, charset: "Greek");
        bluetooth.printCustom("================================", Size.bold.val, Align.left.val,charset: "Greek");
        bluetooth.printNewLine();
        bluetooth.printNewLine();

        // for(var i = 0;i< list!.length;i++){
        //   final key = list![i][0].keys.elementAt(0);
        //   final value = list![i][0][key];
        //   // bluetooth.printLeftRight("${list![i][0].keys.first}x${posotita![i].toString()}","ΤΙΜΗ: ${singleItemPrices![i].toStringAsFixed(2)}x${posotita![i].toString()}", 2,charset: "Greek",);
        //   bluetooth.printCustom("${posotita![i].toString()}x${list![i][0].keys.first}", 4, Align.left.val,charset: "Greek");
        //   bluetooth.printCustom("${ingredients![i]}", 2,Align.left.val,charset: "Greek");
        //   // bluetooth.printCustom("ΤΙΜΗ: ${singleItemPrices![i].toStringAsFixed(2)}x${posotita![i].toString()}", 2, Align.right.val,charset: "Greek");
        //   // bluetooth.printNewLine();
        //   bluetooth.printCustom("================================", Size.bold.val, Align.left.val,charset: "Greek");
        //
        // }

        // bluetooth.printNewLine();
        bluetooth.printCustom("ΣΧΟΛΙΑ", 2, Align.left.val,charset: "Greek");
        // bluetooth.printCustom("${sxolia}", 2, Align.left.val,charset: "Greek");
        // bluetooth.printNewLine();
        // bluetooth.printNewLine();
        // bluetooth.printCustom("ΣΥΝΟΛΟ: ${sum!.toStringAsFixed(2)}", Size.boldMedium.val, Align.center.val,charset: "Greek");
        // bluetooth.printLeftRight(list![0][0].keys.first, "RIGHT", Size.bold.val);
        // bluetooth.printLeftRight("KALISPERA", "RIGHT", Size.bold.val,
        format:
        // "%-15s %15s %n"); //15 is number off character from left or right
        // bluetooth.printNewLine();
        // bluetooth.printLeftRight("LEFT", "RIGHT", Size.boldMedium.val);
        // bluetooth.printLeftRight("LEFT", "RIGHT", Size.boldLarge.val);
        // bluetooth.printLeftRight("LEFT", "RIGHT", Size.extraLarge.val);
        // bluetooth.printNewLine();
        // bluetooth.print3Column("Col1", "Col2", "Col3", Size.bold.val);
        // bluetooth.print3Column("Col1", "Col2", "Col3", Size.bold.val,
        format:
        // "%-10s %10s %10s %n"); //10 is number off character from left center and right
        // bluetooth.printNewLine();
        // bluetooth.print4Column("Col1", "Col2", "Col3", "Col4", Size.bold.val);
        // bluetooth.print4Column("Col1", "Col2", "Col3", "Col4", Size.bold.val,
        //     format: "%-8s %7s %7s %7s %n");
        // bluetooth.printNewLine();
        // bluetooth.printCustom("EUXARISTOUME", Size.bold.val, Align.center.val,);
        // bluetooth.printLeftRight("Številka:", "18000001", Size.bold.val,);
        // bluetooth.printCustom("Body left", Size.bold.val, Align.left.val);
        // bluetooth.printCustom("Body right", Size.medium.val, Align.right.val);

        bluetooth.printNewLine();
        bluetooth.printCustom("ΕΥΧΑΡΙΣΤΟΥΜΕ", Size.bold.val, Align.center.val,charset: "Greek");

        bluetooth.printNewLine();
        bluetooth.printQRcode(
            "Insert Your Own Text to Generate", 200, 200, Align.center.val);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth
            .paperCut(); //some printer not supported (sometime making image not centered)
        //bluetooth.drawerPin2(); // or you can use bluetooth.drawerPin5();
      }
    });
  }

//   sample(String pathImage) async {
//     //SIZE
//     // 0- normal size text
//     // 1- only bold text
//     // 2- bold with medium text
//     // 3- bold with large text
//     //ALIGN
//     // 0- ESC_ALIGN_LEFT
//     // 1- ESC_ALIGN_CENTER
//     // 2- ESC_ALIGN_RIGHT
//
// //     var response = await http.get("IMAGE_URL");
// //     Uint8List bytes = response.bodyBytes;
//     bluetooth.isConnected.then((isConnected) {
//       if (isConnected == true) {
//         bluetooth.printNewLine();
//         bluetooth.printCustom("HEADER", 3, 1);
//         bluetooth.printNewLine();
//         bluetooth.printImage(pathImage); //path of your image/logo
//         bluetooth.printNewLine();
// //      bluetooth.printImageBytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
//         bluetooth.printLeftRight("LEFT", "RIGHT", 0);
//         bluetooth.printLeftRight("LEFT", "RIGHT", 1);
//         bluetooth.printLeftRight("LEFT", "RIGHT", 1, format: "%-15s %15s %n");
//         bluetooth.printNewLine();
//         bluetooth.printLeftRight("LEFT", "RIGHT", 2);
//         bluetooth.printLeftRight("LEFT", "RIGHT", 3);
//         bluetooth.printLeftRight("LEFT", "RIGHT", 4);
//         bluetooth.printNewLine();
//         bluetooth.print3Column("Col1", "Col2", "Col3", 1);
//         bluetooth.print3Column("Col1", "Col2", "Col3", 1,
//             format: "%-10s %10s %10s %n");
//         bluetooth.printNewLine();
//         bluetooth.print4Column("Col1", "Col2", "Col3", "Col4", 1);
//         bluetooth.print4Column("Col1", "Col2", "Col3", "Col4", 1,
//             format: "%-8s %7s %7s %7s %n");
//         bluetooth.printNewLine();
//         String testString = " čĆžŽšŠ-H-ščđ";
//         bluetooth.printCustom(testString, 1, 1, charset: "windows-1250");
//         bluetooth.printLeftRight("Številka:", "18000001", 1,
//             charset: "windows-1250");
//         bluetooth.printCustom("Body left", 1, 0);
//         bluetooth.printCustom("Body right", 0, 2);
//         bluetooth.printNewLine();
//         bluetooth.printCustom("Thank You", 2, 1);
//         bluetooth.printNewLine();
//         bluetooth.printQRcode("Insert Your Own Text to Generate", 200, 200, 1);
//         bluetooth.printNewLine();
//         bluetooth.printNewLine();
//         bluetooth.paperCut();
//       }
//     });
//   }
}