// This manages your list of children dynamically
import 'package:flutter_riverpod/legacy.dart';

final addedChildrenProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);