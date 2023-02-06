import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:rick_and_morty_api/feature/presentation/bloc/search_bloc/search_state.dart';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPersonEvent searchPersonEvent;
  PersonSearchBloc({required this.searchPersonEvent})
      : super(PersonEmptyState());

  Stream<PersonSearchState> mapEventToState(PersonSearchEvent event) async* {}
}
