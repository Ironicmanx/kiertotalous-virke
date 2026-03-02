import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/apartment_2room_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_3room_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_4room_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApartmentSizeBloc extends Bloc<SPApartmentSizeEvent, ApartmentSize> {
  ApartmentBloc oneRoomBloc;
  Apartment2RoomBloc twoRoomsBloc;
  Apartment3RoomBloc threeRoomsBloc;
  Apartment4RoomBloc fourRoomsBloc;

  ApartmentSizeBloc({
    required this.oneRoomBloc,
    required this.twoRoomsBloc,
    required this.threeRoomsBloc,
    required this.fourRoomsBloc,
  }) : super(
          ApartmentSize(
            oneRoom: oneRoomBloc.state,
            twoRooms: twoRoomsBloc.state,
            threeRooms: threeRoomsBloc.state,
            fourRooms: fourRoomsBloc.state,
          ),
        ) {
    on<OneRoomChanged>((event, emit) {
      emit(state.copyWith(oneRoom: event.apartment));
    });
    on<TwoRoomsChanged>((event, emit) {
      emit(state.copyWith(twoRooms: event.apartment));
    });
    on<ThreeRoomsChanged>((event, emit) {
      emit(state.copyWith(threeRooms: event.apartment));
    });
    on<FourRoomsChanged>((event, emit) {
      emit(state.copyWith(fourRooms: event.apartment));
    });

    // listen to Apartment blocs and update accordingly
    oneRoomBloc.stream.listen((state) {
      add(OneRoomChanged(state));
    });
    twoRoomsBloc.stream.listen((state) {
      add(TwoRoomsChanged(state));
    });
    threeRoomsBloc.stream.listen((state) {
      add(ThreeRoomsChanged(state));
    });
    fourRoomsBloc.stream.listen((state) {
      add(FourRoomsChanged(state));
    });
  }
}
