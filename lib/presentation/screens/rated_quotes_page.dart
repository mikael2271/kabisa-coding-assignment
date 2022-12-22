import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/constants/enums.dart';
import '../../logic/bloc/quote/quote_bloc.dart';
import '../themes/light_theme.dart';
import '../widgets/quote.dart';

class RatedQuotesPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => RatedQuotesPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList[ColorsEnum.veryLightGreen],
      body: SafeArea(
        child: SingleChildScrollView(
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
                    AppLocalizations.of(context).likedQuotes,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: BlocBuilder<QuoteBloc, QuoteState>(
                  buildWhen: (previous, current) =>
                      previous.submissionState ==
                          SubmissionState.submissionInProgress ||
                      previous.listQuotes != current.listQuotes,
                  builder: (context, state) {
                    return state.listQuotes
                            .where((element) => element.rate)
                            .isNotEmpty
                        ? ListView.separated(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.listQuotes
                                .where((element) => element.rate)
                                .length,
                            itemBuilder: (ctx, i) => QuoteWidget(
                              state.listQuotes
                                  .where((element) => element.rate)
                                  .elementAt(i),
                            ),
                            separatorBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.only(top: 10)),
                          )
                        : Text(
                            AppLocalizations.of(context).noRatedQuotes,
                            style: TextStyle(
                              fontFamily: FontFamilyList['Montserrat'],
                              fontWeight: FontWeightList['semibold'],
                              fontSize: 18,
                              color: ColorList[ColorsEnum.white],
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
