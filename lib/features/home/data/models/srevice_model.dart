import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel extends ServiceEntity {
  const ServiceModel({
    required super.id,
    required super.name,
    required super.image,
    required super.tag,
  });

  factory ServiceModel.fromDoc(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return ServiceModel(
      id: doc.id,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      tag: map['tag'] ?? '',
    );
  }
}
