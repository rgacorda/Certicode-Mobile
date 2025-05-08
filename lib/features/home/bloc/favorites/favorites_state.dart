import 'package:certicode_mobile/features/home/models/seminar_model.dart';
import 'package:equatable/equatable.dart';

class FavoritesState extends Equatable {
  final List<Seminar> favorites;

  const FavoritesState(this.favorites);

  @override
  List<Object?> get props => [favorites];
}
