import 'package:flutter/material.dart';
import 'dataModels.dart';

class MyOrdersPage extends StatefulWidget {
  final List<List<OrderedDish>> orders;
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();

  MyOrdersPage({@required this.orders});
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with TickerProviderStateMixin {
  TabController tabController;
  List<String> tabs = [];

  @override
  void initState() {
    super.initState();
    for(int i=1;i<=widget.orders.length;i++)
         tabs.add("Order $i");
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(180.0),
          child: Stack(
            children: <Widget>[
              AppBar(
                elevation: 5.0,
                backgroundColor: Colors.white,
                bottom: TabBar(
                  indicatorColor: Colors.redAccent,
                  labelPadding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: tabController,
                  labelColor: Colors.redAccent,
                  unselectedLabelColor: Color(0x8a000000),
                  tabs: tabs.map((item) {
                    return Text(item);
                  }).toList(),

                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 20.0, bottom: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "My",
                              style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text("orders",
                                style: TextStyle(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black)),
                          ],
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            if (tabs.length < 10) {
                              _addTab();
                              setState(() {});
                            }
                          },
                          backgroundColor: Colors.white,
                          elevation: 15,
                          child: Icon(
                            Icons.add,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 16.0,
                  )
                ],
              ),
            ],
          )),
      body: TabBarView(

        controller: tabController,
        children: widget.orders.map((item) {
          if(item.isNotEmpty){
            return OrderPage(
              index: widget.orders.indexOf(item),
              orders: item,
            );
          }else{
            return Center(child: Text("No ordered dishes yet",style: TextStyle(color: Colors.grey),));
          }

        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (tabs.length > 1) {
            _removeTab(tabController.index);
            setState(() {});
          }
        },
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }

  void _addTab() {
    tabs.add("Order " + (tabs.length + 1).toString());
    widget.orders.add([]);
    tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 0);
  }

  void _removeTab(int index) {
    tabs.removeAt(index);
    widget.orders.removeAt(index);
    tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 0);
  }
}

class OrderPage extends StatefulWidget {
    final int index;
    final List<OrderedDish> orders;

    const OrderPage({@required this.index,@required this.orders});
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
      return ListView.builder(
      itemCount: widget.orders.length,
      itemBuilder: (context,int index) {
        return Padding(
          padding: const EdgeInsets.only(right:5.0,left: 5.0,top: 2.0),
          child: Dismissible(
              direction: DismissDirection.endToStart,
              key: UniqueKey(),
              dismissThresholds: {DismissDirection.endToStart:0.95},
              onDismissed: (direction){
                if(direction==DismissDirection.endToStart){
                  setState(() {
                    widget.orders.removeAt(index);
                  });
                }
              },
              background: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right:20.0),
                      child: Icon(Icons.delete,color: Colors.white,size: 30.0,),
                    ),
                  ],
                ),
                color: Colors.red,
              ),
              child: OrderCard(dish: widget.orders[index])),
        );
      });
  }
}


class OrderCard extends StatefulWidget {
  final OrderedDish dish;
  OrderCard({@required this.dish});
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 120.0,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  widget.dish.dish.imagePath,
                  height: 100.0,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      widget.dish.dish.name,
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  )),
                  Expanded(
                    child: Text(
                      "${widget.dish.dish.price}\$",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(
                    Icons.keyboard_arrow_up,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.dish.quantity++;
                    });
                  },
                ),
                Text(
                  widget.dish.quantity.toString(),
                ),
                IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  onPressed: () {
                    setState(() {
                      if (widget.dish.quantity > 1) {
                        widget.dish.quantity--;
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
