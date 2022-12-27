// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'supplemental/asymmetric_view.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  // TODO: Add a variable for Category (104)
  final Category category;

  const HomePage({this.category = Category.all, Key? key}) : super(key: key);

  // TODO: Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        // TODO: Adjust card heights (103)
        elevation: 0.0,
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                // The images are drawn with a BoxFit of .scaleDown by default (in this case).
                // Let's change that to .fitWidth so they zoom in a little and remove the extra whitespace.
                fit: BoxFit.fitWidth,
                // TODO: Adjust the box size (102)
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                  // We want to center the labels, and align the text to the bottom of each card,
                  // instead of the bottom of each image.
                  // Move the labels to the end (bottom) of the main axis and change them to be centered::
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
                    Text(
                      product.name,
                      style: theme.textTheme.button,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();

    // return List.generate(count, (int index) {
    //   return Card(
    //     clipBehavior: Clip.antiAlias,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         AspectRatio(
    //           aspectRatio: 18.0 / 11.0,
    //           child: Image.asset('assets/diamond.png'),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: const [
    //               Text('Title'),
    //               SizedBox(height: 8.0),
    //               Text('Description')
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // });
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    return AsymmetricView(
      // TODO: Pass Category variable to AsymmetricView (104)
      products: ProductsRepository.loadProducts(category),
    );
    // TODO: Pass Category variable to AsymmetricView (104)
    // return Scaffold(
    //   // TODO: Add app bar (102)
    //   appBar: AppBar(
    //     leading: IconButton(
    //       icon: const Icon(
    //         Icons.menu,
    //         semanticLabel: "Menu Button",
    //       ),
    //       onPressed: () {},
    //     ),
    //     title: const Text("Shrine"),
    //     actions: [
    //       IconButton(
    //         onPressed: () {
    //           print('Search button clicked');
    //         },
    //         icon: const Icon(
    //           Icons.search,
    //           semanticLabel: "Search",
    //         ),
    //       ),
    //       IconButton(
    //         onPressed: () {
    //           print('Filter button clicked');
    //         },
    //         icon: const Icon(
    //           Icons.tune,
    //           semanticLabel: "Filter",
    //         ),
    //       ),
    //     ],
    //   ),
    //   // TODO: Add a grid view (102)
    //   body: AsymmetricView(
    //     products: ProductsRepository.loadProducts(Category.all),
    //   ),
    //   // body: GridView.count(
    //   //   crossAxisCount: 2,
    //   //   padding: const EdgeInsets.all(16.0),
    //   //   //The childAspectRatio: field identifies the size of the items based on an aspect ratio (width over height).
    //   //   childAspectRatio: 8.0 / 9.0,
    //   //   // TODO: Build a grid of cards (102)
    //   //   children: _buildGridCards(context),
    //   // ),

    //   // body: Center(
    //   //   child: Text('You did it!'),
    //   // ),
    //   // TODO: Set resizeToAvoidBottomInset (101)
    //   //Doing this ensures that the keyboard's appearance does not alter the size of the home page or its widgets.
    //   resizeToAvoidBottomInset: false,
    // );
  }
}
