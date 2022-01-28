enum HomeVmState {
  none,

  /// App is checking for upcoming trips
  checkingTrip,

  /// Logged in user has no upcoming trips
  noTrip,

  /// Upcoming trip is yet to start. Start Trip buttons and itenery show
  atStart,

  /// Trip is ongoing and Driver is not at a Stop
  driving,

  /// Trip is ongoing and Driver is at a Stop, checking in and out passengers
  atStop,

  /// Trip is completed. End Trip button shows
  atEnd,
}