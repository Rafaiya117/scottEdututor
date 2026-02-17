import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/features/settings/settings_model.dart';

class SettingsTile extends ConsumerWidget {
  final SettingsItemModel item;
  const SettingsTile({super.key, required this.item});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return InkWell(
      onTap: item.onTap,
      child: Padding(
        padding:EdgeInsets.symmetric(vertical: 15.h,horizontal: 16.w),
        child: Row(
          children: [
            SvgPicture.asset(
              item.svgIconPath,
              width: 20.w,
              height: 20.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 14),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style:GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: GoogleFonts.poppins(
                      // ignore: deprecated_member_use
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
