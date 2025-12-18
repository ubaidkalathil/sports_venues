import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_venues/Application/Venue/bloc/venue_bloc.dart';
import 'package:sports_venues/Components/search_widget.dart';
import 'package:sports_venues/Components/text_widget.dart';
import 'package:sports_venues/Components/venue_list_widget.dart';
import 'package:sports_venues/Core/app_data.dart';
import 'package:sports_venues/Core/colors.dart';
import 'package:sports_venues/Core/constants.dart';
import 'package:sports_venues/Core/custom_icons.dart';
import 'package:sports_venues/Core/page_navigation.dart';
import 'package:sports_venues/Presentation/GroupDetail/group_detail.dart';
import 'package:sports_venues/Components/Skelton/venue_skelton.dart';
import 'package:sports_venues/Presentation/Search/search_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  void initState() {
    context.read<VenueBloc>().add(VenueSortByNearestEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    screenHeight = height(context);
    screenWidth = width(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: white,
        elevation: 0,
        toolbarHeight: appBrSize,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: .center,
          children: [
            Image.asset(CustomIcons.sportsVenueLogo, width: 38, height: 38),
            TextWidget(
              "Sports Venues",
              fontWeight: FontWeight.bold,
              fontSize: titleText,
            ),
            kWidth(16),
          ],
        ),
      ),
      body: BlocBuilder<VenueBloc, VenueState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 14,
              children: [
                //// Search Bar Widget
                GestureDetector(
                  onTap: () {
                    PageNavigation.pushToIOS(
                      context,
                      BlocProvider(
                        create: (context) => VenueBloc(),
                        child: SearchScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomSearchWidget(enable: false),
                  ),
                ),
                TextWidget(
                  "Quick Match",
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 12),
                  fontSize: midTitle,
                  fontWeight: FontWeight.bold,
                ),
                //// Group Widget Of Sports
                _sportsGroupWidget(),
                TextWidget(
                  "Nearest Venues",
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 12),
                  fontSize: midTitle,
                  fontWeight: FontWeight.bold,
                ),
                //// Nearest Venues List
                Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 12),
                  child: state is VenueListSuccess
                      ? VenueListWidget(
                          dataList: state.venueListData,
                          limit: "10",
                        )
                      : state is VenueNetworkError
                      ? networkErrorWidget(context)
                      : VenueListSkelton(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Center networkErrorWidget(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          kHight(screenHeight * .1),
          Image.asset(CustomIcons.noInternet, width: screenWidth * .4),
          kHight(6),
          TextWidget(
            "Check your internet connection !!",
            textAlign: TextAlign.center,
            color: grey,
            fontWeight: FontWeight.w500,
          ),
          kHight(6),
          ElevatedButton(
            onPressed: () {
              context.read<VenueBloc>().add(VenueSortByNearestEvent());
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width(context) * .3, 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: TextWidget("Retry"),
          ),
        ],
      ),
    );
  }

  SizedBox _sportsGroupWidget() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: AppData.sportsCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: () {
            PageNavigation.pushToIOS(
              context,
              BlocProvider(
                create: (context) => VenueBloc(),
                child: GroupDetail(
                  groupName: AppData.sportsCategories[index].name,
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 12 : 8,
              right: 8,
              bottom: 8,
              top: 8,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: white,
              border: Border.all(
                width: .5,
                color: const Color.fromARGB(255, 212, 212, 212),
              ),
            ),
            constraints: BoxConstraints(maxHeight: 260, minHeight: 180),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius),
                    child: Image.asset(
                      AppData.sportsCategories[index].image,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                kHight(12),
                TextWidget(
                  AppData.sportsCategories[index].name,
                  maxLines: 2,
                  fontSize: normalText,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
