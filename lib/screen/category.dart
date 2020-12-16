import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  static const routeName = '/category-screen';

  _expande(BuildContext context, String image, String title, Color color) {
    return ExpansionTile(
      // tilePadding: EdgeInsets.only(left: 15),
      backgroundColor: color,
      collapsedBackgroundColor: color,
      leading: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          // backgroundColor: Colors.,
        ),
        textAlign: TextAlign.left,
      ),
      title: Image.network(
        image,
        // height: 100,
        // width: 100,
        fit: BoxFit.fill,
        height: 150,
        width: 500,
      ),
      children: [
        ExpansionTile(
          title: Text(
            'Sub title',
          ),
          children: <Widget>[
            ListTile(
              title: Text('data'),
              onTap: () {},
            )
          ],
        ),
        ListTile(
          title: Text('data'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _expande(
            context,
            'https://kreditings.com/wp-content/uploads/2020/05/girls-png-hd-6.png',
            'Womenn',
            Color.fromRGBO(255, 236, 150, 0.4),
          ),
          _expande(
              context,
              'https://freepngimg.com/thumb/cartoon/4-2-cartoon-transparent.png',
              'KIDS',
              Color.fromRGBO(253, 181, 255, 0.4)),
          _expande(
            context,
            'https://png.pngtree.com/png-clipart/20190520/original/pngtree-child-child-children-boy-png-image_3916346.jpg',
            'MENS',
            Color.fromRGBO(181, 255, 239, 0.4),
          ),
          _expande(
            context,
            'https://kreditings.com/wp-content/uploads/2020/05/girls-png-hd-6.png',
            'Womenn',
            Color.fromRGBO(255, 236, 150, 0.4),
          ),
          _expande(
              context,
              'https://freepngimg.com/thumb/cartoon/4-2-cartoon-transparent.png',
              'KIDS',
              Color.fromRGBO(253, 181, 255, 0.4)),
          _expande(
            context,
            'https://png.pngtree.com/png-clipart/20190520/original/pngtree-child-child-children-boy-png-image_3916346.jpg',
            'MENS',
            Color.fromRGBO(181, 255, 239, 0.4),
          ),
        ]),
      ),
    );
  }
}
