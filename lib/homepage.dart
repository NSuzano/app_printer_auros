import 'package:auros_printer/printpage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> data = [];
  final _emailController = TextEditingController();
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Arus - Printer'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.network(
                        "https://media.licdn.com/dms/image/C4E0BAQFggMnGBYkS7g/company-logo_200_200/0/1653325300516?e=2147483647&v=beta&t=_zLBo-tnW_HI5KVfZ-vPMSTinr3ekugliyDOViJul6U",
                        width: 200, loadingBuilder: (BuildContext context,
                            Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                          child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ));
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Digite o Nome";
                      }
                      return null;
                    },
                    controller: _nomeController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nome",
                        prefixIcon: Icon(Icons.person_2)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Digite o Email";
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Digite o CPF";
                      }
                      return null;
                    },
                    controller: _cpfController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "CPF",
                        prefixIcon: Icon(Icons.assignment_ind_sharp)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 70, vertical: 20)),
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          data = [
                            {
                              "nome": _nomeController.text,
                              "email": _emailController.text,
                              "cpf": _cpfController.text
                            }
                          ];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PrintPage(data)));
                        }
                      },
                      child: Text(
                        "Imprimir",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
