part of 'quote_bloc.dart';

abstract class QuoteEvent extends Equatable {
  const QuoteEvent();

  @override
  List<Object> get props => [];
}

class InitState extends QuoteEvent {
  const InitState();
}

class RateQuote extends QuoteEvent {
  const RateQuote(this.quote);

  final Quote quote;

  @override
  List<Object> get props => [quote];
}
