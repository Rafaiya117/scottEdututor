// import 'package:flutter/material.dart';
// import 'package:scoctt_edututo/features/Teacher/report_details/report_details_model.dart';


// class CustomDataTable extends StatelessWidget {
//   final List<String> headers;
//   final List<DetailReport> rows;

//   // ✅ CHANGED: index → rowId
//   final void Function(String rowId)? onViewMoreTap;

//   const CustomDataTable({
//     super.key,
//     required this.headers,
//     required this.rows,
//     this.onViewMoreTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         _buildHeader(),
//         const Divider(thickness: 1.2),
//         ..._buildRows(context),
//       ],
//     );
//   }

//   Widget _buildHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: headers.map(
//           (title) => Expanded(
//             child: Text(
//               title,
//               style: const GoogleFonts.poppins(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ).toList(),
//       ),
//     );
//   }

//   List<Widget> _buildRows(BuildContext context) {
//     return List.generate(rows.length, (index) {
//     final row = rows[index];
//   return Column(
//     children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         child: Row(
//           children: List.generate(row.values.length, (cellIndex) {
//             final value = row.values[cellIndex];
//             final isViewMore = value.toLowerCase() == 'view more';
//             return Expanded(
//               child: isViewMore
//                 ? GestureDetector(
//                   onTap: () => onViewMoreTap?.call(row.id),
//                   child: const Text(
//                     'View more',
//                     style: GoogleFonts.poppins(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   )
//                   : Text(value),
//                 );
//               }),
//             ),
//           ),
//           const Divider(height: 1),
//         ],
//       );
//     });
//   }
// }
