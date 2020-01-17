import 'package:flutter/material.dart';
import 'dataModels.dart';
import 'customExpansionTile.dart';

class AddPage extends StatefulWidget {
  final Dish dish;
  @override
  _AddPageState createState() => _AddPageState();

  AddPage(this.dish);
}

class _AddPageState extends State<AddPage> {

  static List<Supplement> supplements=[
    Supplement(name: "Potatoes", price: 100.0, discount: 0),
    Supplement(name: "Mayonnaise", price: 50.0, discount: 0),
    Supplement(name: "Cheese", price: 110.0, discount: 0),
    Supplement(name: "Lettuce salad", price: 130.0, discount: 0),
    Supplement(name: "Ketchup", price: 105.0, discount: 0),
    Supplement(name: "French Fries", price: 140.0, discount: 0),
    Supplement(name: "Bread", price: 30.0, discount: 0),

  ];


  static List<Dish> dishes = [
    Dish(
        name: "Capuccino",
        price: 50.0,
        discount: 0.0,
        imagePath: "images/breakfast.jpeg",
        stars: 4,
        supplements: supplements,
        numberReviews: 40),
    Dish(
        name: "Beef burger",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/beef_burger2.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Caramel milkshake",
        price: 500.0,
        discount: 0.0,
        imagePath: "images/dishes/caramel_coffe_milkshake.jpg",
        stars: 5,
        numberReviews: 40),
    Dish(
        name: "Cesar Salad",
        price: 650.0,
        discount: 0.0,
        imagePath: "images/dishes/cesar_salad.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Chocolate mousse",
        price: 320.0,
        discount: 0.0,
        imagePath: "images/dishes/chocolate_mousse.jpeg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Fish burger",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/fish-burger.jpeg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Steak and potatoes",
        price: 1100.0,
        discount: 0.0,
        imagePath:
        "images/dishes/Garlic-Butter-flank-Steak-and-Potatoes-Skillet-800x800.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Grilled chicken",
        price: 1200.0,
        discount: 0.0,
        imagePath: "images/dishes/grilled_chicken.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Grilled salmon",
        price: 1500.0,
        discount: 0.0,
        imagePath: "images/dishes/grilled_salmon.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Korean noodles",
        price: 800.0,
        discount: 0.0,
        imagePath: "images/dishes/korean_style_noodles.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Lemon tart",
        price: 500.0,
        discount: 0.0,
        imagePath: "images/dishes/lemon_tart.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Mangolian beef",
        price: 1100.0,
        discount: 0.0,
        imagePath: "images/dishes/mongolian_style_beef.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Raspberries milkshake",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/raspberries_milkshake.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Mushroom rizzoto",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/shrimp_rizzoto.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Soy sause noodles",
        price:800.0,
        discount: 0.0,
        imagePath: "images/dishes/soy_sauce_noodles.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Strawberry cheesecake",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/strawberry_cheesecake.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Ice Cream sundae",
        price: 400.0,
        discount: 0.0,
        imagePath: "images/dishes/sundae.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Sweet potatoe soup",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/sweet_potatoe_soup.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Tiramissu",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/tiramissu.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Chicken soup",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/tuskan_style_chicken_soup.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Pizza",
        price: 650.0,
        discount: 0.0,
        imagePath: "images/dishes/vegies_pizza.jpeg",
        stars: 4,
        numberReviews: 40),
  ];
  List<List<Dish>> orders=[dishes,dishes];
  List<bool> values=[false,false];

  @override
  Widget build(BuildContext context) {
    int i=0;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: Container(
            color: Colors.white,
            height: 600,
            width: MediaQuery.of(context).size.width - 50,
            child: Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            blurRadius: 10
                          )
                        ]
                      ),
                      height: 106.0,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0,top:15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Choose your",
                            style: TextStyle(
                                fontSize: 32.0, fontWeight: FontWeight.w700,color: Colors.black,decoration: TextDecoration.none),
                            ),
                            Text("Orders",
                                style: TextStyle(
                                    fontSize: 32.0, fontWeight: FontWeight.w200,color: Colors.black,decoration: TextDecoration.none)),
                          ],
                        ),
                      ),
                    ),
//                    Divider(
//                      color: Colors.grey,
//                    ),
                    Container(
                      height: 424,
                      child: ListView(
                        children: orders.map((item){
                           i++;
                           return Column(
                             children: <Widget>[
                               CustomExpansionTile(
                                 children: supplements.map((item){
                                   return
                                     ExpandItem(name: item.name,price: item.price,);
                                 }).toList(),

                                 title: Text("Order $i"),
                                 initiallyExpanded: false,
                                 onExpansionChanged: (isExpanded){

                                 },
                               ),
                             ],
                           );
                           }).toList())
                      ),


                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        color: Color.fromRGBO(253, 241, 141, 1.0),
                        child: Center(
                            child: Text(
                          "Done",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 18.0,
                              decoration: TextDecoration.none),
                        )),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(

                    onPressed: () {
                      Navigator.pop(context);
                    },
                    mini: true,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.clear,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandItem extends StatefulWidget {
  final String name;
  final double price;

  @override
  _ExpandItemState createState() => _ExpandItemState();

  @override

  ExpandItem({@required this.name,@required this.price});
}

class _ExpandItemState extends State<ExpandItem> {
  bool value=false;
  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      height: 60.0,
      child: Container(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
              checkColor: Colors.black,
              activeColor: Color.fromRGBO(253, 241, 141, 1.0),
              value: value,
              onChanged: (checked){
                setState(() {
                  value=checked;
                });
              },
        ),
              Padding(
                padding: const EdgeInsets.only(right:20,left:20),
                child: Text(widget.name),
              ),
            ],
          ),

            Padding(
              padding: const EdgeInsets.only(right:20,left:20 ),
              child: Text(widget.price.toString()+" DA",style: TextStyle(fontWeight: FontWeight.w700),),
            ),

          ],
        ),
      ),

    );
  }
}



