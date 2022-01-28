import 'package:shuttlers_test/application/app_view_model/app_view_model.dart';
import 'package:shuttlers_test/features/home/domain/models/trip_model.dart';

class StartingTripViewModel extends AppViewModel {
  final Trip _trip;

  StartingTripViewModel(this._trip);

  Trip get trip => _trip;
  String get passengers => '${_trip.passengerCount} Passengers';
  String get stops => '${_trip.stopCount} stops';
  String get duration {
    final inHours = _trip.estimateDuration ~/ 60;
    final inMinutes = _trip.estimateDuration % 60;
    final hours = inHours > 0 ? '${inHours}hr ' : '';
    final minutes = inMinutes > 0 ? '$inMinutes min' : '';
    return '$hours$minutes';
  }
}
