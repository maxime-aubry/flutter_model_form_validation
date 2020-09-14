## [1.0.0] - 2020-09-14.

Provides full library with basic validators.
An example project is available to help developers to learn to use this library.
Have fun !

## [1.0.1] - 2020-09-14.

Version 1.0.0 was not compataible with flutter-web because of dart:io.
Il removed this import into three validators (FileMimeType, FileSize and ImageSize).
Those validators now use a byte array instead of a File object.

## [1.0.2] - 2020-09-14.

Removing dartdoc.
