# 🚀 Flutter Project Template

[![ci][ci_badge]][ci_badge_link]
[![License: MIT][license_badge]][license_badge_link]
[![style: very good analysis][badge]][badge_link]

This template is designed to kickstart your next Flutter project with a solid foundation and best practices.

## 🧩 Features

- **Best Practices**: Following Flutter's best practices for a scalable and maintainable codebase. 📏🛠️
- **Makefile**: Simplifies common tasks like running tests or linting with easy-to-use commands. 📂✨
- **Linter Rules**: Provided by `very_good_analysis`, ensuring code quality and consistency. 🔍✔️
- **Organized Test Folder Structure**: Keeping your tests well-structured and easy to manage. 📁✅
- **.editorconfig**: Maintains consistent coding styles between different editors and IDEs. 📝🔧
- **GitHub Actions Workflow**: CI workflow to ensure code quality. 🤖✔️

## 🛠️ Getting Started

1. Clone the repository:
    ```shell
    git clone https://github.com/your-username/flutter-project-template.git
    cd flutter-project-template
    ```
2. Install dependencies:
    ```shell
    flutter pub get
    ```

3. Run the app:
    ```shell
    flutter run
    ```

### Key Directories

- `android/`: Contains the Android-specific code and configurations.
- `ios/`: Contains the iOS-specific code and configurations.
- `lib/`: The heart of your Flutter project. All your Dart code goes here.
- `test/`: Contains the unit and widget tests for your application.

## 📋 Makefile Commands

The included Makefile provides handy commands to streamline your workflow:

* Clean the project:

```shell
make clean
```

* Run tests:

```shell
make test
```

* Format code:

```shell
make format
```

* Run checks (format, lint, tests):

```shell
make checks
```

_Note: run help target to see all the available commands!_

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or features.

[ci_badge]: https://github.com/ankandrew/flutter-project-template/actions/workflows/test.yaml/badge.svg

[ci_badge_link]: https://github.com/ankandrew/flutter-project-template/actions

[badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg

[badge_link]: https://pub.dev/packages/very_good_analysis

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg

[license_badge_link]: https://opensource.org/licenses/MIT
