# Notes App - Clean Architecture

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-blue.svg" alt="Flutter Version">
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License">
</p>

A simple yet powerful notes application built with Flutter. This project serves as a practical example of implementing **Clean Architecture** principles in a Flutter app, ensuring a codebase that is scalable, maintainable, and easily testable.

## ✨ Features

- **Create Notes:** Easily add new notes with a title and content.
- **View Notes:** A clean and organized list of all your notes.
- **Edit Notes:** Modify existing notes seamlessly.
- **Delete Notes:** Remove notes you no longer need.
- **Local Persistence:** All notes are saved securely on your device.

## 🏛️ Architecture & Tech Stack

This project follows the **Clean Architecture** pattern, dividing the app into three main layers:

1.  **Domain Layer:** Contains the core business logic, entities, and use cases. It is completely independent of any other layer.
2.  **Data Layer:** Responsible for data retrieval from local (or remote) sources. It implements the repositories defined in the domain layer.
3.  **Presentation Layer:** The UI of the application, which includes widgets, views, and state management (BLoC/Cubit). It interacts with the domain layer through use cases.

### Key Technologies Used:

- **Framework:** [Flutter](https://flutter.dev/)
- **State Management:** [flutter_bloc (Cubit)](https://bloclibrary.dev/) for predictable and decoupled state management.
- **Local Database:** [Hive](https://pub.dev/packages/hive) for fast and efficient local data storage.
- **Dependency Injection:** [get_it](https://pub.dev/packages/get_it) as a simple service locator.
- **Functional Programming:** [dartz](https://pub.dev/packages/dartz) to handle errors and exceptions gracefully using `Either`.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed on your machine. You can follow the official guide.

### Installation

1.  **Clone the repository:**
    (Remember to replace the URL with your own repository link)
    ```sh
    git clone https://github.com/MohamedOmarKhedr/notes_app_clean_arch.git
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd notes_app_clean_arch
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the code generator:**
    Since this project uses Hive, you need to run the build runner to generate the necessary adapter files.
    ```sh
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
5.  **Run the app:**
    ```sh
    flutter run
    ```

## 📄 License

This project is licensed under the MIT License.
