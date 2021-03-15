import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/models/product.dart';
import 'package:online_shop/src/business_logic/services/api_services/prodcut-api.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';
import 'package:online_shop/src/views/ui/details_screen.dart';
import 'package:online_shop/src/views/utils/item_card.dart';

List<String> categories = [
  "Kompjuterë",
  "Laptopë",
  "Celularë, tabletë",
  "Gaming",
  "Aparate fotografike",
  "TV, video dhe audio"
];
bool leading = false;

class BodyHome extends StatefulWidget {
  @override
  _BodyHomeState createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Dyqani Online",
            style: TextStyle(
              fontFamily: font,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
          child: SizedBox(
            height: 25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => buildCategory(index)),
          ),
        ),
        leading
            ? CircularProgressIndicator()
            : Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kDefaultPaddin,
                        crossAxisSpacing: kDefaultPaddin,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        return ItemCard(
                          product: products[index],
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  product: products[index],
                                ),
                              )),
                        );
                      }),
                ),
              ),
      ],
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          leading = true;
          selectedIndex = index;
          refresh(index);
          leading = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: font,
                fontSize: 13.5,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  refresh(int index) async {
    await getDataCategory(categories[index].toLowerCase());
    setState(() {
      products.shuffle();
    });
  }
}
