
import '../../../data/remote_services/models/get_service_response.dart';

abstract class HomeRepo{
  Future<GetServiceResponse> getServices();
  Future<dynamic> serviceRequest(String serviceId);


}