import 'dart:developer';
import 'package:ddd_firebase/presentation/core/const/all_library.dart';
import '../../../application/home_bloc/home_bloc.dart';
import '../../../domain/entity/data/animal_model.dart';
import '../../../infrastructure/repository_implementation/app_repository_implementation.dart';
import '../../core/widgtes/animal_item_home_widget.dart';

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
          // return state.when(
          //   initial: () {
          //     return Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 18.0),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           TextFieldWidget(
          //             controller: animalController,
          //             labelText: " Write Animal Name ",
          //             borderColor: context.appTheme.surface,
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          //   loading: () {
          //     return const Center(child: CircularProgressIndicator());
          //   },
          //   loaded: (items) {
          //     return Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 18.0),
          //       child: ListView(
          //         children: [
          //           TextFieldWidget(
          //             controller: animalController,
          //             labelText: " Write Animal Name ",
          //             borderColor: context.appTheme.surface,
          //           ),
          //           ...List.generate(
          //             items.length,
          //             (index) {
          //               final model = items[index];
          //               return AnimalItem(animal: model);
          //             },
          //           )
          //         ],
          //       ),
          //     );
          //   },
          //   error: (msg) {
          //     return Center(child: Text(msg));
          //   },
          // );
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
        backgroundColor: context.appTheme.outline,
        onPressed: () async {

          if (animalController.text.isNotEmpty) {
            await findAnimal(name: animalController.text);
            // context.read<UserBloc>().add(UserEvent.fetchUser());
            // log("func context.read<HomeBloc>().add(HomeEvent.fetchData(animalName: animalController.text))");
            // context.read<HomeBloc>().add(HomeEvent.fetchData(animalName: animalController.text));
          } else {
            log("controller is Empty try again");
          }
        },
        child: Icon(Icons.send, color: context.appTheme.surface),
      ),
    );
  }
}
