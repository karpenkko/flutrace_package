class FlutraceConfig {
  final String projectToken;
  final bool isProduction;
  final String environment;
  final Uri? customEndpoint;
  final Map<String, dynamic>? defaultMetadata;

  FlutraceConfig({
    required this.projectToken,
    this.isProduction = false,
    this.environment = 'development',
    this.customEndpoint,
    this.defaultMetadata,
  });
}
