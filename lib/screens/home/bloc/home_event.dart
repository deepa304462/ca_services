part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetServicesListEvent extends HomeEvent{}

class ServiceRequestEvent extends HomeEvent{
  final serviceId;

  ServiceRequestEvent(this.serviceId);
}
