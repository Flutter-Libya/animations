import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimationsHomePage(),
    );
  }
}

class AnimationsHomePage extends StatelessWidget {
  final List<Item> items = [
    Item('Item 1', 'Description for Item 1', Icons.star),
    Item('Item 2', 'Description for Item 2', Icons.favorite),
    Item('Item 3', 'Description for Item 3', Icons.bookmark),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animations Demo')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return OpenContainer(
            transitionType: ContainerTransitionType.fade,
            openBuilder: (context, _) {
              return DetailsScreen(item: items[index]);
            },
            closedBuilder: (context, openContainer) {
              return ListTile(
                leading: Icon(items[index].icon, color: Colors.blue),
                title: Text(
                  items[index].title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  items[index].description,
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: openContainer,
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Item item;

  DetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://images.unsplash.com/photo-1693103846227-dd69fd0ab535?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              item.description,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  // Add your button action here
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Text(
                    'Learn More',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Item {
  final String title;
  final String description;
  final IconData icon;

  Item(this.title, this.description, this.icon);
}
