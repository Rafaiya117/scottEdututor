import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// class AttendanceRow extends StatelessWidget {
//   final String name;
//   final String phone;
//   final String status;
//   final bool isHeader;

//   const AttendanceRow({
//     super.key,
//     required this.name,
//     required this.phone,
//     required this.status,
//     this.isHeader = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final bool isPresent = status == 'Present';
//     final Color statusColor = isPresent ? const Color(0xFF27AE60) : const Color(0xFFEB5757);
//     final Color statusBg = isPresent ? const Color(0xFFE8F8F0) : const Color(0xFFFDECEA);
//     final Color textColor = const Color(0xFF7F8C8D); 

//     return Container(
//       // The fix: Remove the separate color property and put it inside BoxDecoration
//       decoration: BoxDecoration(
//         color: isHeader ? const Color(0xFFF9F9F9) : Colors.white,
//         borderRadius: isHeader 
//             ? const BorderRadius.only(
//                 topLeft: Radius.circular(12), 
//                 topRight: Radius.circular(12),
//               ) 
//             : null,
//       ),
//       padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 4,
//             child: Text(
//               name,
//               style: GoogleFonts.poppins(
//                 fontSize: 13,
//                 fontWeight: isHeader ? FontWeight.w600 : FontWeight.w500,
//                 color: isHeader ? textColor : const Color(0xFF2C3E50),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 4,
//             child: Text(
//               phone,
//               textAlign: TextAlign.start, 
//               style: GoogleFonts.poppins(
//                 fontSize: 12,
//                 color: textColor,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: isHeader
//               ? Text(
//                 status,
//                 textAlign: TextAlign.end,
//                   style: GoogleFonts.poppins(
//                       fontSize: 12, 
//                       fontWeight: FontWeight.w600, 
//                       color: textColor,
//                     ),
//                   )
//                 : Align(
//                     alignment: Alignment.centerRight,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
//                       decoration: BoxDecoration(
//                         color: statusBg,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min, 
//                         children: [
//                           Icon(
//                             isPresent ? Icons.check_circle_outline : Icons.cancel_outlined,
//                             size: 16,
//                             color: statusColor,
//                           ),
//                           const SizedBox(width: 6),
//                           Text(
//                             status,
//                             style: GoogleFonts.poppins(
//                               color: statusColor,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 13,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }

class AttendanceRow extends StatelessWidget {
  final String name, phone, status;
  final bool isHeader;
  final Color? backgroundColor;
  final Function(String)? onStatusChanged;

  const AttendanceRow({
    super.key, required this.name, required this.phone, required this.status,
    this.isHeader = false, this.backgroundColor, this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasStatus = status.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: isHeader ? const Color(0xFFF9F9F9) : backgroundColor,
        borderRadius: isHeader ? const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)) : null,
      ),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        children: [
          Flexible(flex: 4, fit: FlexFit.tight, child: Text(name, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: isHeader ? FontWeight.w600 : FontWeight.w500, color: isHeader ? const Color(0xFF7F8C8D) : const Color(0xFF2C3E50)))),
          Flexible(flex: 4, fit: FlexFit.tight, child: Text(phone, style: GoogleFonts.poppins(fontSize: 11.sp, color: const Color(0xFF7F8C8D)))),
          Flexible(
            flex: 3, 
            fit: FlexFit.tight, 
            child: isHeader
                ? Align(alignment: Alignment.centerRight, child: Text(status, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xFF7F8C8D))))
                : Align(
                    alignment: Alignment.centerRight,
                    child: PopupMenuButton<String>(
                      onSelected: onStatusChanged,
                      offset: const Offset(0, 45),
                      // Styled items to match reference image
                      itemBuilder: (context) => [
                        _buildPopupItem('Present', const Color(0xFF27AE60), const Color(0xFFE8F8F0), Icons.check_circle_outline),
                        _buildPopupItem('Absent', Colors.red, const Color(0xFFFDECEA), Icons.cancel_outlined),
                        _buildPopupItem('Late', Colors.orange, const Color(0xFFFFF4E5), Icons.access_time),
                      ],
                      child: !hasStatus
                        ? const Icon(Icons.keyboard_arrow_down, color: Colors.black)
                        : _buildStatusBadge(status),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

  // Helper for status badge on the main row
  Widget _buildStatusBadge(String label) {
    final bool isPresent = label == 'Present';
    final bool isAbsent = label == 'Absent';
    final Color color = isPresent ? const Color(0xFF27AE60) : isAbsent ? Colors.red : Colors.orange;
    final Color bg = isPresent ? const Color(0xFFE8F8F0) : isAbsent ? const Color(0xFFFDECEA) : const Color(0xFFFFF4E5);
    final IconData icon = isPresent ? Icons.check_circle_outline : isAbsent ? Icons.cancel_outlined : Icons.access_time;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: color),
          SizedBox(width: 4.w),
          Text(label, style: GoogleFonts.poppins(color: color, fontWeight: FontWeight.bold, fontSize: 11.sp)),
        ],
      ),
    );
  }

  // Helper to create the styled menu items
  PopupMenuItem<String> _buildPopupItem(String label, Color color, Color bg, IconData icon) {
    return PopupMenuItem(
      value: label,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16.sp, color: color),
            SizedBox(width: 8.w),
            Text(label, style: GoogleFonts.poppins(color: color, fontWeight: FontWeight.bold, fontSize: 12.sp)),
          ],
        ),
      ),
    );
  }
}