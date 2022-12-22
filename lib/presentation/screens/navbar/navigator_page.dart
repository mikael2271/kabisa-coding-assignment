import 'package:flutter/material.dart';

import '../../behaviours/no_animation_material_behaviour.dart';

class NavigatorPage extends StatefulWidget {
  NavigatorPage({required this.navigatorKey, required this.child});

  final Widget child;
  final GlobalKey navigatorKey;

  @override
  NavigatorPageState createState() => NavigatorPageState();
}

class NavigatorPageState extends State<NavigatorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return NoAnimationMaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return widget.child;
          },
        );
      },
    );
  }
}
