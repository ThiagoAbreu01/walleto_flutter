import 'package:walleto_flutter/app/core/config/env/env.dart';
import 'package:flutter/material.dart';
import 'package:walleto_flutter/app/walleto_flutter/walleto_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Env.i.load();
  
  runApp(const WalletoFlutter());
}
