import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/seminar_model.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesState([])) {
    on<ToggleFavoriteEvent>(_onToggleFavorite);
  }

  void _onToggleFavorite(
      ToggleFavoriteEvent event, Emitter<FavoritesState> emit) {
    final currentFavorites = List<Seminar>.from(state.favorites);

    if (currentFavorites.contains(event.seminar)) {
      currentFavorites.removeWhere((s) => s.id == event.seminar.id);
    } else {
      currentFavorites.add(event.seminar);
    }

    emit(FavoritesState(currentFavorites));
  }
}
