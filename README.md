# PDFix SDK example Java Gradle

Example project of PDFix SDK for Java Gradle.

## Description

For more information please visit [https://pdfix.net](https://pdfix.net).

## Setup

Run setup_gradle.sh to download and install all dependencies, then execute main class net.pdfix.App.
```
setup_gradle.sh
```

This will unpack the required class libraries and binary files 
- jar class library into app/libs 
- runtime native dynamic libraries into

Note: The script installs only native libraries for current platform. For example for mac M1 it's `bin/arm64/libpdf.dylib`. You can do this manually or add native runtimes for multiple platforms.
All resources are available on https://pdfix.net/download.

## Build and run application

```
gradle build
```
```
gradle run
```

## Have a question? Need help?
Let us know and we’ll get back to you. Write us to support@pdfix.net or fill the [contact form](https://pdfix.net/support/).