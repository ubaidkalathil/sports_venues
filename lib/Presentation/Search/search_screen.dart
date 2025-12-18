import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_venues/Application/Venue/bloc/venue_bloc.dart';
import 'package:sports_venues/Components/Skelton/venue_skelton.dart';
import 'package:sports_venues/Components/custom_network_error.dart';
import 'package:sports_venues/Components/search_widget.dart';
import 'package:sports_venues/Components/venue_list_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    /// Initial fetch all data
    context.read<VenueBloc>().add(VenueListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomSearchWidget(
          autofocus: true,
          onChage: (value) {
            /// Calling by search text change
            context.read<VenueBloc>().add(VenueListEvent(searchKey: value));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<VenueBloc, VenueState>(
          builder: (context, state) {
            return state is VenueListSuccess
                ? VenueListWidget(dataList: state.venueListData)
                : state is VenueNetworkError
                ? NetworkErrorWidget(
                    onPressed: () {
                      context.read<VenueBloc>().add(
                        VenueListEvent(searchKey: ""),
                      );
                    },
                  )
                : VenueListSkelton();
          },
        ),
      ),
    );
  }
}
