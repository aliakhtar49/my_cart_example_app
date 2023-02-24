import 'package:flutter/material.dart';
import '../model/PetModel.dart';


class ListItem extends StatelessWidget {
  PetModel model;
  final Function onClickedOnAdd;
  
  ListItem(this.model, this.onClickedOnAdd);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.lightGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 12, right: 25, top: 12, bottom: 12),
            width: 80,
            height: 80,
            child: Image.asset(
              model.imageName,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Text(
              model.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
              "${model.price} \$",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          if (model.addedToCart)
          Text("Added", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
          else
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              this.onClickedOnAdd(model);
            },
            child: Text(
              "ADD",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
