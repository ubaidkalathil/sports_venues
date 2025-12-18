import 'package:sports_venues/Core/custom_icons.dart';
import 'package:sports_venues/Domain/model/sport_group.dart';

class AppData {
  static const List<SportCategory> sportsCategories = [
    SportCategory(name: "Football", image: CustomIcons.football),
    SportCategory(name: "Cricket", image: CustomIcons.cricket),
    SportCategory(name: "Volleyball", image: CustomIcons.vollyBall),
    SportCategory(name: "Badminton", image: CustomIcons.badminton),
    SportCategory(name: "Table Tennis", image: CustomIcons.tableTennis),
    SportCategory(name: "Tennis", image: CustomIcons.tennis),
    SportCategory(name: "Basketball", image: CustomIcons.basket),
    SportCategory(name: "Hockey", image: CustomIcons.hockey),
    SportCategory(name: "Squash", image: CustomIcons.squash),
    SportCategory(name: "Boxing", image: CustomIcons.boxing),
    SportCategory(name: "Ultimate Frisbee", image: CustomIcons.frisbee),
    SportCategory(name: "Swimming", image: CustomIcons.swimming),
    SportCategory(name: "Beach Volleyball", image: CustomIcons.beachVollyball),
    SportCategory(name: "Golf", image: CustomIcons.golf),
    SportCategory(name: "Archery", image: CustomIcons.archer),
    SportCategory(name: "Adventure Sports", image: CustomIcons.adventure),
    SportCategory(name: "Rock Climbing", image: CustomIcons.rockClimb),
  ];
}
