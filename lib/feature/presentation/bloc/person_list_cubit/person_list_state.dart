import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_api/feature/domain/entities/person_entity.dart';

abstract class PersonListState extends Equatable {
  const PersonListState();

  @override
  List<Object?> get props => [];
}

class PersonListEmptyState extends PersonListState {
  @override
  List<Object?> get props => [];
}

class PersonListLoadingState extends PersonListState {
  final List<PersonEntity> oldPersonsList;
  final bool isFirstFetch;

  const PersonListLoadingState(this.oldPersonsList,
      {this.isFirstFetch = false});

  @override
  List<Object?> get props => [oldPersonsList];
}

class PersonListLoadedState extends PersonListState {
  final List<PersonEntity> personsList;

  const PersonListLoadedState(this.personsList);

  @override
  List<Object?> get props => [personsList];
}

class PersonErrorState extends PersonListState {
  final String message;

  const PersonErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
