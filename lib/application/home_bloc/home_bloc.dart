import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ddd_firebase/infrastructure/repository_implementation/app_repository_implementation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/data/animal_model.dart';
part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) {});

  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event)async*{
    yield* event.when(
      started: ()async* {
        log("bloc started func is start work");
      },
      fetchData: (msg) async* {
        log("bloc fetchData func is start work");
        log("msg = $msg");
        emit(const HomeState.loading());
        try {
           final list = await AppRepositoryImplementation().getAnimalInfo(name: msg);
          if(list.isNotEmpty){
            emit( HomeState.loaded(items: list));
          }else{
            emit( const HomeState.loaded(items: []));
          }
        } catch (e) {
          emit(const HomeState.error(msg: 'Failed to fetch user data'));
        }
      },

    );
  }



}
