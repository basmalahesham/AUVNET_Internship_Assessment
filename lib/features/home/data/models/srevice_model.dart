import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';

class ServiceModel extends ServiceEntity {
  const ServiceModel({
    required super.id,
    required super.name,
    required super.image,
    required super.tag,
  });
  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      tag: map['tag'],
    );
  }
}
