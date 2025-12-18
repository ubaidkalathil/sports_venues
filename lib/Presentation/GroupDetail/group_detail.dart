import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext, BlocBuilder;
import 'package:sports_venues/Application/Venue/bloc/venue_bloc.dart';
import 'package:sports_venues/Components/Skelton/venue_skelton.dart';
import 'package:sports_venues/Components/custom_network_error.dart';
import 'package:sports_venues/Components/search_widget.dart';
import 'package:sports_venues/Components/text_widget.dart';
import 'package:sports_venues/Components/venue_list_widget.dart';
import 'package:sports_venues/Core/colors.dart';
import 'package:sports_venues/Core/constants.dart';

class GroupDetail extends StatefulWidget {
  String groupName;
  GroupDetail({super.key, required this.groupName});

  @override
  State<GroupDetail> createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {
  ValueNotifier<bool> search = ValueNotifier(false);
  ValueNotifier<bool> selectSort = ValueNotifier(false);
  @override
  void initState() {
    /// Init values
    search.value = false;
    selectSort.value = false;

    /// Fetching Group wise data
    context.read<VenueBloc>().add(VenueListEvent(groupName: widget.groupName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(),
        actions: [actionBtns()],
        toolbarHeight: appBrSize,
      ),
      body: BlocBuilder<VenueBloc, VenueState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child:
                /// Checking API status
                state is VenueListSuccess
                ? VenueListWidget(
                    dataList: state.venueListData,
                    groupName: widget.groupName,
                  )
                : state is VenueNetworkError
                ?
                  //// No Network Widget
                  NetworkErrorWidget(
                    onPressed: () {
                      context.read<VenueBloc>().add(
                        VenueListEvent(groupName: widget.groupName),
                      );
                    },
                  )
                : VenueListSkelton(),
          );
        },
      ),
    );
  }

  ValueListenableBuilder<bool> nearbySortOption() {
    return ValueListenableBuilder(
      valueListenable: selectSort,
      builder: (context, isSelect, child) => GestureDetector(
        onTap: () {
          /// Checking Current Btn Status
          if (!isSelect) {
            context.read<VenueBloc>().add(
              VenueSortByNearestEvent(groupName: widget.groupName),
            );
          } else {
            context.read<VenueBloc>().add(
              VenueListEvent(groupName: widget.groupName),
            );
          }
          selectSort.value = !selectSort.value;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: isSelect
                  ? green
                  : const Color.fromARGB(255, 189, 189, 189),
            ),
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Row(
            mainAxisSize: .min,
            children: [
              TextWidget("Nearest", color: isSelect ? green : black),
              if (isSelect) Icon(Icons.done, color: green),
            ],
          ),
        ),
      ),
    );
  }

  ValueListenableBuilder<bool> actionBtns() {
    return ValueListenableBuilder(
      valueListenable: search,
      builder: (context, value, child) => value
          ? IconButton(
              onPressed: () {
                search.value = false;
              },
              icon: Icon(Icons.close),
            )
          : Row(
              mainAxisSize: .min,
              children: [
                nearbySortOption(),
                IconButton(
                  onPressed: () {
                    selectSort.value = false;
                    search.value = true;
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),
    );
  }

  ValueListenableBuilder<bool> appBarTitle() {
    return ValueListenableBuilder(
      valueListenable: search,
      builder: (context, value, child) => value
          ? CustomSearchWidget(
              autofocus: true,
              onChage: (value) {
                context.read<VenueBloc>().add(
                  VenueListEvent(searchKey: value, groupName: widget.groupName),
                );
              },
            )
          : TextWidget(
              widget.groupName,
              fontSize: titleText,
              fontWeight: FontWeight.bold,
            ),
    );
  }
}
