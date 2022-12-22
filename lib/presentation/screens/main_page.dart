import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/constants/enums.dart';
import '../../logic/bloc/quote/quote_bloc.dart';
import '../themes/light_theme.dart';
import '../widgets/distance_to_office.dart';
import '../widgets/quote.dart';

class MainPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => MainPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList[ColorsEnum.veryLightGreen],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: ColorList[ColorsEnum.lightGreen],
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context).funQuote,
                  style: TextStyle(
                    fontFamily: FontFamilyList['Montserrat'],
                    fontWeight: FontWeightList['bold'],
                    fontSize: 28,
                    color: ColorList[ColorsEnum.white],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: DistanceToOffice(),
            ),
            BlocBuilder<QuoteBloc, QuoteState>(
              buildWhen: (previous, current) =>
                  previous.listQuotes != current.listQuotes ||
                  previous.submissionState ==
                      SubmissionState.submissionInProgress,
              builder: (context, state) {
                return CarouselSlider(
                  options: CarouselOptions(
                    height: 290,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 15),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: state.listQuotes.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return QuoteWidget(i);
                      },
                    );
                  }).toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
