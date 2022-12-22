enum RulesValidationError {
  empty,
  invalid,
} //input rules

enum SubmissionState {
  empty,
  pure,
  valid,
  invalid,
  custom,
  submissionInProgress,
  submissionSuccess,
  submissionFailure,
  submissionServerError
} //errors from api

enum SnackbarType {
  error,
  success,
}
