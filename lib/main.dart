import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_latest/provider/auth_provider.dart';
import 'package:newsapp_latest/screens/welcome_screen.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
        title: "FlutterPhoneAuth",
      ),
    );
  }
}
