import 'package:flutter/material.dart';

import '../../behaviours/no_animation_material_behaviour.dart';
import '../../themes/light_theme.dart';
import '../main_page.dart';
import '../rated_quotes_page.dart';
import 'navigator_page.dart';

class NavbarPage extends StatefulWidget {
  static Route route() {
    return NoAnimationMaterialPageRoute<void>(builder: (_) => NavbarPage());
  }

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int _pageIndex = 0;

  Map<int, GlobalKey> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
  };

  void onTabTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return !await Navigator.maybePop(
              navigatorKeys[_pageIndex]!.currentState!.context);
        },
        child: IndexedStack(
          index: _pageIndex,
          children: [
            NavigatorPage(
              navigatorKey: navigatorKeys[0]!,
              child: MainPage(),
            ),
            NavigatorPage(
              navigatorKey: navigatorKeys[1]!,
              child: RatedQuotesPage(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 85,
        child: Theme(
          data: ThemeData(
            splashColor: ColorList[ColorsEnum.transparent],
            highlightColor: ColorList[ColorsEnum.transparent],
            canvasColor: ColorList[ColorsEnum.veryLightGreen],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            onTap: onTabTapped,
            currentIndex: _pageIndex,
            selectedFontSize: 0.0,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _pageIndex == 0
                        ? ColorList[ColorsEnum.lightGreen]
                        : ColorList[ColorsEnum.white],
                  ),
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(14),
                  child: Icon(
                    Icons.format_quote,
                    color: _pageIndex == 0
                        ? ColorList[ColorsEnum.white]
                        : ColorList[ColorsEnum.lightGreen],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _pageIndex == 1
                        ? ColorList[ColorsEnum.lightGreen]
                        : ColorList[ColorsEnum.white],
                  ),
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(14),
                  child: Icon(
                    Icons.favorite,
                    color: _pageIndex == 1
                        ? ColorList[ColorsEnum.white]
                        : ColorList[ColorsEnum.lightGreen],
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
