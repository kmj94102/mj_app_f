import 'package:flutter/material.dart';
import 'package:mj_app_f/style/color.dart';

class BaseContainer extends StatelessWidget {
  final BoxDecoration? decoration;
  final Widget contents;
  final EdgeInsetsGeometry? padding;

  const BaseContainer({
    super.key,
    this.decoration,
    required this.contents,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final defaultDecoration = BoxDecoration(color: ColorStyle.black);
    final defaultPadding = const EdgeInsets.symmetric(horizontal: 24);

    return Scaffold(
      body: Container(
        decoration: decoration ?? defaultDecoration,
        child: SafeArea(
          child: Padding(
            padding: padding ?? defaultPadding,
            child: Column(children: [Expanded(child: contents)]),
          ),
        ),
      ),
    );
  }
}

class HeaderBodyContainer extends StatelessWidget {
  final Widget header;
  final Widget body;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;

  const HeaderBodyContainer({super.key, required this.header, required this.body, this.decoration, this.padding});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      decoration: decoration,
      padding: padding,
      contents: Column(
        children: [
          header, Expanded(child: body)
        ],
      ),
    );
  }
}

class HeaderBodyBottomContainer extends StatelessWidget {
  final Widget header;
  final Widget body;
  final Widget bottom;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;

  const HeaderBodyBottomContainer({
    super.key,
    required this.header,
    required this.body,
    required this.bottom,
    this.decoration,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      decoration: decoration,
      padding: padding,
      contents: Column(
        children: [
          header,
          Expanded(child: body),
          bottom,
        ],
      ),
    );
  }
}
