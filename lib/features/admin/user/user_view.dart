import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_gold_button.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/admin/user/user_model.dart';
import 'package:scoctt_edututo/features/admin/user/user_provider.dart';
import 'package:scoctt_edututo/features/admin/user/widget/add_user_popup.dart';
import 'package:scoctt_edututo/features/admin/user/widget/edit_userPopup.dart';
import 'package:scoctt_edututo/features/admin/user/widget/user_details_popup.dart';

class UserView extends ConsumerWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userProvider);

    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h), 
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 45.h, left: 7.0.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                ),
                SizedBox(width: 120.w),
                Text(
                  'User',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32.h),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GoldButton(
                width: 200.w,
                height: 37.h,
                text: 'Add User',
                onPressed: () => showAddUserPopup(context),
              ),
            ),
            SizedBox(height: 20.h),

            // The Search, Filter, and Table are all inside this container now
            buildUserTableContainer(users, ref, context),
          ],
        ),
      ),
    );
  }

  // --- Search & Filter Helper Widgets ---

  Widget _buildSearchField(String hint) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 13.sp),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.filter_alt_outlined, color: Colors.grey, size: 20),
          SizedBox(width: 4.w),
          Text(
            text,
            style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }

  Widget buildUserTableContainer(List<AppUser> users, WidgetRef ref, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9), // Grey portion
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          // Row for Search and Filter inside the Grey Area
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _buildSearchField('Search by name and Email'),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  flex: 1,
                  child: _buildFilterButton('All Roles'),
                ),
              ],
            ),
          ),
          
          _buildUserTableHeader(),

          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Body remains white
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
            ),
            child: Column(
              children: users.map((user) => _buildUserRow(user, ref, context)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTableHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFD4AF6A), width: 1)),
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: _headerText('User')),
          Expanded(flex: 4, child: _headerText('Email')),
          Expanded(flex: 2, child: _headerText('Roles')),
          Expanded(flex: 2, child: _headerText('Actions', textAlign: TextAlign.end)),
        ],
      ),
    );
  }

  Widget _buildUserRow(AppUser user, WidgetRef ref, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFD4AF6A), width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(child: _rowText(user.name)),
          SizedBox(width: 16.w),
          Expanded(child: _rowText(user.email)),
          SizedBox(width: 16.w),
          SizedBox(
            width: 80.w,
            child: Text(
              user.role,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: _getRoleColor(user.role),
              ),
            ),
          ),
          IntrinsicWidth(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                  onPressed: () {
                    showEditUserPopup(context);
                  },
                  icon: const Icon(Icons.edit_square, size: 20, color: Color(0xFF5A6B78)),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                  onPressed: () {
                    showViewUserDetailsPopup(
                      context,
                      name: user.name,
                      email: user.email,
                      role: user.role,
                    );
                  },
                  icon: const Icon(Icons.visibility_outlined, size: 20, color: Color(0xFF5A6B78)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getRoleColor(String role) {
    switch (role.toLowerCase()) {
      case 'admin': return Colors.red;
      case 'student': return Colors.green;
      case 'parent': return const Color(0xFFD4AF6A);
      case 'teacher': return Colors.blue;
      default: return Colors.black;
    }
  }

  Widget _headerText(String text, {TextAlign textAlign = TextAlign.start}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(fontSize: 15.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1A232E)),
    );
  }

  Widget _rowText(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(fontSize: 13.sp, color: const Color(0xFF5A6B78)),
    );
  }
}