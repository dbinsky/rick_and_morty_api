import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty_api/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:rick_and_morty_api/feature/presentation/bloc/person_list_cubit/person_list_state.dart';
import 'package:rick_and_morty_api/feature/presentation/widgets/person_card_widget.dart';

class PersonsListWidget extends StatelessWidget {
  const PersonsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonListCubit, PersonListState>(
      builder: (BuildContext context, state) {
        List<PersonEntity> persons = [];
        if (state is PersonListLoadingState && state.isFirstFetch) {
          return _loadingIndicator();
        } else if (state is PersonListLoadedState) {
          persons = state.personsList;
        } else if (state is PersonListErrorState) {
          return Text(
            state.message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return PersonCardWidget(person: persons[index]);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey[400],
            );
          },
          itemCount: persons.length,
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
