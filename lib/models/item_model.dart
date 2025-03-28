class ItemModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final String location;
  final String imageUrl;
  final String userId;
  final String userName;
  final DateTime date;
  final bool isLost; // true for lost items, false for found items
  final double? latitude;
  final double? longitude;
  final String status; // 'open', 'closed', 'in_progress'

  ItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.imageUrl,
    required this.userId,
    required this.userName,
    required this.date,
    required this.isLost,
    this.latitude,
    this.longitude,
    required this.status,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      location: json['location'] as String,
      imageUrl: json['image_url'] as String,
      userId: json['user_id'] as String,
      userName: json['user_name'] as String,
      date: DateTime.parse(json['date'] as String),
      isLost: json['is_lost'] as bool,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'location': location,
      'image_url': imageUrl,
      'user_id': userId,
      'user_name': userName,
      'date': date.toIso8601String(),
      'is_lost': isLost,
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
    };
  }

  ItemModel copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    String? location,
    String? imageUrl,
    String? userId,
    String? userName,
    DateTime? date,
    bool? isLost,
    double? latitude,
    double? longitude,
    String? status,
  }) {
    return ItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      date: date ?? this.date,
      isLost: isLost ?? this.isLost,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      status: status ?? this.status,
    );
  }
}
