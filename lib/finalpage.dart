import 'package:auros_printer/homepage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  _launchURL() async {
    const url = 'https://github.com/NSuzano?tab=repositories';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados Imprimidos"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                _launchURL();
              },
              child: Text("https://github.com/NSuzano?tab=repositories")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Text("Voltar"))
        ],
      ),
    );
  }
}
