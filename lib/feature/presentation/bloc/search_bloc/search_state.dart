import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_api/feature/domain/entities/person_entity.dart';

abstract class PersonSearchState extends Equatable {
  const PersonSearchState();

  @override
  List<Object?> get props => [];
}

class PersonSearchEmptyState extends PersonSearchState {}

class PersonSearchLoadingState extends PersonSearchState {}

class PersonSearchLoadedState extends PersonSearchState {
  final List<PersonEntity> persons;

  const PersonSearchLoadedState({required this.persons});

  @override
  List<Object?> get props => [persons];
}

class PersonSearchErrorState extends PersonSearchState {
  final String message;

  const PersonSearchErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
