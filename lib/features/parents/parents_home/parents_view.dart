import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/parents/parents_home/parents_provider.dart';
import 'package:scoctt_edututo/features/parents/parents_home/widget/add_child_popup.dart';
import 'package:scoctt_edututo/features/parents/parents_home/widget/child_item_widget.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';

class ParentsView extends ConsumerWidget{
  ParentsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final addedChildren = ref.watch(addedChildrenProvider);
    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            children: [
              Padding(
                padding:EdgeInsets.only(top: 45.h,left: 7.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        //context.pop();
                      },
                      icon: SvgPicture.asset('assets/icons/menu_icon.svg'),
                    ),
                    SizedBox(width: 20.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome David',
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Monitor your child\'s Prograss',
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80.w,),
                    GestureDetector(
                      onTap: () {
                        //context.push('/parents_profile');
                        ref.read(bottomNavProvider.notifier).state = BottomNavItem.profile;
                        context.go('/main');
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile_image3.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
              child: Column(
                children: [
                  Text(
                    'View Your Child Progress',
                    style: GoogleFonts.poppins(fontSize: 20.sp, color: Colors.black),
                  ),
                  SizedBox(height: 20.h),

                  // 1. Static Linked Child
                  buildChildCard(
                    context,
                    name: "Maria",
                    email: "Satyyyy@gmail.com",
                    isLinked: true,
                  ),
                  SizedBox(height: 20.h),

                  // 2. Add Child Button
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      border: Border.all(color: const Color(0xFFD0AD6B), width: 3.w),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: TextButton(
                      // Pass ref to the dialog so it can update the provider
                      onPressed: () => showAddChildDialog(context, ref),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25.r,
                            backgroundColor: const Color(0xFFB4D333),
                            child: Icon(Icons.person_add_alt_1_outlined, color: Colors.black, size: 28.sp),
                          ),
                          SizedBox(width: 15.w),
                          Text('Add Child', style: GoogleFonts.poppins(fontSize: 20.sp, color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  
                  // 3. Newly Added Children (Reactive List)
                  ...addedChildren.map((child) {
                    int index = addedChildren.indexOf(child);
                    return Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: buildChildCard(
                        context,
                        name: child['name'],
                        email: child['email'],
                        isLinked: child['isLinked'],
                        onLink: () {
                          // Update the specific child in the list
                          final newList = List<Map<String, dynamic>>.from(addedChildren);
                          newList[index]['isLinked'] = true;
                          ref.read(addedChildrenProvider.notifier).state = newList;
                        },
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}