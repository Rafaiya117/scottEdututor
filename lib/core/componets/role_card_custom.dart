import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/features/user_role/user_role_model.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';

class RoleCard extends ConsumerWidget {
  final double height;
  final double width;
  final UserRole role;

  const RoleCard({
    super.key,
    required this.height,
    required this.width,
    required this.role,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRole = ref.watch(selectedRoleProvider);
    final isSelected = selectedRole?.id == role.id;

    return GestureDetector(
      onTap: () {
        ref.read(selectedRoleProvider.notifier).state = role;
        context.push('/login'); 
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: height,
        width: width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: isSelected
            ? const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.white],
              stops: [0.42, 1.0],
            )
            : const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1F1F1F), Color(0xFF8D6C2F)],
            ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(role.svgPath, height: 48),
            const SizedBox(height: 12),
            Text(
              role.name,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
