# Business logic code for estimating demolition materials.

This is the business logic repository for project *Kiertotalous*, which was conducted as a part of the Oulu University
course *Research and Development Project*. This repository takes care of all the things that the frontend does not,
including:

- Providing the state necessary state classes
- Handling all the calculation logic
- Providing APIs for persisting the class instances
- Providing APIs for exporting reports in the form of `.xlsx` and `.pdf` files

## Setting the project up

After setting up Dart for your development environment [as instructed here](https://dart.dev/get-dart), run at least the
following commands:

1. Gets all the dependencies: `dart pub get`
2. Build freezed parts: `dart run build_runner build`
3. Run tests: `dart test`

## About freezed

Majority of the classes in this repository rely on [freezed](https://pub.dev/packages/freezed). It is a code generator
for data classes that provides easy immutability features, and automatic overrides for `toString`, == -operator, and
`hashCode`.
In addition to this, `freezed` is vital in that it abstracts away the magic of turning the class instances to JSON
format.

## Repository structure

In this section you can find the general overview of how this repository is structured.

### lib/src/large_properties

This subfolder contains all the necessary pieces for assessing the demolition materials for a large property that was
not built for residential use.

The classes in this subfolder are roughly separated into classes that need user input, and classes that provide views
into data. You can recognize data view classes by their name as they are prefixed with `total_`. For example,
`roofs.dart`
captures user information regarding the property roofs, and `total_roofs.dart` builds onto that class to provide even
more
data about roof properties.

#### Notable classes

- `lib/src/large_properties/large_properties_repository.dart` can be used to easily serialize all the user input classes
  into JSON. Additionally, offers methods for writing the JSON to a file.

### lib/src/small_properties

This subfolder contains all the necessary pieces for assessing the demolition materials for smaller buildings such as a
residential row house, or a small apartment building.

### lib/src/exporting

This subfolder contains the code for exporting large property and small property data into `.xlsx` or `.pdf` reports.

### lib/src/utils

This subfolder contains some random utilities that may be used from anywhere, but which are not designed to be used
outside this repository.

### lib/src/data_types

This subfolder contains various data types used in demolition material assessment.