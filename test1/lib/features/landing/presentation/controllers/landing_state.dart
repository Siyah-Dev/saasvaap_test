// ignore_for_file: public_member_api_docs, sort_constructors_first
class LandingState {
  final bool isLoading;
  final String token;
  final String? error;

  LandingState({this.isLoading = false, this.token = "", this.error});

  LandingState copyWith({
    bool? isLoading,
    String? token,
    String? error,
  }) {
    return LandingState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }
}
