import 'dart:developer';
import 'package:ddd_firebase/presentation/core/const/all_library.dart';
import '../../../application/home_bloc/home_bloc.dart';
import '../../../domain/entity/data/animal_model.dart';
import '../../../infrastructure/repository_implementation/app_repository_implementation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController animalController = TextEditingController();
  List<AnimalModel> animalList = [];

  Future<void> findAnimal({required String name}) async {
    final list = await AppRepositoryImplementation().getAnimalInfo(name: name);

    if (list.isNotEmpty) {
      setState(() {
        animalList = list;
      });
    } else {
      print("Animal list Empty");
    }
  }

  @override
  void dispose() {
    animalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.appTheme.primary,
        title: CustomTextWidget(context.localized.home, color: context.appTheme.secondary),
        bottom: PreferredSize(preferredSize: MediaQuery.sizeOf(context) * 0.02, child: Divider(color: context.appTheme.surface)),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView(
              children: [
                TextFieldWidget(
                  controller: animalController,
                  labelText: " Write Animal Name ",
                  borderColor: context.appTheme.surface,
                ),
                ...List.generate(
                  animalList.length,
                  (index) {
                    final animal = animalList[index];
                    return AnimalItem(animal: animal);
                  },
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send, color: context.appTheme.surface),
        backgroundColor: context.appTheme.outline,
        onPressed: () async {
          if (animalController.text.isNotEmpty) {
            await findAnimal(name: animalController.text);
          } else {
            log("controller is Empty try again");
          }
        },
      ),
    );
  }
}

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

