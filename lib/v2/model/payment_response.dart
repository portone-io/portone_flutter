class PaymentResponse {
  final String? paymentId;
  final String? identityVerificationId;
  final String? transactionType;
  final String? txId;
  final String? code;
  final String? message;

  PaymentResponse({
    this.paymentId,
    this.identityVerificationId,
    this.transactionType,
    this.txId,
    this.code,
    this.message,
  });

  bool get isSuccess => code == null;

  factory PaymentResponse.fromQueryParameters(Map<String, String> params) {
    return PaymentResponse(
      paymentId: params['paymentId'],
      identityVerificationId: params['identityVerificationId'],
      transactionType: params['transactionType'],
      txId: params['txId'],
      code: params['code'],
      message: params['message'],
    );
  }
}
