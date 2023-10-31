// ignore: camel_case_types
class Response {
  final int? statusCode;
  final String json;
  final String details;

  Response({
    this.statusCode,
    required this.json,
    required this.details,
  });

  factory Response.fromJson(Map<String, dynamic> json, {required int statusCode, required String details}) {
    return Response(
      statusCode: json['statusCode'] ?? 503,
      details: json['details'] ?? "El servicio actualmente no se encuentra disponible [SCALA]",
      json: json['json'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'json': json,
      'details': details,
    };
  }
}