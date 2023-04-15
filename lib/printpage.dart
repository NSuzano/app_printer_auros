import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';

class PrintPage extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  PrintPage(this.data);

  @override
  State<PrintPage> createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  BluetoothPrint blutoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> _devices = [];
  String deviceMsg = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initPrinter();
    });
  }

  Future<void> initPrinter() async {
    blutoothPrint.startScan(timeout: Duration(seconds: 2));

    if (!mounted) return;
    blutoothPrint.scanResults.listen((event) {
      if (!mounted) return;
      setState(() {
        _devices = event;
      });

      if (_devices.isEmpty)
        setState(() {
          deviceMsg = "No Devices";
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecione o equipamento"),
        backgroundColor: Colors.redAccent,
      ),
      body: _devices.isEmpty
          ? Center(
              child: Text(deviceMsg),
            )
          : ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (context, index) {
                ListTile(
                  leading: Icon(Icons.print),
                  title: Text("${_devices[index].name}"),
                  subtitle: Text("${_devices[index].address}"),
                  onTap: () {
                    _startPrint(_devices[index]);
                  },
                );
              }),
    );
  }

  Future<void> _startPrint(BluetoothDevice device) async {
    if (device != null && device.address != null) {
      await blutoothPrint.connect(device);

      Map<String, dynamic> config = Map();

      List<LineText> list = [];

      list.add(LineText(
          type: LineText.TYPE_TEXT,
          content: 'Print Auros User',
          weight: 2,
          width: 2,
          height: 2,
          align: LineText.ALIGN_CENTER,
          linefeed: 1));

      list.add(LineText(
          type: LineText.TYPE_TEXT,
          content: widget.data[0]['nome'],
          weight: 0,
          align: LineText.ALIGN_CENTER,
          linefeed: 1));

      list.add(LineText(
          type: LineText.TYPE_TEXT,
          content: widget.data[0]['email'],
          weight: 0,
          align: LineText.ALIGN_CENTER,
          linefeed: 1));

      list.add(LineText(
          type: LineText.TYPE_TEXT,
          content: widget.data[0]['cpf'],
          weight: 0,
          align: LineText.ALIGN_CENTER,
          linefeed: 1));
    }
  }
}
