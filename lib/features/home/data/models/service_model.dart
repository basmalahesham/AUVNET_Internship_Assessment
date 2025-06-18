import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

part 'service_model.g.dart';

@HiveType(typeId: 1)
class ServiceModel extends ServiceEntity {
  @HiveField(0)
  final String hiveId;

  @HiveField(1)
  final String hiveName;

  @HiveField(2)
  final String hiveImage;

  @HiveField(3)
  final String hiveTag;
  const ServiceModel({
    required this.hiveId,
    required this.hiveName,
    required this.hiveImage,
    required this.hiveTag,
  }) : super(id: hiveId, name: hiveName, image: hiveImage, tag: hiveTag);

  factory ServiceModel.fromDoc(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return ServiceModel(
      hiveId: doc.id,
      hiveName: map['name'] ?? '',
      hiveImage: map['image'] ?? '',
      hiveTag: map['tag'] ?? '',
    );
  }
}
