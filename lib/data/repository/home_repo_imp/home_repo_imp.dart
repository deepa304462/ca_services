
import 'package:ca_services/business_logic/repository/home_repo/home_repo.dart';
import 'package:ca_services/screens/home/bloc/home_bloc.dart';

import '../../adstract_services/remote_services.dart';
import '../../api_services.dart';
import '../../remote_services/models/get_service_response.dart';
import '../../remote_services/models/notification_response.dart';

class HomeRepoImp extends HomeRepo {
  final RemoteDataService _service = ApiService();

  @override
  Future<GetServiceResponse> getServices() {
    return _service.getServices();
  }

  @override
  Future<dynamic> serviceRequest(String serviceId) {
    return _service.serviceRequest(serviceId);
  }

  @override
  Future<NotificationResponse> getNotification() {
    return _service.getNotification();
  }

  @override
  Future updateFCM(String fcmToken) {
    return _service.updateFCM(fcmToken);
  }
}