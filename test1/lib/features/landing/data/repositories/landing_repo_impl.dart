import 'package:test1/features/landing/data/datasource/remote_datasource.dart';
import 'package:test1/features/landing/domain/repositories/landing_repository.dart';

class LandingRepoImpl extends LandingRepository {
  final RemoteDatasource datasource;
  LandingRepoImpl(this.datasource);
  @override
  Future<String> getToken() async {
    return await datasource.getToken();
  }
}
