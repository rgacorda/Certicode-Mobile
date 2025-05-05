// profile_event.dart
part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

// Event to trigger loading the profile data
class LoadProfile extends ProfileEvent {}

// Event to trigger updating the profile data
class UpdateProfile extends ProfileEvent {
  final String name;
  final String email;
  final String? profileImagePath;

  UpdateProfile({required this.name, required this.email, this.profileImagePath});
}