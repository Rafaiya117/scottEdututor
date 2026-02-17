import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceRow extends StatelessWidget {
  final String name;
  final String phone;
  final String status;
  final bool isHeader;

  const AttendanceRow({
    super.key,
    required this.name,
    required this.phone,
    required this.status,
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPresent = status == 'Present';
    final Color statusColor = isPresent ? const Color(0xFF27AE60) : const Color(0xFFEB5757);
    final Color statusBg = isPresent ? const Color(0xFFE8F8F0) : const Color(0xFFFDECEA);
    final Color textColor = const Color(0xFF7F8C8D); 

    return Container(
      // The fix: Remove the separate color property and put it inside BoxDecoration
      decoration: BoxDecoration(
        color: isHeader ? const Color(0xFFF9F9F9) : Colors.white,
        borderRadius: isHeader 
            ? const BorderRadius.only(
                topLeft: Radius.circular(12), 
                topRight: Radius.circular(12),
              ) 
            : null,
      ),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: isHeader ? FontWeight.w600 : FontWeight.w500,
                color: isHeader ? textColor : const Color(0xFF2C3E50),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              phone,
              textAlign: TextAlign.start, 
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: textColor,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: isHeader
              ? Text(
                status,
                textAlign: TextAlign.end,
                  style: GoogleFonts.poppins(
                      fontSize: 12, 
                      fontWeight: FontWeight.w600, 
                      color: textColor,
                    ),
                  )
                : Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      decoration: BoxDecoration(
                        color: statusBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, 
                        children: [
                          Icon(
                            isPresent ? Icons.check_circle_outline : Icons.cancel_outlined,
                            size: 16,
                            color: statusColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            status,
                            style: GoogleFonts.poppins(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }