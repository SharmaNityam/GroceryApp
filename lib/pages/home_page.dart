import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store/components/grocery_item_tile.dart';
import 'package:grocery_store/model/cart_model.dart';
import 'package:grocery_store/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const CartPage();
        },)),
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
        ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const SizedBox(height: 48),

          //good day to you
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Good day,"),
          ),

          const SizedBox(height: 4),

          //Let's order fresh items
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Let's order some fresh items for you!",
              style: GoogleFonts.notoSans(
              fontSize: 36,
              fontWeight: FontWeight.bold),
              ),
          ),

          const SizedBox(height: 24),

          //Divider
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),

          const SizedBox(height: 24),

          //fresh items + grid
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Fresh Items",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
                ),
              ),
          ),

          //for the grid view expanded widget is being used
          Expanded(
            child: Consumer<CartModel>(builder: (context, value, child) {
              return GridView.builder(
                itemCount: value.shopItems.length,
                padding: const EdgeInsets.all(12.0),
            gridDelegate:
             const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/1.3,
              ), 
          itemBuilder: (context, index) {
            return GroceryItemTile(
              itemName: value.shopItems[index][0],
              itemPrice: value.shopItems[index][1],
              imagePath: value.shopItems[index][2],
              color: value.shopItems[index][3],
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).addItemToCart(index);
              },
            );
          },
        );
            },),
      ),
        ],
        ),
      ),
    );
  }
}