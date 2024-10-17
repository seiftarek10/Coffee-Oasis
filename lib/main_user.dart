import 'package:coffee_oasis/coffee_oasis.dart';
import 'package:coffee_oasis/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CoffeeOasis(
    flavor: Flavor.user,
  ));
}
