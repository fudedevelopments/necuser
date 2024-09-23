import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoadingScreen extends StatelessWidget {
  const SkeletonLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 200.0,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(height: 20),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 20.0,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(height: 10),

          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 15.0,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
