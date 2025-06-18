import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomerListShimmerWidget extends StatelessWidget {
  const CustomerListShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 18,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(width: 80, height: 14, color: Colors.white),
                    const SizedBox(width: 16),
                    Container(width: 80, height: 14, color: Colors.white),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
