part of 'locator_bloc.dart';

class LocatorState extends Equatable {
  const LocatorState({
    this.submissionState = SubmissionState.empty,
    this.error,
    this.distance,
  });

  final SubmissionState submissionState;
  final String? error;
  final String? distance;

  @override
  List<Object?> get props => [
        submissionState,
        error,
        distance,
      ];

  LocatorState copyWith({
    SubmissionState? submissionState,
    String? error,
    String? distance,
  }) {
    return LocatorState(
      submissionState: submissionState ?? this.submissionState,
      error: error ?? this.error,
      distance: distance ?? this.distance,
    );
  }
}

class LocatorInitial extends LocatorState {}
