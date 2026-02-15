// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:scoctt_edututo/features/Teacher/courses/course_model.dart';

// class CourseItemCard extends ConsumerWidget {
//   final double height;
//   final double width;
//   final CourseItem courseItem;
//   final Gradient backgroundGradient;
//   final Color borderColor;
//   final void Function(CourseItem)? onEdit;
//   final void Function(CourseItem)? onDelete;
//   final void Function(CourseItem)? onTap;

//   const CourseItemCard({
//     super.key,
//     required this.height,
//     required this.width,
//     required this.courseItem,
//     required this.backgroundGradient,
//     required this.borderColor,
//     this.onEdit,
//     this.onDelete,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return GestureDetector(
//       onTap: () => onTap?.call(courseItem),
//       child: Container(
//         height: height,
//         width: width,
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           gradient: backgroundGradient,
//           border: Border.all(color: borderColor, width: 1.5),
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 6,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               courseItem.title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 16,
//               ),
//             ),
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.edit, color: Colors.white),
//                   onPressed: () => onEdit?.call(courseItem),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.delete, color: Colors.white),
//                   onPressed: () => onDelete?.call(courseItem),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
