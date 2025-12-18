import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sports_venues/Domain/Server/api_end_points.dart';
import 'package:sports_venues/Domain/model/venue_model.dart';

@lazySingleton
class VenueRepo {
  static Future<List<VenueModel>> getVenueList({
    String groupName = "",
    String searchKey = "",
  }) async {
    try {
      final dio = Dio();

      // return response
      final Response response = await dio.get(ApiEndpoints.venueList);
      List<VenueModel> venues = [];
      List<VenueModel> searchVenues = [];

      if (response.statusCode == 200) {
        ///checking if Grouped Data or notso
        if (groupName.isNotEmpty) {
          for (var data in response.data) {
            VenueModel venuData = VenueModel.fromJson(data);
            List<String> sports = venuData.sports;
            bool isAvailable = sports.contains(groupName);
            if (isAvailable) {
              ///Checking if search req or not
              if (searchKey.isNotEmpty &&
                  venuData.name.toLowerCase().contains(
                    searchKey.toLowerCase(),
                  )) {
                searchVenues.add(venuData);
              } else {
                venues.add(venuData);
              }
            }
          }
        } else {
          for (var data in response.data) {
            VenueModel venue = VenueModel.fromJson(data);

            ///Checking if search req or not
            if (searchKey.isNotEmpty &&
                venue.name.toLowerCase().contains(searchKey.toLowerCase())) {
              searchVenues.add(venue);
            } else {
              venues.add(venue);
            }
          }
        }

        /// Returning currect data after checking state
        if (searchKey.isEmpty) {
          log(jsonEncode(venues));
          return venues;
        } else {
          log(jsonEncode(searchVenues));
          return searchVenues;
        }
      } else {
        List<VenueModel> login = [];
        return login;
      }
    } catch (e) {
      List<VenueModel> login = [];
      return login;
    }
  }
}
