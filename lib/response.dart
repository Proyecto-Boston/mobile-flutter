// ignore: camel_case_types
class Response {
  final int statusCode;
  final String json;
  final String details;

  Response({
    required this.statusCode,
    required this.json,
    required this.details,
  });

  factory Response.fromJson(Map<String, dynamic> json, {required int statusCode, required String details}) {
    return Response(
      statusCode: json['statusCode'] as int,
      json: json['json'] as String,
      details: json['details'] as String,
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