import 'package:flutter/material.dart';
import 'package:sports_venues/Components/text_widget.dart';

import 'package:sports_venues/Core/colors.dart';
import 'package:sports_venues/Core/constants.dart';
import 'package:sports_venues/Core/custom_networ_image.dart';
import 'package:sports_venues/Domain/Server/api_end_points.dart';
import 'package:sports_venues/Domain/model/venue_model.dart';

class VenueListWidget extends StatelessWidget {
  List<VenueModel> dataList;
  String groupName;
  String limit;

  VenueListWidget({
    super.key,
    required this.dataList,
    this.groupName = "",
    this.limit = "",
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: limit.isNotEmpty,
      physics: limit.isNotEmpty
          ? NeverScrollableScrollPhysics()
          : AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            width: .5,
            color: const Color.fromARGB(255, 212, 212, 212),
          ),
        ),
        child: ListTile(
          title: TextWidget(
            dataList[index].name,
            fontSize: normalText,
            fontWeight: FontWeight.bold,
          ),
          subtitle: Column(
            crossAxisAlignment: .start,
            children: [
              TextWidget(
                "${dataList[index].kilometres.toString()} km",
                color: green,
                fontWeight: FontWeight.w500,
              ),
              if (groupName.isNotEmpty)
                TextWidget(
                  "Price Rs:${dataList[index].price[groupName]}",
                  fontWeight: FontWeight.w500,
                ),
            ],
          ),
          dense: true,
          trailing: Row(
            mainAxisSize: .min,
            children: [
              Icon(Icons.star, color: Colors.yellow),
              TextWidget(dataList[index].rating.toString()),
            ],
          ),
          leading: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius - 4),
              child: CustomNetworImage(
                imgUrl: "${ApiEndpoints.kBaseUrl}/${dataList[index].logo}",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => kHight(8),
      itemCount: limit.isNotEmpty
          ? _getItemCount(int.parse(limit), dataList.length)
          : dataList.length,
    );
    ;
  }
}

int _getItemCount(int limit, int itemLength) {
  int count = 0;

  if (itemLength < limit) {
    count = itemLength;
  } else {
    count = limit;
  }

  return count;
}
