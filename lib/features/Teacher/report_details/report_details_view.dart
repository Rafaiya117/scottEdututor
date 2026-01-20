import 'package:flutter/material.dart';
import 'package:scoctt_edututo/core/componets/custom_data_table.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/report_details/report_details_controller.dart';

class DataTableScreen extends StatelessWidget {
  const DataTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ReportDetailsController();

    return BackgroundTemplate(
      appBar: AppBar(title: const Text('Custom Data Table')),
      padding: const EdgeInsets.all(16),
      body: CustomDataTable(
        headers: controller.getHeaders(),
        rows: controller.getRows(),
        onViewMoreTap: (rowId) {
          debugPrint('View more clicked for ID: $rowId');

          // Example:
          // Navigator.pushNamed(context, '/details/$rowId');
        },
      ),
    );
  }
}
