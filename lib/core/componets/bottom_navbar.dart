import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';


enum BottomNavItem { profile, home, settings }

class ReusableBottomNav extends ConsumerWidget {
  final BottomNavItem selectedItem;
  const ReusableBottomNav({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buildNavItem({
      required BottomNavItem item,
      required String asset,
      required String name,
      bool isHome = false,
    }) {
      final selected = selectedItem == item;
      return GestureDetector(
        onTap: () {
          debugPrint('*****tapped***** $item');
          ref.read(bottomNavProvider.notifier).state = item;
        },
        child: isHome
          ? Container(
            height: 72,
            width: 72,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Center(
              child: SvgPicture.asset(asset, width: 100),
            ),
          )
          : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              asset,
              width: 24,
              colorFilter: ColorFilter.mode(
                selected ? Colors.grey : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: TextStyle(
                fontSize: 10,
                color: selected ? Colors.grey : Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ],
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
              height: 70,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNavItem(
                    item: BottomNavItem.profile,
                    asset: 'assets/icons/profile.svg',
                    name: 'Profile',
                  ),
                  buildNavItem(
                    item: BottomNavItem.settings,
                    asset: 'assets/icons/settings.svg',
                    name: 'Settings',
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
                asset: 'assets/icons/home_icon.svg',
                name: 'Home',
                isHome: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}