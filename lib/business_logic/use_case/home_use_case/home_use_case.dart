
import 'package:ca_services/business_logic/repository/home_repo/home_repo.dart';
import 'package:ca_services/screens/home/bloc/home_bloc.dart';

import '../../../data/remote_services/models/get_service_response.dart';
import '../../../data/remote_services/models/notification_response.dart';

class HomeUseCase{
  final HomeRepo _homeRepo;

  HomeUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;


  Future<GetServiceResponse> getServices() {
    return _homeRepo.getServices();
  }

  Future<NotificationResponse> getNotification() {
    return _homeRepo.getNotification();
  }

  Future<dynamic> serviceRequest(String serviceId) {
    return _homeRepo.serviceRequest(serviceId);
  }

  Future<dynamic> updateFCM(String fcmToken) {
    return _homeRepo.updateFCM(fcmToken);
  }
}