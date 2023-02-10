import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/common/app_colors.dart';
import 'package:rick_and_morty_api/feature/domain/entities/person_entity.dart';

class PersonCardWidget extends StatelessWidget {
  final PersonEntity person;
  const PersonCardWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cellBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            child: Image.network(person.image),
          ),
        ],
      ),
    );
  }
}
