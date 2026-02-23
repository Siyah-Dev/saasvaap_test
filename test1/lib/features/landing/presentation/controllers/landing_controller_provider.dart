import 'package:flutter_riverpod/legacy.dart';
import 'package:test1/features/landing/data/repositories/landing_repo_provider.dart';
import 'package:test1/features/landing/presentation/controllers/landing_controller.dart';
import 'package:test1/features/landing/presentation/controllers/landing_state.dart';

final landingControllerProvider = StateNotifierProvider<LandingController, LandingState>((ref) {
  final repo = ref.read(landingRepoProvider);
  return LandingController(repo);
});
