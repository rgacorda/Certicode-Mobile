// profile_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    // Register event handlers
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  // Event handler for loading the profile data
  Future<void> _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading()); // Indicate loading is in progress
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Load data from SharedPreferences
      final name = prefs.getString('userName') ?? 'Default Name'; // Provide a default
      final email = prefs.getString('userEmail') ?? 'default@example.com'; // Provide a default
      final profileImagePath = prefs.getString('userProfileImagePath');

      // Emit the loaded state with the retrieved data
      emit(ProfileLoaded(name: name, email: email, profileImagePath: profileImagePath));
    } catch (e) {
      // Emit an error state if loading fails
      emit(ProfileError(e.toString()));
    }
  }

  // Event handler for updating the profile data
  Future<void> _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) async {
    // Only update if the current state is ProfileLoaded (meaning we have existing data)
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      // Optionally emit ProfileLoading if the save operation is asynchronous and takes time
      // emit(ProfileLoading());

      try {
        // Save the updated data to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userName', event.name);
        await prefs.setString('userEmail', event.email);
        if (event.profileImagePath != null) {
          await prefs.setString('userProfileImagePath', event.profileImagePath!);
        } else {
          await prefs.remove('userProfileImagePath'); // Remove if image is cleared
        }

        // Emit a new ProfileLoaded state with the updated data
        // Use copyWith to keep existing properties if not being updated
        emit(currentState.copyWith(
          name: event.name,
          email: event.email,
          profileImagePath: event.profileImagePath,
        ));
      } catch (e) {
        // Handle errors during saving
        print("Error saving profile: $e");
        // You might choose to emit an error state or just log the error
        // emit(ProfileError("Failed to save profile")); // Example error state
        // Or, if the save failed, you might want to re-emit the previous state
        // emit(currentState);
      }
    }
  }
}