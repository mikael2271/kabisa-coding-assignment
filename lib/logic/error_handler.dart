import 'package:flutter/material.dart';

import '../core/constants/enums.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///Get error text translated

String getStateError(
    BuildContext context, SubmissionState status, String? error) {
  switch (status) {
    case SubmissionState.pure:
      return AppLocalizations.of(context).fieldsRequired;

    case SubmissionState.invalid:
      return AppLocalizations.of(context).fieldsInvalid;

    case SubmissionState.submissionFailure:
      return AppLocalizations.of(context).fieldsIncorrect;

    case SubmissionState.submissionServerError:
      return AppLocalizations.of(context).serverError;

    case SubmissionState.custom:
      return getDynamicTranslations(context, error);
    default:
      return AppLocalizations.of(context).defaultError;
  }
}

///Custom error

String getDynamicTranslations(BuildContext context, String? error) {
  switch (error) {
    case "locationServicesDisable":
      return AppLocalizations.of(context).locationServicesDisable;
    case "locationServicesDenied":
      return AppLocalizations.of(context).locationServicesDenied;
    case "locationServicesPermanentlyDenied":
      return AppLocalizations.of(context).locationServicesPermanentlyDenied;
    default:
      return AppLocalizations.of(context).defaultError;
  }
}
