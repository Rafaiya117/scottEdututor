import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/core/sidebarmenu/sidebar_menu_controller.dart';
import 'package:scoctt_edututo/core/sidebarmenu/sidebar_menu_model.dart';
import 'package:scoctt_edututo/core/sidebarmenu/sidebar_provider.dart';

class MenuItemCard extends ConsumerWidget {
  final double height;
  final double width;
  final String svgPath;
  final MenuItemType menuItem;
  final Color borderColor;
  final SidebarMenuController controller;
  final bool isCollapsed;

  const MenuItemCard({
    super.key,
    required this.height,
    required this.width,
    required this.svgPath,
    required this.menuItem,
    required this.borderColor,
    required this.controller,
    required this.isCollapsed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = ref.watch(selectedMenuProvider);
    final isSelected = selectedItem == menuItem;

    return GestureDetector(
      onTap: () {
        ref.read(selectedMenuProvider.notifier).state = menuItem;

        // navigate
        context.push(controller.routeFor(menuItem),);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: height,
        width: width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: isSelected ? borderColor.withOpacity(0.08) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svgPath, height: 42),
            const SizedBox(height: 10),
            Text(
              controller.labelFor(menuItem),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
