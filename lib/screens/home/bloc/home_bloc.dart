
import 'package:bloc/bloc.dart';
import 'package:ca_services/business_logic/use_case/home_use_case/home_use_case.dart';
import 'package:meta/meta.dart';

import '../../../data/remote_services/models/get_service_response.dart';
import '../../../data/repository/home_repo_imp/home_repo_imp.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final HomeUseCase _homeUseCase = HomeUseCase(homeRepo: HomeRepoImp());

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});

    on<GetServicesListEvent>((event, emit) async {
      await getServiceList(event,emit);
    });

    on<ServiceRequestEvent>((event, emit) async {
      await serviceRequest(event,emit);
    });
  }

  getServiceList(GetServicesListEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingState());

    try{
      var data = await _homeUseCase.getServices();
      if (data.status != null) {
        if (data.status!) {
          if (data.data != null) {
            emit(ServiceSuccessState(data));
          } else {
            emit(HomeErrorState(data.message));
          }
        } else {
          emit(HomeErrorState(data.message));
        }
      } else {
        emit(HomeErrorState("Server error !!!"));
      }

    }catch(e){
      emit(HomeErrorState("Something went wrong !"));
    }


  }

  serviceRequest(ServiceRequestEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingState());

    try{
      var data = await _homeUseCase.getServices();
      if (data.status != null) {
        if (data.status!) {
          if (data.data != null) {
            emit(ServiceRequestSuccessState(data));
          } else {
            emit(HomeErrorState(data.message));
          }
        } else {
          emit(HomeErrorState(data.message));
        }
      } else {
        emit(HomeErrorState("Server error !!!"));
      }

    }catch(e){
      emit(HomeErrorState("Something went wrong !"));
    }


  }
}
