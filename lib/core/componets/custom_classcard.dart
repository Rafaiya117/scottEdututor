import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/features/Teacher/teacher_home/teacher_homepage_model.dart';
import 'package:scoctt_edututo/features/Teacher/teacher_home/teacher_homepage_provider.dart';

class ClassCategoryCard extends ConsumerWidget {
  final double height;
  final double width;
  final ClassCategory category;
  final Color borderColor;
  final String routename;

  const ClassCategoryCard({
    super.key,
    required this.height,
    required this.width,
    required this.category,
    required this.borderColor,
    required this.routename
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedClassCategoryProvider);
    final isSelected = selectedCategory?.id == category.id;

    return GestureDetector(
      onTap: () {
        ref.read(selectedClassCategoryProvider.notifier).state = category;
        context.push(routename);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: height,
        width: width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? borderColor.withOpacity(0.08) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: borderColor,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              category.svgPath,
              height: 42,
              width: 42,
            ),
            const SizedBox(height: 10),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
