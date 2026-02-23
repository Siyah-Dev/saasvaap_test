import 'package:dio/dio.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:test1/core/network/dio_error_maper.dart';
import 'package:test1/features/landing/domain/repositories/landing_repository.dart';
import 'package:test1/features/landing/presentation/controllers/landing_state.dart';

class LandingController extends StateNotifier<LandingState> {
  final LandingRepository repo;
  LandingController(this.repo) : super(LandingState());

  Future<bool?> getToken() async {
    state = state.copyWith(isLoading: true);
    try {
      final token = await repo.getToken();
      state = state.copyWith(isLoading: false, token: token);
      return true;
    } on DioException catch (e) {
      throw Exception(mapDioError(e));
    } catch (e) {
      throw Exception("Unexpected error occured");
    }
  }
}
