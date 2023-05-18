import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/main_app.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase_options.dart';

const email = String.fromEnvironment('ADMIN_EMAIL');
const password = String.fromEnvironment('ADMIN_PASSWORD');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

  runApp(const MyApp());
}
