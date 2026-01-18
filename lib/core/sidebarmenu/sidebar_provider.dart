import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/core/sidebarmenu/sidebar_menu_model.dart';

final selectedMenuProvider = StateProvider<MenuItemType?>((ref) => null);
final isSidebarCollapsedProvider = StateProvider<bool>((ref) => false);

