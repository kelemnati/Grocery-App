import 'package:flutter/material.dart';
import 'package:understanding_bloc/features/home/bloc/home_bloc.dart';
import 'package:understanding_bloc/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.image))),
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          const SizedBox(
            height: 13,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${productDataModel.price}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(WishlistButtonClicked(
                            clickedItems: productDataModel));
                      },
                      icon: const Icon(Icons.favorite_border_outlined)),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                          CartButtonClicked(clickedItems: productDataModel));
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
