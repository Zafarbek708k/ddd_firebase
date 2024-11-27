import 'dart:io';

import 'package:ddd_firebase/domain/entity/data/animal_model.dart';

abstract class AppRepository{
  Future<void>login();

  Future<List<AnimalModel>> getAnimalInfo({required String name});
}