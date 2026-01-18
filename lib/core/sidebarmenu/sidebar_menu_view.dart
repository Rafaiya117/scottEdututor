import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/core/componets/custom_menu_card.dart';
import 'package:scoctt_edututo/core/sidebarmenu/sidebar_menu_controller.dart';
import 'package:scoctt_edututo/core/sidebarmenu/sidebar_provider.dart';

class SidebarMenuView extends ConsumerWidget {
  const SidebarMenuView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = SidebarMenuController();
    final isCollapsed = ref.watch(isSidebarCollapsedProvider);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isCollapsed ? 70 : 220, // collapsed vs expanded
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB3915C), Color(0xFF7B5E3A)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          if (!isCollapsed)
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          if (!isCollapsed) const SizedBox(height: 20),
          Flexible(
            child: ListView(
              padding: EdgeInsets.zero,
              children: controller.menuItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: MenuItemCard(
                    height: 50,
                    width: double.infinity,
                    svgPath: controller.getIconForMenu(item),
                    menuItem: item,
                    borderColor: Colors.transparent,
                    controller: controller,
                    isCollapsed: isCollapsed,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
