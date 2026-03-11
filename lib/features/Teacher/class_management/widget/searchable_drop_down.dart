import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchableDropdownField extends StatefulWidget {
  final String label;
  final List<String> items;
  final Function(String) onSelected;

  const SearchableDropdownField({
    super.key,
    required this.label,
    required this.items,
    required this.onSelected,
  });

  @override
  State<SearchableDropdownField> createState() => _SearchableDropdownFieldState();
}

class _SearchableDropdownFieldState extends State<SearchableDropdownField> {
  bool isExpanded = false;
  String? selectedValue;
  List<String> filteredItems = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
  }

  void filterSearchResults(String query) {
    setState(() {
      filteredItems = widget.items.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedValue ?? 'Select student email address',
                  style: GoogleFonts.poppins(fontSize: 13.sp, color: selectedValue == null ? Colors.grey : Colors.black),
                ),
                Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 20.sp),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            margin: EdgeInsets.only(top: 4.h),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Column(
              children: [
                // Search Bar matching the image
                TextField(
                  controller: searchController,
                  onChanged: filterSearchResults,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: searchController.text.isNotEmpty 
                      ? IconButton(icon: const Icon(Icons.close, size: 18), onPressed: () {
                        searchController.clear();
                        filterSearchResults('');
                      }) : null,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(height: 10.h),
                // Dropdown Items
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200.h),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredItems[index], style: GoogleFonts.poppins(fontSize: 14.sp)),
                        onTap: () {
                          setState(() {
                            selectedValue = filteredItems[index];
                            isExpanded = false;
                          });
                          widget.onSelected(selectedValue!);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}