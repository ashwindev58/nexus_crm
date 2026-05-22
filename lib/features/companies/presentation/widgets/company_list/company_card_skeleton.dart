import 'package:flutter/material.dart';

class ShimmerWidget extends StatefulWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({
    super.key,
    required this.width,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  });

  const ShimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: ShapeDecoration(
            color: Color.lerp(
              const Color(0xFFE2E8F0), // Slate 200 (light grey)
              const Color(0xFFF8FAFC), // Slate 50 (lighter grey)
              _controller.value,
            ),
            shape: widget.shapeBorder,
          ),
        );
      },
    );
  }
}

class CompanyCardSkeleton extends StatelessWidget {
  const CompanyCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade100, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar skeleton
                const ShimmerWidget.circular(width: 44, height: 44),
                const SizedBox(width: 14),
                // Header skeleton
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          ShimmerWidget.rectangular(width: 120, height: 16),
                          SizedBox(width: 8),
                          ShimmerWidget.rectangular(width: 50, height: 12),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const ShimmerWidget.rectangular(width: 160, height: 12),
                      const SizedBox(height: 6),
                      const ShimmerWidget.rectangular(width: 140, height: 10),
                    ],
                  ),
                ),
                const ShimmerWidget.rectangular(width: 16, height: 16),
              ],
            ),
            const Divider(color: Color(0xFFF1F5F9), height: 24, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Metadata skeleton
                const ShimmerWidget.rectangular(width: 140, height: 12),
                // Team avatars skeleton
                Row(
                  children: const [
                    ShimmerWidget.circular(width: 24, height: 24),
                    SizedBox(width: 4),
                    ShimmerWidget.circular(width: 24, height: 24),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CompanyListSkeleton extends StatelessWidget {
  const CompanyListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const CompanyCardSkeleton();
      },
    );
  }
}
