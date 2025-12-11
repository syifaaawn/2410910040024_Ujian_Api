import 'package:flutter/material.dart';
import 'package:syifawahyuningsih_2410910040024_ujian_api/pages/registrasi_page.dart';
import 'package:syifawahyuningsih_2410910040024_ujian_api/pages/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      routes: {
        "/":(context)=>RegistrasiPage(),
       "/todos":(context)=>TodosPage(),
      },
      initialRoute: "/",
    );
  }
}
