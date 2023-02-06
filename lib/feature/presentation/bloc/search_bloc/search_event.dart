import 'package:equatable/equatable.dart';

abstract class PersonSearchEvent extends Equatable {
  PersonSearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchPerson extends PersonSearchEvent {
  final String personQuery;

  SearchPerson({required this.personQuery});

  @override
  List<Object?> get props => [];
}
