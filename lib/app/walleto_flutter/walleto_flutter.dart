import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
// import 'package:asuka/asuka.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walleto_flutter/app/core/helpers/set_screen_mode.dart';
import 'package:walleto_flutter/app/core/provider/application_binding.dart';
import 'package:walleto_flutter/app/core/ui/styles/theme/custom_theme_switcher.dart';
import 'package:walleto_flutter/app/core/ui/widgets/feature_discovery/src/foundation/feature_discovery.dart';
import 'package:walleto_flutter/app/core/ui/widgets/feature_discovery/src/foundation/persistence_provider.dart';
import 'package:walleto_flutter/pages/login/login_router.dart';

class WalletoFlutter extends StatelessWidget {
  const WalletoFlutter({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SetScreenMode.fullScreen();
    return ScreenUtilInit(
      builder: (context, child) {
        return ApplicationBinding(
          child: FeatureDiscovery.withProvider(
            persistenceProvider: const SharedPreferencesProvider(),
            child: ValueListenableBuilder<ThemeData>(
              valueListenable: CustomThemeSwitcher.themeNotifier,
              builder: (_, theme, __) {
                return ThemeProvider(
                  initTheme: CustomThemeSwitcher.themeType,
                  child: MaterialApp(
                    // builder: Asuka.builder,
                    // localizationsDelegates: const [
                    //   GlobalMaterialLocalizations.delegate,
                    //   GlobalCupertinoLocalizations.delegate,
                    //   GlobalWidgetsLocalizations.delegate,
                    // ],
                    // supportedLocales: const [
                    //   Locale('pt', 'BR'), // Portuguese (default)
                    //   Locale('en', 'US'), // English
                    //   Locale('es', 'ES'), // Spanish
                    // ],
                    localeResolutionCallback: (locale, supportedLocales) {
                      for (var supportedLocale in supportedLocales) {
                        if (supportedLocale.languageCode ==
                                locale?.languageCode &&
                            supportedLocale.countryCode ==
                                locale?.countryCode) {
                          return supportedLocale;
                        }
                      }
                      return supportedLocales
                          .first; // Fallback to the default locale.
                    },
                    title: 'Walleto Flutter',
                    theme: theme,
                    debugShowCheckedModeBanner: false,
                    routes: {'/': (context) => LoginRouter.page},
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
