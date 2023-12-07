import 'package:bloc_architecture/data/models/country.dart';
import 'package:bloc_architecture/data/repositories/country_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CountryEvent {}

class CountryEventInitial extends CountryEvent {}

class CountryEventTyping extends CountryEvent {
  String typing;

  CountryEventTyping({required this.typing});
}

abstract class CountryState {}

class CountryStateInitial extends CountryState {}

class CountryStateLoading extends CountryState {}

class CountryStateNotFound extends CountryState {}

class CountryStateData extends CountryState {
  List<Country> countries;

  CountryStateData({required this.countries});
}

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryRepository repo = CountryRepository();

  CountryBloc() : super(CountryStateInitial()) {
    on<CountryEventInitial>(onInitial);
    on<CountryEventTyping>(onTyping);
  }

  void onInitial(event, emit) => emit(CountryStateInitial());

  void onTyping(CountryEventTyping event, emit) async {
    emit(CountryStateLoading());
    List<Country> countries = await repo.getCountries(event.typing);
    if (countries.isEmpty) {
      emit(CountryStateNotFound());
    } else {
      emit(CountryStateData(countries: countries));
    }
  }
}
