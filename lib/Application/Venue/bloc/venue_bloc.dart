import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sports_venues/Core/basic_utils.dart';
import 'package:sports_venues/Data/API/venue_repo.dart';
import 'package:sports_venues/Domain/model/venue_model.dart';

part 'venue_event.dart';
part 'venue_state.dart';

@injectable
class VenueBloc extends Bloc<VenueEvent, VenueState> {
  VenueBloc() : super(VenueInitial()) {
    on<VenueListEvent>((event, emit) async {
      emit(VenueListLoading());
      try {
        if (await BasicUtils.checkConnection()) {
          List<VenueModel> venueList = await VenueRepo.getVenueList(
            groupName: event.groupName,
            searchKey: event.searchKey,
          );
          if (venueList.isEmpty) {
            emit(VenueListFail());
          }
          emit(VenueListSuccess(venueListData: venueList));
        } else {
          emit(VenueNetworkError());
        }
      } catch (e) {
        emit(VenueListFail());
      }
    });

    on<VenueSortByNearestEvent>((event, emit) async {
      emit(VenueListLoading());
      try {
        if (await BasicUtils.checkConnection()) {
          List<VenueModel> venueList = await VenueRepo.getVenueList(
            groupName: event.groupName,
          );
          if (venueList.isEmpty) {
            emit(VenueListFail());
          }

          /// Applying the sor function
          venueList.sort((a, b) {
            return a.kilometres.compareTo(b.kilometres);
          });

          emit(VenueListSuccess(venueListData: venueList));
        } else {
          emit(VenueNetworkError());
        }
      } catch (e) {
        emit(VenueListFail());
      }
    });

    on<FilterByPriceRange>((event, emit) async {
      emit(VenueListLoading());
      try {
        if (await BasicUtils.checkConnection()) {
          List<VenueModel> venueList = await VenueRepo.getVenueList(
            groupName: event.groupName,
          );
          if (venueList.isEmpty) {
            emit(VenueListFail());
          }

          List<VenueModel> filtered = [];

          /// Applying the filter function
          filtered = venueList.where((item) {
            if (item.price.containsKey(event.groupName)) {
              final price = item.price[event.groupName] ?? 0;
              return price >= event.startPrice && price <= event.endPrice;
            }
            return false;
          }).toList();

          emit(VenueListSuccess(venueListData: filtered));
        } else {
          emit(VenueNetworkError());
        }
      } catch (e) {
        emit(VenueListFail());
      }
    });
  }
}
