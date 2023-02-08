import 'package:equatable/equatable.dart';

abstract class PersonSearchEvent extends Equatable {
  const PersonSearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchPersonEvent extends PersonSearchEvent {
  final String personQuery;

  const SearchPersonEvent({required this.personQuery});

  @override
  List<Object?> get props => [];
}
