class PaymentGateway {
  static const String gatewayName = 'VNPD';

  static String redirectEndpoint() =>
      '/bss/payment/gateways/$gatewayName/redirect';

  static String methodsEndpoint() =>
      '/bss/payment/gateways/$gatewayName/methods';
}
