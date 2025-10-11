import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:granio_flutter/app/models/logged_user_model.dart';
import 'package:granio_flutter/pages/home/home_controller.dart';
import 'package:granio_flutter/pages/home/home_page.dart';

class HomeRouter {
  final LoggedUserModel loggedUserModel;
  HomeRouter({
    required this.loggedUserModel,
  });

  Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => HomeController(),
          ),
        ],
        child: HomePage(loggedUserModel: loggedUserModel),
      );
}
