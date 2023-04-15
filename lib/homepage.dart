import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Auros - Printer'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/printing-company-logo-design-with-printer-graphics-colorful-chart-lines-illustration_567637-333.jpg?w=2000",
                    width: 150,
                  ),
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
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {}
                    },
                    child: Text("Imprimir"))
              ],
            ),
          ),
        ));
  }
}
