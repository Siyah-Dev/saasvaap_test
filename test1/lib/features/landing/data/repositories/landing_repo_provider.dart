import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/features/landing/data/datasource/remote_datasource_provider.dart';
import 'package:test1/features/landing/data/repositories/landing_repo_impl.dart';
import 'package:test1/features/landing/domain/repositories/landing_repository.dart';

final landingRepoProvider = Provider<LandingRepository>((ref) {
  final datasource = ref.read(remoteDatasourceProvider);

  return LandingRepoImpl(datasource);
});
