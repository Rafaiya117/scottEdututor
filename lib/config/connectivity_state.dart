import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/services/connectivity_services.dart';


final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityService();
});

final connectivityStatusProvider = StreamProvider<bool>((ref) {
  final service = ref.read(connectivityServiceProvider);
  return service.onStatusChange;
});
