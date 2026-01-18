import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scoctt_edututo/config/app_router_config.dart';

// !---------------------------!
// !--------- Enum ------------!
// !---------------------------!

enum BottomNavItem {
  profile,
  home,
  settings,
}

/// !---------------------------!
/// !------- Provider ----------!
/// !---------------------------!

final bottomNavProvider = StateProvider<BottomNavItem>((ref) => BottomNavItem.home);

/// ----------------------------
/// Reusable Bottom Nav Widget
/// ----------------------------
class ReusableBottomNav extends ConsumerWidget {
  const ReusableBottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = ref.watch(bottomNavProvider);

    Widget buildNavItem({
      required BottomNavItem item,
      required String asset,
      bool isHome = false,
    }) {

    final bool selected = selectedItem == item;
      return GestureDetector(
        onTap: () {
          ref.read(bottomNavProvider.notifier).state = item;
          Navigator.pushNamed(context, bottomNavRoutes[item]!);
        },
        child: isHome
          ? Container(
            height: 64,
            width: 64,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                asset,
                width: 28,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          )
          : SvgPicture.asset(
            asset,
            width: 24,
            colorFilter: ColorFilter.mode(
              selected ? Colors.white : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
        );
      }
    return SizedBox(
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNavItem(
                    item: BottomNavItem.profile,
                    asset: 'assets/icons/profile.svg',
                  ),
                  const SizedBox(width: 60),
                  buildNavItem(
                    item: BottomNavItem.settings,
                    asset: 'assets/icons/settings.svg',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Center(
              child: buildNavItem(
                item: BottomNavItem.home,
                asset: 'assets/icons/home.svg',
                isHome: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
