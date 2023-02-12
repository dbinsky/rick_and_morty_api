import 'package:equatable/equatable.dart';

abstract class PersonSearchEvent extends Equatable {
  const PersonSearchEvent();

  @override
  List<Object?> get props => [];
}

class PersonSearchBeginEvent extends PersonSearchEvent {
  final String personQuery;

  const PersonSearchBeginEvent({required this.personQuery});

  @override
  List<Object?> get props => [];
}
