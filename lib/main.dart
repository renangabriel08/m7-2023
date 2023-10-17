import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:m7/firebase_options.dart';
import 'package:m7/pages/avaliacao_local.dart';
import 'package:m7/pages/lista.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/avaliacao': (context) => const Avaliacao(),
        '/lista': (context) => const Lista(),
      },
      initialRoute: '/avaliacao',
    );
  }
}
