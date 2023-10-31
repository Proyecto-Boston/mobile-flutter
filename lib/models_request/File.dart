import 'dart:convert';

File FileFromJson(String str) => File.fromJson(json.decode(str));

String FileToJson(File data) => json.encode(data.toJson());

class File {
    int id;
    String name;
    String path;
    List<String> fileData;
    int size;
    int userId;
    int folderId;
    int nodeId;

    File({
        required this.id,
        required this.name,
        required this.path,
        required this.fileData,
        required this.size,
        required this.userId,
        required this.folderId,
        required this.nodeId,
    });

    factory File.fromJson(Map<String, dynamic> json) => File(
        id: json["id"],
        name: json["name"],
        path: json["path"],
        fileData: List<String>.from(json["fileData"].map((x) => x)),
        size: json["size"],
        userId: json["userId"],
        folderId: json["folderId"],
        nodeId: json["nodeId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "path": path,
        "fileData": List<dynamic>.from(fileData.map((x) => x)),
        "size": size,
        "userId": userId,
        "folderId": folderId,
        "nodeId": nodeId,
    };
}
