import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/common/app_colors.dart';
import 'package:rick_and_morty_api/feature/domain/entities/person_entity.dart';
import 'package:rick_and_morty_api/feature/presentation/widgets/person_cache_image_widget.dart';
import 'package:rick_and_morty_api/generated/l10n.dart';

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
          SizedBox(
            child: PersonCacheImageWidget(
              imageUrl: person.image,
              imageHight: 166,
              imageWidth: 166,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  person.name,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: person.status == 'Alive'
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${person.status} - ${person.species}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  S.of(context).person_location,
                  style: const TextStyle(
                    color: AppColors.greyColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${person.location?.name}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Text(
                  S.of(context).origin,
                  style: const TextStyle(color: AppColors.greyColor),
                ),
                const SizedBox(height: 4),
                Text(
                  '${person.origin?.name}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
