import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardCarrossel extends StatefulWidget {
  final String image;
  final double rating;
  final String title;
  final double price;
  const CardCarrossel(
      {required this.image,
      required this.rating,
      required this.title,
      required this.price});

  @override
  _CardCarrosselState createState() => _CardCarrosselState();
}

class _CardCarrosselState extends State<CardCarrossel> {
  get height => null;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Card(
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: widget.image,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text(widget.title),
                subtitle: Text('R\$ ${widget.price}'),
                trailing: Icon(Icons.star, color: Colors.yellow),
              ),
            ],
          ),
        ),
      ],
      options: CarouselOptions(
          height: 200.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlay: false,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayCurve: Curves.easeInOut,
          pauseAutoPlayOnTouch: true),
    );
  }
}
