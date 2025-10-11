import 'package:granio_flutter/app/core/config/env/env.dart';
import 'package:flutter/material.dart';
import 'package:granio_flutter/app/granio_flutter/granio_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Env.i.load();
  
  runApp(const GranioFlutter());
}
