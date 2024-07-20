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
              return const ShimmerListViewItem();
            },
          ),
        ),
      ),
    );
  }
}

class ShimmerNewestListView extends StatelessWidget {
  const ShimmerNewestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 125,
                    child: Row(
                      children: [
                        const ShimmerListViewItem(),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Skelton(height: 50),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Skelton(height: 20),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Skelton(width: 60, height: 25),
                                      Spacer(),
                                      Skelton(width: 40, height: 25),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Skelton(width: 30, height: 25),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Divider(
                    thickness: 0.15,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class ShimmerSimilarListView extends StatelessWidget {
  const ShimmerSimilarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: ShimmerListViewItem(
                padding: const EdgeInsets.only(right: 5),
                borderRadius: BorderRadius.circular(8),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.width,
    this.height,
  });
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      height: height,
      width: width,
    );
  }
}

class ShimmerListViewItem extends StatelessWidget {
  const ShimmerListViewItem({
    super.key,
    this.padding,
    this.borderRadius,
  });
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: Container(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
