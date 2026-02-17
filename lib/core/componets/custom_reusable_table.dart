import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ReusableStudentTable<T> extends StatelessWidget {
  final List<T> students;
  final String Function(T) getName;
  final String Function(T) getClassName;
  final String Function(T) getProgress;
  final Function(T) onViewMore;

  const ReusableStudentTable({
    super.key,
    required this.students,
    required this.onViewMore,
    required this.getName,
    required this.getClassName,
    required this.getProgress,
  });

  @override
  Widget build(BuildContext context) {
    const goldColor = Color(0xFFD4B483);
    const headerColor = Color(0xFFE6E4E2);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Ensure background is solid
        border: Border.all(color: goldColor, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(2.5),
            1: FlexColumnWidth(1.5),
            2: FlexColumnWidth(1.5),
            3: FlexColumnWidth(1.5),
          },
          border: TableBorder(
            horizontalInside: BorderSide(color: goldColor.withOpacity(0.4), width: 0.8),
          ),
          children: [
            _buildHeader(headerColor),
            // 3. Pass the generic item to the row builder
            ...students.map((s) => _buildDataRow(s)),
          ],
        ),
      ),
    );
  }

  TableRow _buildHeader(Color color) {
    return TableRow(
      decoration: BoxDecoration(color: color),
      children: ['Student Name', 'Class', 'Progress', ''].map((text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Text(text, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 13)),
      )).toList(),
    );
  }

  TableRow _buildDataRow(T item) {
    return TableRow(
      children: [
        _cell(getName(item)),
        _cell(getClassName(item)),
        _cell(getProgress(item)),
        _actionCell(item),
      ],
    );
  }

  Widget _cell(String text) => Padding(
    padding: const EdgeInsets.all(12),
    child: Text(text, style: GoogleFonts.poppins(color: Colors.black54, fontSize: 13)),
  );

  Widget _actionCell(T item) => TextButton(
    onPressed: () => onViewMore(item),
    child:Text('View More', style: GoogleFonts.poppins(color: Colors.blue, fontSize: 12)),
  );
}