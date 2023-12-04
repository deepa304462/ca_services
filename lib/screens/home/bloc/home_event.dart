part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetServicesListEvent extends HomeEvent{}


class GetNotificationEvent extends HomeEvent{}

class ServiceRequestEvent extends HomeEvent{
  final serviceId;

  ServiceRequestEvent(this.serviceId);
}

class UpdateFCMTokenEvent extends HomeEvent{
  final fcmToken;

  UpdateFCMTokenEvent(this.fcmToken);
}
