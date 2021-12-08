part of 'app_cubit.dart';

//states just names happening to hint the app . u do the logics with cubitbuilder with these hints

abstract class AppState extends Equatable {
  const AppState();
}

class InitialState extends AppState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AppState {
  const LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

class DetailState extends AppState {
  const DetailState(this.place);
  final DataModel place;
  @override
  List<Object> get props => [place];
}
