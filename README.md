<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A library for converting QR codes to SVG vector graphic code 

## Features

- Generate a SVG vector graphic code from a QR code (provided by the [qr package](https://pub.dev/packages/qr)).
- Optionally set `colorA` and `colorB` for a gradient color.

## Getting started

To start, import the dependency in your code:

```dart
import 'package:qr_svg_generator/qr_svg_generator.dart';
```

To generate a SVG vector graphic code call `generateQrSvgImage`:

```dart
final qrSvgImageCode = generateQrSvgImage(
  qrCode: myQrCode,
  imageSizeInPx: 500,
  title: "MySvg",
  colorA: Colors.blue,
  colorB: Colors.pink);
```

Now you can use the `toString()` method of your `qrSvgImage` instance to retrieve your SVG code for further use (e.g. safe to a .svg file):

```dart
saveTextFile(qrSvgImageCode.toString(), "mySvgFile.svg");
```