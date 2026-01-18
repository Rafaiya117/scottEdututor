import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/core/componets/custom_radio_option.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_provider.dart';

class RadioScreen extends ConsumerWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(quizControllerProvider);
    final options = controller.getOptions();
    final selected = ref.watch(selectedRadioProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Radio Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: options.map((option) {
            return CustomRadioTile<int>(
              value: option.value,
              groupValue: selected,
              label: option.label,
              onChanged: (val) {
                ref.read(selectedRadioProvider.notifier).state = val;
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
