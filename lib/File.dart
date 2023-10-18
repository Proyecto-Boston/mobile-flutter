import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

File filesFromJson(String str) => File.fromJson(json.decode(str));

String filesToJson(File data) => json.encode(data.toJson());

class File {
    int? id;
    String name;
    String path;
    int? file1;
    int size;
    int userId;
    int folderId;
    int nodeId;

    File({
        this.id,
        required this.name,
        required this.path,
        this.file1,
        required this.size,
        required this.userId,
        required this.folderId,
        required this.nodeId,
    });

    factory File.fromJson(Map<String, dynamic> json) => File(
        id: json["id"],
        name: json["name"],
        path: json["path"],
        file1: json["file1"],
        size: json["size"],
        userId: json["userId"],
        folderId: json["folderId"],
        nodeId: json["nodeId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "path": path,
        "file1": file1,
        "size": size,
        "userId": userId,
        "folderId": folderId,
        "nodeId": nodeId,
    };

    
}