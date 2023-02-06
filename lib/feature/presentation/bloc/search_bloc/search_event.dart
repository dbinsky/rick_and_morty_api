import 'package:equatable/equatable.dart';

abstract class PersonSearchEvent extends Equatable {
  PersonSearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchPersonEvent extends PersonSearchEvent {
  final String personQuery;

  SearchPersonEvent({required this.personQuery});

  @override
  List<Object?> get props => [];
}
