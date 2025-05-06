import 'package:equatable/equatable.dart';

class Seminar extends Equatable {
  final int id;
  final String nameOfSeminar;
  final String topics;
  final String description;
  final String date;
  final String location;
  final String speakerName;
  final String organizationName;
  final String speakerImage;
  final String seminarImage;
  final String aboutTheSpeaker;
  final int certificateTemplateId;
  final int price;
  final String createdAt;
  final String updatedAt;

  Seminar({
    required this.id,
    required this.nameOfSeminar,
    required this.topics,
    required this.description,
    required this.date,
    required this.location,
    required this.speakerName,
    required this.organizationName,
    required this.speakerImage,
    required this.seminarImage,
    required this.aboutTheSpeaker,
    required this.certificateTemplateId,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Seminar.fromJson(Map<String, dynamic> json, String baseUrl) {
    return Seminar(
      id: json['id'],
      nameOfSeminar: json['name_of_seminar'],
      topics: json['topics'],
      description: json['description'],
      date: json['date'],
      location: json['location'],
      speakerName: json['speaker_name'],
      organizationName: json['organization_name'],
      speakerImage: '$baseUrl/${json['speaker_image']}',
      seminarImage: '$baseUrl/${json['seminar_image']}',
      aboutTheSpeaker: json['about_the_speaker'],
      certificateTemplateId: json['certificate_template_id'],
      price: json['price'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}