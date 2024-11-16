import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/set_up_hive.dart';
import 'package:coffee_oasis/Core/Services/bloc_observer.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';

import 'package:coffee_oasis/coffee_oasis.dart';
import 'package:coffee_oasis/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  await HiveSetup.setupOwnerHive();
  runApp(const CoffeeOasis(flavor: Flavor.owner));
  Bloc.observer = MyBlocObserver();
}
