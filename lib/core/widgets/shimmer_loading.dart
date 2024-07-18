import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFeaturedListView extends StatelessWidget {
  const ShimmerFeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.31,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Adjust the count based on your needs
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 2.6 / 4,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
