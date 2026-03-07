import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';

final bottomNavProvider = StateProvider<BottomNavItem>((ref) => BottomNavItem.home);
