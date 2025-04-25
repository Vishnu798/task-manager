import 'package:objectbox/objectbox.dart';

@Entity()
class Task {
  @Id()
  int id = 0;
  
  String title;
  bool isCompleted;
  
  @Property(type: PropertyType.date)
  DateTime createdAt;
  
  Task({
    required this.title, 
    this.isCompleted = false,
    DateTime? createdAt,
  }) : this.createdAt = createdAt ?? DateTime.now();
}