part of 'venue_bloc.dart';

sealed class VenueState extends Equatable {
  const VenueState();

  @override
  List<Object> get props => [];
}

final class VenueInitial extends VenueState {}

final class VenueNetworkError extends VenueState {}

/// All Venue List

final class VenueListLoading extends VenueState {}

final class VenueListSuccess extends VenueState {
  final List<VenueModel> venueListData;

  const VenueListSuccess({required this.venueListData});
}

final class VenueListFail extends VenueState {
  final String error;

  const VenueListFail({this.error = "Something went wrong!"});
}

/// Venue Search

final class VenueSearchLoading extends VenueState {}

final class VenueSearchSuccess extends VenueState {}

final class VenueSeachFail extends VenueState {}
