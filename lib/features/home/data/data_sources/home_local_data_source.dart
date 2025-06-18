import 'package:auvnet_flutter_internship_assessment/features/home/data/models/service_model.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheServices(List<ServiceModel> services);
  Future<List<ServiceModel>?> getCachedServices();
  Future<void> clearCachedServices();
}

class HiveHomeLocalDataSource implements HomeLocalDataSource {
  final Box<ServiceModel> box;

  HiveHomeLocalDataSource(this.box);

  @override
  Future<void> cacheServices(List<ServiceModel> services) async {
    for (var service in services) {
      await box.put(service.hiveId, service);
    }
  }

  @override
  Future<void> clearCachedServices() async {
    await box.clear();
  }

  @override
  Future<List<ServiceModel>?> getCachedServices() async {
    return box.values.toList();
  }
}
