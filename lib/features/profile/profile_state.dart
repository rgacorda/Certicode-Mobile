// profile_state.dart
part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

// Initial state before any loading or data is available
class ProfileInitial extends ProfileState {}

// State indicating that profile data is currently being loaded
class ProfileLoading extends ProfileState {}

// State when profile data has been successfully loaded
class ProfileLoaded extends ProfileState {
  final String name;
  final String email;
  final String? profileImagePath;

  ProfileLoaded({required this.name, required this.email, this.profileImagePath});

  // Helper method to create a new ProfileLoaded state with updated values
  ProfileLoaded copyWith({
    String? name,
    String? email,
    String? profileImagePath,
  }) {
    return ProfileLoaded(
      name: name ?? this.name,
      email: email ?? this.email,
      profileImagePath: profileImagePath ?? this.profileImagePath,
    );
  }
}

// State when there's an error loading or updating the profile
class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}