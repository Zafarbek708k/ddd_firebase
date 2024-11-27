import 'dart:io';
import 'package:ddd_firebase/domain/api/http_service.dart';
import 'package:ddd_firebase/domain/entity/data/animal_model.dart';
import 'package:ddd_firebase/domain/interface/app_repository.dart';


class AppRepositoryImplementation extends AppRepository {
  @override
  Future<void> login() async {}


  @override
  Future<List<AnimalModel>> getAnimalInfo({required String name}) async{
    String? result = await HttpService.read(baseUrl: HttpService.baseUrl, api: HttpService.apiAnimal, param: HttpService.paramAnimal(name: name));
    if(result != null){
      List<AnimalModel> animalList = animalModelFromJson(result);
      return animalList;
    }else{
      return [];
    }
  }
}


