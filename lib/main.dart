import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/data/repositories/quotes_repository.dart';

import 'logic/bloc/locator/locator_bloc.dart';
import 'logic/bloc/quote/quote_bloc.dart';
import 'presentation/router/app_router.dart';
import 'presentation/themes/light_theme.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuoteBloc>(
          lazy: false,
          create: (context) =>
              QuoteBloc(QuotesRepository())..add(const InitState()),
        ),
        BlocProvider<LocatorBloc>(
          lazy: false,
          create: (context) => LocatorBloc()..add(const CalculateDistance()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: LightTheme,
        darkTheme: LightTheme,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('pt', ''),
        ],
        initialRoute: "/navbarpage",
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
