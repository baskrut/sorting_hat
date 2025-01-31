class AppBaseResponse<T extends Object?> {
  final String? errorText;
  final bool? isSuccess;
  final T? result;
  final String? body;

  AppBaseResponse({
    this.errorText,
    this.isSuccess,
    this.result,
    this.body,
  });

  @override
  String toString() {
    return 'AppBaseResponse{errorText: $errorText, hasConnectionError:, isSuccess: $isSuccess, result: $result, body: $body}';
  }
}
