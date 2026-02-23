import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/core/network/dio_provider.dart';
import 'package:test1/features/landing/data/datasource/remote_datasource.dart';

final remoteDatasourceProvider = Provider<RemoteDatasource>((ref) {
  final dio = ref.read(dioProvider);
  return RemoteDatasource(dio);
});
