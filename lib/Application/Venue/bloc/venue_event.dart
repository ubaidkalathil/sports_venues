part of 'venue_bloc.dart';

sealed class VenueEvent extends Equatable {
  const VenueEvent();

  @override
  List<Object> get props => [];
}

/// List Venues && Search
class VenueListEvent extends VenueEvent {
  final String groupName;
  final String searchKey;

  const VenueListEvent({this.groupName = "", this.searchKey = ""});
}

/// Soet By Nearest Venues
class VenueSortByNearestEvent extends VenueEvent {
  final String groupName;

  const VenueSortByNearestEvent({this.groupName = ""});
}
