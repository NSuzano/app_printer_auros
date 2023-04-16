import 'package:auros_printer/printpage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:brasil_fields/brasil_fields.dart';

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
  final _dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Arus Blutooth Printer'),
          centerTitle: true,
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
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Image.asset(
                        "assets/images/aurus.jpg",
                        width: 150,
                      ),
                    ),
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
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DataInputFormatter(),
                    ],
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Digite o Data";
                      }
                      return null;
                    },
                    controller: _dataController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Data de Nascimento",
                        prefixIcon: Icon(Icons.view_timeline_outlined)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Digite o Email";
                      } else if (EmailValidator.validate(text) == false) {
                        return "Digite um email válido";
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
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    validator: (text) {
                      // final RegExp numberRegExp =
                      //     RegExp(r'^\d{3}\x2E\d{3}\x2E\d{3}\x2D\d{2}$');
                      // bool isCpf = numberRegExp.hasMatch(text!);
                      bool isCpf = CPFValidator.isValid(text);

                      if (text == null || text.isEmpty) {
                        return "Digite o CPF";
                      } else if (isCpf == false) {
                        return "Digite um cpf válido";
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
                          backgroundColor: Colors.black12,
                          padding: EdgeInsets.symmetric(
                              horizontal: 70, vertical: 20)),
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          data = [
                            {
                              "nome": _nomeController.text,
                              "email": _emailController.text,
                              "cpf": _cpfController.text,
                              "data": _dataController.text
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
