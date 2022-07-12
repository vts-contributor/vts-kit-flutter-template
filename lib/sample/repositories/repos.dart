
import 'package:sample/sample/repositories/sample_repository.dart';

import '../network/api_services.dart';

class ApiRepository {
  static SampleRepo? _sampleRepo;

  static final SampleApiServices _apiServices = SampleApiServices();

  static SampleRepo get sampleRepo =>
      _sampleRepo ??= SampleRepoImpl(_apiServices);
}