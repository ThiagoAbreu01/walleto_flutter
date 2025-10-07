import 'package:flutter/material.dart';
import 'package:walleto_flutter/app/core/ui/extensions/size_screen_extension.dart';
import 'package:walleto_flutter/app/core/ui/extensions/theme_extension.dart';
import 'package:walleto_flutter/app/models/logged_user_model.dart';

class HomePage extends StatefulWidget {
  final LoggedUserModel loggedUserModel;

  const HomePage({
    super.key,
    required this.loggedUserModel,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        color: context.primaryColor,
      ),
    );
  }
}
