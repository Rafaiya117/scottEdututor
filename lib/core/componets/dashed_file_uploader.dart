import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class FileUploadBox extends ConsumerWidget {
  final double height;
  final double width;
  final String text;
  final IconData icon;
  final Color borderColor;
  final VoidCallback onTap;

  const FileUploadBox({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.onTap,
    this.icon = Icons.note_add_outlined,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: DashedBorderPainter(color: borderColor),
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 36, color: Colors.grey.shade600),
              const SizedBox(height: 8),
              Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double radius;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1.5,
    this.dashWidth = 6,
    this.dashSpace = 4,
    this.radius = 12,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );

    _drawDashedPath(canvas, path, paint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        final extractPath = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(extractPath, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


// FileUploadBox(
//   height: 140,
//   width: double.infinity,
//   text: 'No questions yet. Click "Add Question" to start.',
//   borderColor: Colors.grey.shade400,
//   onTap: () {
//     // open file picker OR add question
//     print('Upload clicked');
//   },
// ),

// onTap: () {
//   ref.read(uploadedFileProvider.notifier).state = 'example.pdf';
// }
