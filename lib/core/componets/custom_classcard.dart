import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// class ClassCategoryCard extends ConsumerWidget {
//   final double height;
//   final double width;
//   final ClassCategory category;
//   final Color borderColor;
//   final String routename;

//   const ClassCategoryCard({
//     super.key,
//     required this.height,
//     required this.width,
//     required this.category,
//     required this.borderColor,
//     required this.routename
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedCategory = ref.watch(selectedClassCategoryProvider);
//     final isSelected = selectedCategory?.id == category.id;

//     return GestureDetector(
//       onTap: () {
//         ref.read(selectedClassCategoryProvider.notifier).state = category;
//         context.push(routename);
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 180),
//         height: height,
//         width: width,
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: isSelected ? borderColor.withOpacity(0.08) : Colors.white,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(
//             color: borderColor,
//             width: 1.5,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.04),
//               blurRadius: 6,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               category.svgPath,
//               height: 42,
//               width: 42,
//             ),
//             const SizedBox(height: 10),
//             Text(
//               category.name,
//               textAlign: TextAlign.center,
//               style: const GoogleFonts.poppins(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ClassCategoryCard extends StatelessWidget {
  final double height;
  final double width;
  final dynamic category;
  final Color borderColor;
  final Color cardColor; 
  final bool isSelected;
  final VoidCallback onTap;

  const ClassCategoryCard({
    super.key,
    required this.height,
    required this.width,
    required this.category,
    required this.borderColor,
    required this.cardColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: height,
        width: width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF333332),Color(0xFF81705C)],
            // stops: [
            //   0.42,
            //   1.0,
            // ],
          ),
          color: isSelected ? borderColor.withOpacity(0.12) : cardColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: borderColor,
            width: isSelected ? 2.0 : 1.5,
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.04),
          //     blurRadius: 6,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category.name,
              textAlign: TextAlign.center,
              style:GoogleFonts.poppins(
                color: Color(0xFFFFFFFF),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            //const SizedBox(height: 10),
            SvgPicture.asset(
              category.svgPath,
              height: 18.w,
              width: 14.h,
            ),
          ],
        ),
      ),
    );
  }
}