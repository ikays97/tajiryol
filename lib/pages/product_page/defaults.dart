import 'package:flutter/material.dart';

// bottom default consts

class Good {
  String name;
  String image;
  String brand;
  String supplier;
  List<int> sizes;
  List<Color> colors;
  String description;
  List<Product> similars;
  String deliveryTime;
  String deliveryCharge;
  double standardPrice;
  double discountPrice;
  double cartPrice;
  Good({
    this.name = "Polo T-Shirt Gara 43534 XL",
    this.image = url,
    this.brand = "Marco Polo",
    this.supplier = "Merdan",
    this.sizes = olcegler,
    this.colors = renkler,
    this.description = about,
    this.similars,
    this.deliveryTime = "1-2 sagat",
    this.deliveryCharge = "10 manat",
    this.standardPrice = 339.99,
    this.discountPrice = 229.99,
    this.cartPrice = 229.99,
  });
}

// TODO interactive product viewer
class Product {
  String name;
  String image;
  String brand;
  double standardPrice;
  double discountPrice;
  double cartPrice;
  Product({
    this.name,
    this.image,
    this.brand,
    this.standardPrice,
    this.discountPrice,
    this.cartPrice,
  });
}

const Color mostUsedColor = Color(0xFF979595);

const TextStyle productLabelStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

const String url =
    "https://cdn.dsmcdn.com/mnresize/415/622/ty54/product/media/images/20210112/17/52212067/70085589/3/3_org.jpg";

const String text =
    "Item Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla porro non cupiditate illum.";

const String about =
    "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusamus impedit ipsam cumque. Fugiat amet nisi ullam, ad molestiae rerum consequatur fuga optio cumque consectetur! Veniam enim eius quo voluptates, aperiam nostrum error ipsam nihil libero cumque cum sit officia in repudiandae quis debitis voluptatum quod sequi asperiores. Vitae, fuga delectus.";

const List<Color> renkler = [
  Color(0xFF38D8BD),
  Color(0xFFB4BDC9),
  Color(0xFFEE9055),
  Color(0xFF7687E9),
  Color(0xFFF73A00),
  Color(0xFF14EE14),
  Color(0xFFCF1DA3),
  Color(0xFF05081A),
];

const List<int> olcegler = [39, 40, 41, 42, 43, 44, 45, 46, 47, 48];

List<Product> products = [
  Product(
      name: 'T-Shirt Aju Buju Falan Fulan Haryt Ady',
      brand: 'Maraton',
      image: url,
      standardPrice: 64,
      discountPrice: 54,
      cartPrice: 50),
  Product(
      name: 'T-Shirt Aju Buju Falan Fulan Haryt Ady',
      brand: 'Maraton',
      image: url,
      standardPrice: 64,
      discountPrice: 54,
      cartPrice: 50),
  Product(
      name: 'T-Shirt Aju Buju Falan Fulan Haryt Ady',
      brand: 'Maraton',
      image: url,
      standardPrice: 64,
      discountPrice: 54,
      cartPrice: 50),
  Product(
      name: 'T-Shirt Aju Buju Falan Fulan Haryt Ady Falan Fulan',
      brand: 'Maraton',
      image: url,
      standardPrice: 64,
      discountPrice: 54,
      cartPrice: 50),
  Product(
      name: 'T-Shirt Aju Buju Falan Fulan Haryt Ady Falan Fulan ',
      brand: 'Maraton',
      image: url,
      standardPrice: 64,
      discountPrice: 54,
      cartPrice: 50),
  Product(
      name: 'T-Shirt Aju Buju Falan Fulan Haryt Ady Falan Fulan ',
      brand: 'Maraton',
      image: url,
      standardPrice: 64,
      discountPrice: 54,
      cartPrice: 50),
  Product(
      name: 'T-Shirt Aju Buju Falan Fulan Haryt Ady Falan Fulan ',
      brand: 'Maraton',
      image: url,
      standardPrice: 64,
      discountPrice: 54,
      cartPrice: 50),
];

// top^ default consts
