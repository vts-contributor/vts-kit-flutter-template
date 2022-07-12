import '../models/sample.dart';
import '../network/api_services.dart';

abstract class SampleRepo {
  Future<List<Sample>> getSampleData();
}

class SampleRepoImpl extends SampleRepo {
  final SampleApiServices _apiServices;

  SampleRepoImpl(this._apiServices);

  @override
  Future<List<Sample>> getSampleData() async {
    return await _apiServices.getSampleData();
  }
}