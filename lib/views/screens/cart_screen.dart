import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_and_reminder_app/models/course_model.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<CoursesModel>(
        builder: (context, coursesModel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: coursesModel.cart.length,
                  itemBuilder: (context, index) {
                    final course = coursesModel.cart[index];
                    return ListTile(
                      title: Text(course.title),
                      subtitle: Text('\$${course.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        onPressed: () {
                          coursesModel.removeFromCart(course);
                        },
                        icon: Icon(Icons.remove_shopping_cart),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: coursesModel.favorites.length,
                  itemBuilder: (context, index) {
                    final course = coursesModel.favorites[index];
                    return ListTile(
                      title: Text(course.title),
                      subtitle: Text('\$${course.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        onPressed: () {
                          coursesModel.removeFromFavorites(course);
                        },
                        icon: Icon(Icons.favorite),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}