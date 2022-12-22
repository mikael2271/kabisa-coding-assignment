import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/quote.dart';

import '../../../core/constants/enums.dart';
import '../../../core/exceptions/http_exception.dart';
import '../../../data/repositories/quotes_repository.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuotesRepository _quotesRepository;

  QuoteBloc(this._quotesRepository) : super(QuoteInitial()) {
    on<InitState>(_initState);
    on<RateQuote>(_onRateQuote);
  }

  /// Executed on opening
  /// if there isn't any quotes, it ask to api
  /// if there is quotes it sets to a list and shuffle

  void _initState(InitState event, Emitter<QuoteState> emit) async {
    List<Quote> listQuotes = [];
    try {
      listQuotes = await _quotesRepository.getQuotes();
      if (listQuotes.isEmpty) {
        await _quotesRepository.getQuotesFromApi();
        listQuotes = await _quotesRepository.getQuotes();
      }
    } on ServerFailure {
      emit(state.copyWith(
          submissionState: SubmissionState.submissionServerError));
    } catch (_) {
      emit(state.copyWith(submissionState: SubmissionState.submissionFailure));
    }

    listQuotes.shuffle();

    emit(
      state.copyWith(
        listQuotes: listQuotes,
      ),
    );
  }

  /// Update Locally a quote, to rate and un-rate

  void _onRateQuote(RateQuote event, Emitter<QuoteState> emit) async {
    emit(state.copyWith(submissionState: SubmissionState.submissionInProgress));
    Quote newQuote = event.quote;
    newQuote.rate = !newQuote.rate;

    List<Quote> listQuotes = state.listQuotes;

    listQuotes[listQuotes.indexWhere((element) => element.id == newQuote.id)]
        .rate = newQuote.rate;

    await _quotesRepository.putQuote(newQuote);
    emit(state.copyWith(
      submissionState: SubmissionState.submissionSuccess,
      listQuotes: listQuotes,
    ));
  }
}
