part of 'sample_bloc.dart';

@immutable
abstract class SampleEvent {}

class GetSampleDataEvent extends SampleEvent {}

class GetExternalLocalizeEvent extends SampleEvent {}
