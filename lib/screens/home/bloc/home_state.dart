part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class ServiceSuccessState extends HomeState{
  final GetServiceResponse getServiceResponse;

  ServiceSuccessState(this.getServiceResponse);
}


class NotificationSuccess extends HomeState{
  final NotificationResponse notificationResponse;

  NotificationSuccess(this.notificationResponse);
}

class ServiceRequestSuccessState extends HomeState{
   final serviceResponse;

   ServiceRequestSuccessState(this.serviceResponse);
}

class HomeErrorState extends HomeState{
  final String? message;

  HomeErrorState(this.message);
}