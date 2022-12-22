import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/quote.dart';
import '../../logic/bloc/quote/quote_bloc.dart';
import '../themes/light_theme.dart';

class QuoteWidget extends StatelessWidget {
  Quote _quote;

  QuoteWidget(this._quote);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorList[ColorsEnum.lightGreen],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              _quote.author,
              style: TextStyle(
                fontFamily: FontFamilyList['Montserrat'],
                fontWeight: FontWeightList['bold'],
                fontSize: 16,
                color: ColorList[ColorsEnum.white],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              _quote.quote,
              style: TextStyle(
                fontFamily: FontFamilyList['Montserrat'],
                fontWeight: FontWeightList['semibold'],
                fontSize: 12,
                color: ColorList[ColorsEnum.white],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            GestureDetector(
              onTap: () {
                context.read<QuoteBloc>().add(RateQuote(_quote));
              },
              child: Icon(
                _quote.rate ? Icons.favorite : Icons.favorite_outline,
                color: ColorList[ColorsEnum.white],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
          ],
        ),
      ),
    );
  }
}
