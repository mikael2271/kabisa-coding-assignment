part of 'quote_bloc.dart';

class QuoteState extends Equatable {
  const QuoteState({
    this.submissionState = SubmissionState.empty,
    this.listQuotes = const [],
  });

  final SubmissionState submissionState;
  final List<Quote> listQuotes;

  @override
  List<Object?> get props => [
        submissionState,
        listQuotes,
      ];

  QuoteState copyWith({
    SubmissionState? submissionState,
    List<Quote>? listQuotes,
  }) {
    return QuoteState(
      submissionState: submissionState ?? this.submissionState,
      listQuotes: listQuotes ?? this.listQuotes,
    );
  }
}

class QuoteInitial extends QuoteState {}
