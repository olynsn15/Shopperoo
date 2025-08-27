import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoperroo/components/grocery_item_tile.dart';
import 'package:shoperroo/model/cart_modal.dart';
import 'package:shoperroo/pages/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 72,
        width: 72,
        child: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CartPage();
              },
            ),
          ),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.shopping_bag,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),

              // good morning
              Text(
                "Good Morning, ",
                style: GoogleFonts.notoSans(
                  fontSize: 18,
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              // text
              Text(
                "Lets order some fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // divider
              Divider(),

              SizedBox(
                height: 10,
              ),

              // items grid
              Text(
                "Fresh Items",
                style: GoogleFonts.notoSans(
                  fontSize: 16,
                ),
              ),

              Expanded(child: Consumer<CartModal>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModal>(context, listen: false)
                              .addItemToCart(
                                  index); // adding items to the empty cart list in the modal page
                        },
                      );
                    },
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
