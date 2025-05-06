import 'package:certicode_mobile/features/home/models/seminar_model.dart';

abstract class FavoritesEvent {}

class ToggleFavoriteEvent extends FavoritesEvent {
  final Seminar seminar;
  ToggleFavoriteEvent(this.seminar);
}

class UnToggleFavorite extends FavoritesEvent {
  final Seminar seminar;

  UnToggleFavorite(this.seminar);
}