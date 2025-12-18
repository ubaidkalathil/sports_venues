import 'package:flutter/material.dart';
import 'package:sports_venues/Components/Skelton/skelton.dart';
import 'package:sports_venues/Core/colors.dart';
import 'package:sports_venues/Core/constants.dart';

class VenueListSkelton extends StatefulWidget {
  const VenueListSkelton({super.key});

  @override
  State<VenueListSkelton> createState() => _VenueListSkeltonState();
}

class _VenueListSkeltonState extends State<VenueListSkelton> {
  double screenWidth = 0;
  @override
  void didChangeDependencies() {
    screenWidth = width(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            width: .5,
            color: const Color.fromARGB(255, 212, 212, 212),
          ),
        ),
        child: ListTile(
          title: Skelton(width: 150, height: 20),
          subtitle: Column(
            crossAxisAlignment: .start,
            children: [kHight(6), Skelton(width: 150, height: 20)],
          ),
          dense: true,
          trailing: Row(
            mainAxisSize: .min,
            children: [
              Icon(Icons.star, color: Colors.yellow),
              Skelton(width: 30, height: 20),
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
              child: Skelton(width: 150, height: 20),
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => kHight(8),
      itemCount: 20,
    );
  }
}
