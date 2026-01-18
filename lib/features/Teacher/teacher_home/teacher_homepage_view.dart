import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/core/componets/custom_classcard.dart';
import 'package:scoctt_edututo/features/Teacher/teacher_home/teacher_homepage_controller.dart';
import 'package:scoctt_edututo/features/Teacher/teacher_home/teacher_homepage_model.dart';

class ClassSelectionView extends ConsumerWidget{
  ClassSelectionView({super.key});

  final TeacherHomepageController controller = TeacherHomepageController();

  @override
  Widget build(BuildContext context,WidgetRef ref){
    final List<ClassCategory> categories = controller.getClassCategory();

    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(16),
        child:Wrap(
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
      ) ,
    );
  }
}