[![CodeStyle](https://img.shields.io/badge/code%20style-%E2%9D%A4-FF4081.svg?style=for-the-badge)](https://dart.dev/tools/linter-rules)
[![Flutter](https://img.shields.io/badge/Flutter-0078D6?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-02569B?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![License Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-orange.svg?style=for-the-badge)](https://opensource.org/licenses/Apache-2.0)

<p align="center"> 
   <img height="250" src="art/flutter-logo.webp"/> 
</p>

<h1 align="center"> Rorty Flutter </h1>

# Rorty 📺 (work-in-progress for V2 👷🔧️👷‍♀️⛏)

## Getting Started

Flutter Clean Architecture in Rorty is a sample project that presents modern, approach to [Flutter](https://flutter.dev/) application development using [Dart](https://dart.dev/) and latest tech-stack.

The goal of the project is to demonstrate best practices, provide a set of guidelines, and present modern Flutter
application architecture that is modular, scalable, maintainable and testable. This application may look simple, but it
has all of these small details that will set the rock-solid foundation of the larger app suitable for bigger teams and
long application lifecycle management.

A flutter app built using Kotlin that consumes [Rick and Morty API](https://rickandmortyapi.com) to display characters,episodes,Location from the [TV Series](https://www.imdb.com/title/tt2861424/). It has been built following Clean Architecture Principle, Repository Pattern, MVVM Architecture in the presentation layer.

## Architecture
A well planned architecture is extremely important for an app to scale and all architectures have one common goal- to manage complexity of your app. This isn't something to be worried about in smaller apps however it may prove very useful when working on apps with longer development lifecycle and a bigger team.

Clean architecture was proposed by [Robert C. Martin](https://en.wikipedia.org/wiki/Robert_C._Martin) in 2012 in the [Clean Code Blog](http://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) and it follow the SOLID principle.

<p align="center"><img src="art/clean_arch.jpeg" alt="Clean Architecture"></p>

The circles represent different layers of your app. Note that:

- The center circle is the most abstract, and the outer circle is the most concrete. This is called the [Abstraction Principle](https://en.wikipedia.org/wiki/Abstraction_principle_(computer_programming)). The Abstraction Principle specifies that inner circles should contain business logic, and outer circles should contain implementation details.

- Another principle of Clean Architecture is the [Dependency Inversion](https://en.wikipedia.org/wiki/Dependency_inversion_principle). This rule specifies that each circle can depend only on the nearest inward circle ie. low-level modules do not depend on high-level modules but the other way around.

<p align="center"><img src="art/architecture.png" alt="Clean Architecture Diagram"></p>

### Why Clean Architecture?
- ```Loose coupling between the code``` - The code can easily be modified without affecting any or a large part of the app's codebase thus easier to scale the application later on.
- Easier to ```test``` code.
- ```Separation of Concern``` - Different modules have specific responsibilities making it easier for modification and maintenance.

### S.O.L.I.D Principles

- [__Single Responsibility__](https://en.wikipedia.org/wiki/Single-responsibility_principle): Each software component should have only one reason to change – one responsibility.

- [__Open-Closed__](https://en.wikipedia.org/wiki/Open%E2%80%93closed_principle#:~:text=In%20object%2Doriented%20programming%2C%20the,without%20modifying%20its%20source%20code.): You should be able to extend the behavior of a component, without breaking its usage, or modifying its extensions.

- [__Liskov Substitution__](https://en.wikipedia.org/wiki/Liskov_substitution_principle): If you have a class of one type, and any subclasses of that class, you should be able to represent the base class usage with the subclass, without breaking the app.

- [__Interface Segregation__](https://en.wikipedia.org/wiki/Interface_segregation_principle): It’s better to have many smaller interfaces than a large one, to prevent the class from implementing the methods that it doesn’t need.

- [__Dependency Inversion__](https://en.wikipedia.org/wiki/Dependency_inversion_principle): Components should depend on abstractions rather than concrete implementations. Also higher level modules shouldn’t depend on lower level modules.

## Layers

### Project Structure
<p align="center"><img src="art/project.png" alt="Project Structure" width="500"></p>

### Data
The ```data``` layer is responsible for selecting the proper data source for the domain layer. It contains the implementations of the repositories declared in the domain layer.

Components of data layer include:
- __model__

  -__dto__: Defines dto of ui model, also perform data transformation between ```domain```, ```response``` and ```entity``` models.

  -__local__: Defines the schema of SQLite database.

  -__remote__: Defines POJO of network responses.

- __local__: This is responsible for performing caching operations using [Floor](https://pub.dev/packages/floor).

- __remote__: This is responsible for performing network operations eg. defining API endpoints using [Retrofit/Dio](https://pub.dev/packages/retrofit).

- __repository__: Responsible for exposing data to the domain layer.

### Domain
This is the core layer of the application. The ```domain``` layer is independent of any other layers thus ] domain business logic can be independent from other layers.This means that changes in other layers will have no effect on domain layer eg.  screen UI (presentation layer) or changing database (data layer) will not result in any code change withing domain layer.

Components of domain layer include:
- __usecase__: They enclose a single action, like getting data from a database or posting to a service. They use the repositories to resolve the action they are supposed to do.

### Presentation
The ```presentation``` layer contains components involved in showing information to the user. The main part of this layer are the Views(widgets) and ViewModels.


## Screenshots

#### Android
<table>
  <tr>
    <td>Splash</td>
    <td>Light</td>
    <td>Dark</td>
  </tr>
  <tr>
    <td><img src="art/screenshots/android/splash.png" width=250></td>
    <td><img src="art/screenshots/android/characters.png" width=250></td>
    <td><img src="art/screenshots/android/characters-dark.png" width=250></td>
  </tr>
 </table>

#### iOS
<table>
  <tr>
    <td>Splash</td>
    <td>Light</td>
    <td>Dark</td>
  </tr>
  <tr>
    <td><img src="art/screenshots/ios/splash.png" width=250></td>
    <td><img src="art/screenshots/ios/characters.png" width=250></td>
    <td><img src="art/screenshots/ios/characters-dark.png" width=250></td>
  </tr>
 </table>

#### MacOS-Desktop
<table>
  <tr>
    <td>Light</td>
    <td>Dark</td>
  </tr>
  <tr>
    <td><img src="art/screenshots/desktop/home.png"></td>
    <td><img src="art/screenshots/desktop/home-dark.png"></td>
  </tr>
 </table>

#### WEB
<table>
  <tr>
    <td>Light</td>
    <td>Dark</td>
  </tr>
  <tr>
    <td><img src="art/screenshots/web/home.png"></td>
    <td><img src="art/screenshots/web/home-dark.png"></td>
  </tr>
 </table>

# Tech Stacks
This project uses many of the popular libraries, plugins and tools of the flutter ecosystem.
- [Stacked](https://pub.dev/packages/stacked) - An architecture and widgets for an MVVM inspired architecture in Flutter.
- [Provider](https://pub.dev/packages/provider) - A wrapper around InheritedWidget to make them easier to use and more reusable.
- [Get It](https://pub.dev/packages/get_it) - Dependency Injection library.
- [Retrofit](https://pub.dev/packages/retrofit) - A dio client generator using source_gen and inspired by Chopper and Retrofit.
- [Dio](https://pub.dev/packages/dio) - A powerful Http client for Dart, which supports Interceptors, FormData, Request Cancellation, File Downloading, Timeout etc.
- [Go Router](https://pub.dev/packages/go_router) - A declarative router for Flutter based on Navigation 2 supporting deep linking, data-driven routes and more.
- [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash) - Customize Flutter's default white native splash screen with background color and splash image. Supports dark mode, full screen, and more.
- [Shared Preferences](https://pub.dev/packages/shared_preferences) - Flutter plugin for reading and writing simple key-value pairs. Wraps NSUserDefaults on iOS and SharedPreferences on Android.
- [Easy Localization](https://pub.dev/packages/easy_localization) - Easy and Fast internationalizing and localization your Flutter Apps.
- [Url Launcher](https://pub.dev/packages/url_launcher) - Flutter plugin for launching a URL. Supports web, phone, SMS, and email schemes.
- [Floor](https://pub.dev/packages/floor) - The typesafe, reactive, and lightweight SQLite abstraction for your Flutter applications.
- [Logger](https://pub.dev/packages/logger) - Small, easy to use and extensible logger which prints beautiful logs.

### Code Analyze Tools
- [Lints](https://pub.dev/packages/flutter_lints) - This package contains a recommended set of lints for Flutter apps, packages, and plugins to encourage good coding practices.

## 🚀 Posts In Medium
[Article](https://medium.com/innovance-company-blog/flutter-clean-architecture-with-rorty-app-7e7a55f80009)

## 🤝 Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire,
and create. Any contributions you make are **greatly appreciated**.

1. Open an issue first to discuss what you would like to change.
2. Fork the Project
3. Create your feature branch (`git checkout -b feature/amazing-feature`)
4. Commit your changes (`git commit -m 'Add some amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a pull request

Please make sure to update tests as appropriate.

## ✍️ Authors

<a href="https://www.linkedin.com/in/mesut-g-33b41030" target="_blank">
  <img src="https://avatars.githubusercontent.com/u/30066734?v=4" width="70" align="left">
</a>

👤 **developersancho**

[![Linkedin](https://img.shields.io/badge/-linkedin-0077B5?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/mesut-g-33b41030/)
[![Medium](https://img.shields.io/badge/-medium-12100E?style=for-the-badge&logo=medium)](https://developersancho.medium.com/)

Feel free to ping me 😉

## License

```license
Copyright © 2022 - developersancho

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
