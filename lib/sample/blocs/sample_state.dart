part of 'sample_bloc.dart';

@immutable
abstract class SampleState {}

class SampleInitial extends SampleState {}

class GetSampleDataProgress extends SampleState {}

class GetExternalLocalizeProgress extends SampleState {}

class GetSampleDataSuccess extends SampleState {
  final List<Sample> list;

  GetSampleDataSuccess(this.list);
}

class GetExternalLocalizeSuccess extends SampleState {}

class GetExternalLocalizeFailed extends SampleState {}

class GetSampleDataFailed extends SampleState {
  final String? exception;

  GetSampleDataFailed({this.exception});
}
