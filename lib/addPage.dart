import 'package:flutter/material.dart';
import 'dataModels.dart';
import 'customExpansionTile.dart';

class AddPage extends StatefulWidget {
  final Dish dish;
  final List<List<OrderedDish>> orders;
  @override
  _AddPageState createState() => _AddPageState();

  AddPage({@required this.dish, @required this.orders});
}

class _AddPageState extends State<AddPage> {
  static List<Supplement> supplements = [
    Supplement(name: "Potatoes", price: 100.0, discount: 0),
    Supplement(name: "Mayonnaise", price: 50.0, discount: 0),
    Supplement(name: "Cheese", price: 110.0, discount: 0),
    Supplement(name: "Lettuce salad", price: 130.0, discount: 0),
    Supplement(name: "Ketchup", price: 105.0, discount: 0),
    Supplement(name: "French Fries", price: 140.0, discount: 0),
    Supplement(name: "Bread", price: 30.0, discount: 0),
  ];


  List<bool> values = [];
  List<OrderedDish> listDish =[];
  @override
  Widget build(BuildContext context) {
    for (int j = 0; j < widget.orders.length; j++) {
      values.add(false);
      listDish.add(OrderedDish(dish: widget.dish,selectedSupplements: [],));
    }
    int i = 0;
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
                            BoxShadow(color: Colors.grey[300], blurRadius: 10)
                          ]),
                      height: 106.0,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Choose your",
                              style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                            Text("Orders",
                                style: TextStyle(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
                                    decoration: TextDecoration.none)),
                          ],
                        ),
                      ),
                    ),
//                    Divider(
//                      color: Colors.grey,
//                    ),
                    Container(
                        height: 424,
                        child:  ListView(
                                children: widget.orders.map((order) {
                                 i++;
                                 print("iii"+i.toString());
                                 return Column(
                                  children: <Widget>[
                                     CustomExpansionTile(
                                      children: widget.dish.supplements.map((supplement) {
                                        return ExpandItem(
                                          supplement: supplement,
                                          dish: listDish[i-1],
                                        );
                                      }).toList(),
                                      title: Text("Order $i"),
                                      initiallyExpanded: false,
                                      onExpansionChanged: (isExpanded) {
                                        listDish[i-1].quantity=1;
                                        if(isExpanded){
                                          order.add(listDish[i-1]);
                                        }else{
                                          order.removeAt(order.indexOf(listDish[i-1]));
                                        }
                                      },
                                    ),
                                  ],
                                );
                              }).toList())),

                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
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
                      for(int i=0;i<widget.orders.length;i++){
                        widget.orders[i].removeAt(widget.orders[i].indexOf(listDish[i]));
                      }
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
  final OrderedDish dish;
  final Supplement supplement;

  @override
  _ExpandItemState createState() => _ExpandItemState();

  @override
  ExpandItem({@required this.supplement, @required this.dish});
}

class _ExpandItemState extends State<ExpandItem> {
  bool value = false;
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
                  onChanged: (checked) {
                    setState(() {
                      value = checked;
                      if (checked) {
                        widget.dish.selectedSupplements.add(widget.supplement);
                      } else {
                        widget.dish.selectedSupplements.removeAt(
                            widget.dish.selectedSupplements.indexOf(widget.supplement));
                      }

                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Text(widget.supplement.name),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Text(
                widget.supplement.price.toString() + " DA",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
