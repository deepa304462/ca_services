
import 'package:ca_services/screens/home/bloc/home_bloc.dart';

import '../../../data/remote_services/models/get_service_response.dart';
import '../../../data/remote_services/models/notification_response.dart';

abstract class HomeRepo{
  Future<GetServiceResponse> getServices();
  Future<dynamic> serviceRequest(String serviceId);

  Future<NotificationResponse> getNotification();

  Future updateFCM(String fcmToken);

}