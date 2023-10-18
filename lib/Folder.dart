import 'dart:convert';

Folder folderFromJson(String str) => Folder.fromJson(json.decode(str));

String folderToJson(Folder data) => json.encode(data.toJson());

class Folder {
    int id;
    String name;
    String path;
    int userId;
    int nodeId;

    Folder({
        required this.id,
        required this.name,
        required this.path,
        required this.userId,
        required this.nodeId,
    });

    factory Folder.fromJson(Map<String, dynamic> json) => Folder(
        id: json["id"],
        name: json["name"],
        path: json["path"],
        userId: json["userId"],
        nodeId: json["nodeId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "path": path,
        "userId": userId,
        "nodeId": nodeId,
    };
}
