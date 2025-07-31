class ResponseModel<T> {
  final Status? status;
  final T? data;

  ResponseModel({required this.status, this.data});

  Map<String, dynamic> toJson(Function(T) dataToJson) {
    return <String, dynamic>{
      'status': status,
      'data': data != null ? dataToJson(data as T) : null,
    };
  }

  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    Function(dynamic) dataFromJson,
  ) {
    return ResponseModel(
      status: json["status"] == null ? null : Status.fromJson(json["status"]),
      data: json['data'] != null && json['data'].isNotEmpty
          ? dataFromJson(json['data'])
          : null,
    );
  }
}

class Status {
  Status({required this.meta});

  final Meta? meta;

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }
}

class Meta {
  Meta({required this.code, required this.message});

  final String code;
  final String message;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(code: json["code"] ?? "", message: json["message"] ?? "");
  }
}
