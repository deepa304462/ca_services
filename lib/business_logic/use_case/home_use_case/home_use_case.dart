
import 'package:ca_services/business_logic/repository/home_repo/home_repo.dart';

import '../../../data/remote_services/models/get_service_response.dart';

class HomeUseCase{
  final HomeRepo _homeRepo;

  HomeUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;


  Future<GetServiceResponse> getServices() {
    return _homeRepo.getServices();
  }

  Future<dynamic> serviceRequest(String serviceId) {
    return _homeRepo.serviceRequest(serviceId);
  }
}