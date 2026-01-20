import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';
import 'package:scoctt_edututo/core/componets/custom_classcard.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/home/home_controller.dart';
import 'package:scoctt_edututo/features/Teacher/home/home_model.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';


class TeacherHomeView extends ConsumerWidget {
  TeacherHomeView({super.key});
  
  final TeacherHomepageController controller = TeacherHomepageController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = ref.watch(bottomNavProvider);
    final List<ClassCategory> categories = controller.getClassCategory();
    return BackgroundTemplate(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      body: Column(
        children: [
          Wrap(
            spacing:16,
            runSpacing: 16,
            children: categories.map((cat){
              return ClassCategoryCard(
                height: 140, 
                width: 140, 
                category: cat, 
                routename: '',
                borderColor: Colors.orange
              );
            }).toList(),
          ),
        ],
      ),
      // bottomNavigationBar: ReusableBottomNav(
      //   selectedItem: selectedItem,
      // ),
    );
  }
}
