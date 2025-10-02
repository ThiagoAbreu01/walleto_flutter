import 'package:walleto_flutter/app/core/local_storage/secure_storage/secure_local_storage.dart';
import 'package:walleto_flutter/app/core/logger/logger.dart';
import 'package:walleto_flutter/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => SecureLocalStorage()),
        Provider(
          create: (context) => Logger(),
        ),
        Provider(
          create: (context) => DioRestClient(
            log: context.read(),
            secureLocalStorage: context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
