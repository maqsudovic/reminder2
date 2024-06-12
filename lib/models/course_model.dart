import 'package:flutter/material.dart';

class Course {
  final String title;
  final double price;

  Course({required this.title, required this.price});
}

class CoursesModel extends ChangeNotifier {
  final List<Course> _courses = [
    Course(title: 'Flutter Fundamentals', price: 100),
    Course(title: 'Dart Programming', price: 30),
    Course(title: 'UI/UX Design', price: 50),
  ];

  final List<Course> _cart = [];
  final List<Course> _favorites = [];

  List<Course> get courses => _courses;
  List<Course> get cart => _cart;
  List<Course> get favorites => _favorites;

  void addToCart(Course course) {
    _cart.add(course);
    notifyListeners();
  }

  void removeFromCart(Course course) {
    _cart.remove(course);
    notifyListeners();
  }

  void addToFavorites(Course course) {
    _favorites.add(course);
    notifyListeners();
  }

  void removeFromFavorites(Course course) {
    _favorites.remove(course);
    notifyListeners();
  }
}
