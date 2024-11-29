

import 'package:ddd_firebase/presentation/core/const/all_library.dart';

import '../../../domain/entity/data/animal_model.dart';

class AnimalItem extends StatelessWidget {
  const AnimalItem({super.key, required this.animal});

  final AnimalModel animal;

  // Helper function to truncate strings
  String _truncate(String? value, int maxLength) {
    return (value?.length ?? 0) > maxLength
        ? value!.substring(0, maxLength)
        : value ?? "-";
  }

  @override
  Widget build(BuildContext context) {
    final name = _truncate(animal.name, 15);
    final type = _truncate(animal.taxonomy?.taxonomyClass, 15);
    final genus = _truncate(animal.taxonomy?.genus, 15);
    final lifeSpan = _truncate(animal.characteristics?.lifespan, 10);
    final speed = _truncate(animal.characteristics?.topSpeed, 15);
    final weight = _truncate(animal.characteristics?.weight, 15);
    final height = _truncate(animal.characteristics?.height, 15);
    final locations = animal.locations ?? [];

    final details = [
      {"label": "Name", "value": name},
      {"label": "Type", "value": type},
      {"label": "Genus", "value": genus},
      {"label": "Life Span", "value": lifeSpan},
      {"label": "Speed", "value": speed},
      {"label": "Weight", "value": weight},
      {"label": "Height", "value": height},
    ];

    return Card(
      color: context.appTheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var detail in details) ...[
              _buildDetailRow(detail["label"]!, detail["value"]!),
              const Divider(),
            ],
            const CustomTextWidget("Location: ", color: Colors.cyan),
            Wrap(
              children: locations
                  .map((location) => CustomTextWidget(
                " $location ",
                color: Colors.deepOrange,
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      children: [
        CustomTextWidget(
          "$label: ",
          color: Colors.cyan,
          fontWeight: FontWeight.bold,
        ),
        CustomTextWidget(value, color: Colors.deepOrange),
      ],
    );
  }
}