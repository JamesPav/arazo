import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:arazo/colors.dart';

import 'package:arazo/testprint.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arazo/widgets/custom_appbar.dart';



class PrintScreen extends StatefulWidget {


  const PrintScreen({Key? key,}) : super(key: key);

  @override
  State<PrintScreen> createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {

  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  // BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  // List<BluetoothDevice> _devices = [];
  // String _devicesMsg = "";
  // final f = NumberFormat("\$###,###.00", "en_US");

  List<BluetoothDevice> _devices = [];
  BluetoothDevice? _device;
  bool _connected = false;
  TestPrint testPrint = TestPrint();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => { initPrinter()});
  }

  Future<void> initPlatformState() async {

    bool? isConnected = await bluetooth.isConnected;
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {}

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _connected = true;
            print("bluetooth device state: connected");
          });
          break;
        case BlueThermalPrinter.DISCONNECTED:
          setState(() {
            _connected = false;
            print("bluetooth device state: disconnected");
          });
          break;
        case BlueThermalPrinter.STATE_TURNING_OFF:
          setState(() {
            _connected = false;
            print("bluetooth device state: bluetooth turning off");
          });
          break;
        case BlueThermalPrinter.STATE_OFF:
          setState(() {
            _connected = false;
            print("bluetooth device state: bluetooth off");
          });
          break;
        case BlueThermalPrinter.STATE_ON:
          setState(() {
            _connected = false;
            print("bluetooth device state: bluetooth on");
          });
          break;
        case BlueThermalPrinter.STATE_TURNING_ON:
          setState(() {
            _connected = false;
            print("bluetooth device state: bluetooth turning on");
          });
          break;
        case BlueThermalPrinter.ERROR:
          setState(() {
            _connected = false;
            print("bluetooth device state: error");
          });
          break;
        default:
          print(state);
          break;
      }
    });

    if (!mounted) return;
    setState(() {
      _devices = devices;
    });

    if (isConnected == true) {
      setState(() {
        _connected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:kBackGround,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const CustomAppBar(leftIcon:Icons.menu, rightIcon: Icons.person,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(width: 10),
                    const Text(
                      'ΣΥΣΚΕΥΗ:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kbuttonColord,
                      ),

                        child: DropdownButton(

                          dropdownColor: Colors.red,
                          underline: const SizedBox(),
                          style: const TextStyle(color: Colors.white),
                          elevation: 0,
                          borderRadius: BorderRadius.circular(12),

                          items: _getDeviceItems(),
                          onChanged: (BluetoothDevice? value) =>
                              setState(() => _device = value),
                          value: _device,
                        ),
                      ),

                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: kbuttonColord),
                      onPressed: () {
                        initPlatformState();
                      },
                      child: const Text(
                        'ΑΝΑΝΕΩΣΗ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: _connected ? Colors.red : Colors.green),
                      onPressed: _connected ? _disconnect : _connect,
                      child: Text(
                        _connected ? 'ΑΠΟΣΥΝΔΕΣΗ' : 'ΣΥΝΔΕΣΗ',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      backgroundColor: kbuttonColord,padding:const EdgeInsets.symmetric(vertical: 30,horizontal: 70),),
                    onPressed: (){

                      testPrint.sample();
                    },
                    child: const Text('ΕΚΤΥΠΩΣΗ',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        backgroundColor: Colors.white,padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 80)),
                    onPressed: () {

                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                    },
                    child: const Text('ΕΞΟΔΟΣ',
                        style: TextStyle(color: kbuttonColord)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devices.isEmpty) {
      items.add(const DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devices.forEach((device) {
        items.add(DropdownMenuItem(
          value: device,
          child: Text(device.name ?? ""),
        ));
      });
    }
    return items;
  }

  void _connect() {
    if (_device != null) {
      bluetooth.isConnected.then((isConnected) {
        if (isConnected == false) {
          bluetooth.connect(_device!).catchError((error) {
            setState(() => _connected = false);
          });
          setState(() => _connected = true);
        }
      });
    } else {
      show('No device selected.');
    }
  }

  void _disconnect() {
    bluetooth.disconnect();
    setState(() => _connected = false);
  }

  Future show(
      String message, {
        Duration duration = const Duration(seconds: 3),
      }) async {
    await Future.delayed(const Duration(milliseconds: 100));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        duration: duration,
      ),
    );


    // Future<void> initPrinter() async {
    //   bluetoothPrint.startScan(timeout: Duration(seconds: 4));
    //
    //   if(!mounted) return;
    //   bluetoothPrint.scanResults.listen((val) {
    //     if(!mounted) return;
    //     setState(() {
    //       _devices = val;
    //     });
    //     if(_devices.isEmpty){
    //       setState(() {
    //         _devicesMsg = "Δεν υπάρχουν συσκευές!";
    //       });
    //     }
    //   });
    // }

    // @override
    // Widget build(BuildContext context) {
    //   return Scaffold();

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Select Printer"),
    //   ),
    //   body: _devices.isEmpty ? Center(child: Text(_devicesMsg ?? ''),) :
    //       ListView.builder(
    //           itemCount: _devices.length,
    //           itemBuilder: (context, index) {
    //             return ListTile(
    //               leading: Icon(Icons.print),
    //               title: Text(_devices[index].name!),
    //               subtitle: Text(_devices[index].address!),
    //               onTap: (){
    //                 _startPrint(_devices[index]);
    //
    //               },
    //             );
    //           })
    // );
  }

// Future<void> _startPrint(BluetoothDevice device) async {
//     if(device != null && device.address != null){
//       await bluetoothPrint.connect(device);
//
//       Map<String, dynamic> config = Map();
//       List<LineText> list = [];
//
//       list.add(
//         LineText(
//           type: LineText.TYPE_TEXT,
//           content: "La Creperie",
//           weight: 2,
//           width: 2,
//           height: 2,
//           align: LineText.ALIGN_CENTER,
//           linefeed: 1,
//         )
//       );
//
//
//       for(var i =0;i<widget.items!.length;i++ ){
//         list.add(
//           LineText(
//             type: LineText.TYPE_TEXT,
//             content: widget.items![i][0].keys.first,
//             weight: 0,
//             align: LineText.ALIGN_LEFT,
//             linefeed: 1,
//           )
//         );
//
//         list.add(
//           LineText(
//             type: LineText.TYPE_TEXT,
//             content: " x ",
//             weight: 0,
//             align: LineText.ALIGN_LEFT,
//             linefeed: 1,
//           )
//         );
//       }
//
//     }
}


// }
