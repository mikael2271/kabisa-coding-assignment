import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/constants/enums.dart';

part 'locator_event.dart';
part 'locator_state.dart';

class LocatorBloc extends Bloc<LocatorEvent, LocatorState> {
  LocatorBloc() : super(LocatorInitial()) {
    on<CalculateDistance>(_onCalculateDistance);
  }

  void _onCalculateDistance(
      CalculateDistance event, Emitter<LocatorState> emit) async {
    emit(state.copyWith(submissionState: SubmissionState.submissionInProgress));

    bool serviceEnabled;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      emit(state.copyWith(
          submissionState: SubmissionState.custom,
          error: "locationServicesDisable"));
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        emit(state.copyWith(
            submissionState: SubmissionState.custom,
            error: "locationServicesDenied"));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      emit(state.copyWith(
          submissionState: SubmissionState.custom,
          error: "locationServicesPermanentlyDenied"));
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    String distance = (Geolocator.distanceBetween(51.27168223678097,
                5.737096685503158, position.latitude, position.longitude) /
            1000)
        .toStringAsFixed(1);

    emit(state.copyWith(
      submissionState: SubmissionState.submissionSuccess,
      distance: distance,
    ));
  }
}
