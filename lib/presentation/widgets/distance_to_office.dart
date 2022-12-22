import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/constants/enums.dart';
import '../../logic/bloc/locator/locator_bloc.dart';
import '../../logic/error_handler.dart';
import '../themes/light_theme.dart';
import 'general/custom_snackbar.dart';

class DistanceToOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocatorBloc, LocatorState>(
      listenWhen: (previous, current) =>
          previous.submissionState == SubmissionState.submissionInProgress,
      listener: (context, state) {
        CustomSnackbar.buildCustomSnackbar(
          context,
          SnackbarType.error,
          getStateError(context, state.submissionState, state.error),
        );
      },
      buildWhen: (previous, current) =>
          previous.distance != current.distance ||
          previous.error != current.error,
      builder: (context, state) {
        return state.distance != null
            ? Row(
                children: [
                  Text(
                    AppLocalizations.of(context).youAre,
                    style: TextStyle(
                      fontFamily: FontFamilyList['Montserrat'],
                      fontWeight: FontWeightList['semibold'],
                      fontSize: 12,
                      color: ColorList[ColorsEnum.white],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorList[ColorsEnum.lightGreen],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: BlocBuilder<LocatorBloc, LocatorState>(
                        buildWhen: (previous, current) =>
                            previous.distance != current.distance,
                        builder: (context, state) {
                          return Text(
                            state.distance ?? '',
                            style: TextStyle(
                              fontFamily: FontFamilyList['Montserrat'],
                              fontWeight: FontWeightList['bold'],
                              fontSize: 14,
                              color: ColorList[ColorsEnum.white],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).distanceToOffice,
                    style: TextStyle(
                      fontFamily: FontFamilyList['Montserrat'],
                      fontWeight: FontWeightList['semibold'],
                      fontSize: 12,
                      color: ColorList[ColorsEnum.white],
                    ),
                  ),
                ],
              )
            : Text(
                getStateError(context, SubmissionState.custom, state.error),
                style: TextStyle(
                  fontFamily: FontFamilyList['Montserrat'],
                  fontWeight: FontWeightList['semibold'],
                  fontSize: 12,
                  color: ColorList[ColorsEnum.white],
                ),
              );
      },
    );
  }
}
