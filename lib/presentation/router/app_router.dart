import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../behaviours/no_animation_material_behaviour.dart';
import '../screens/main_page.dart';
import '../screens/navbar/custom_navbar.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                AppLocalizations.of(context).pageNotFound,
              ),
            ),
          ),
        );
      case '/mainpage':
        return NoAnimationMaterialPageRoute(
          settings: routeSettings,
          builder: (_) => MainPage(),
        );
      case '/navbarpage':
        return NoAnimationMaterialPageRoute(
          settings: routeSettings,
          builder: (_) => NavbarPage(),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                AppLocalizations.of(context).pageNotFound,
              ),
            ),
          ),
        );
    }
  }
}
