# Flutter Application with Clean Architecture and Bloc (API Call With Harry Potter API)

This Flutter project is built using **Clean Architecture** principles with **Layer Separation**, **Dependency Injection**, and various state management solutions like **Bloc/Cubit** and **Provider**.

## Features

- **Clean Architecture**: The project follows the Clean Architecture pattern, ensuring clear separation of concerns between different layers.
- **Layered Design**: 
  - **Domain Layer**: Contains business logic and core entities.
  - **Data Layer**: Manages data retrieval from remote and local sources.
  - **Application Layer**: Handles UI and state management using Bloc/Cubit and Provider.
- **State Management**:
  - **Bloc/Cubit**: Utilized for managing complex state across the app.
  - **Provider**: For consume theme service.
- **Dependency Injection**: Implemented using `get_it` to handle dependencies, ensuring testability and flexibility.
- **Unit Testing**: All critical components are covered by unit tests to ensure functionality and catch regressions early.

## Extra Dependencies

- **get_it**: Dependency injection library to easily manage the dependencies in the app.
- **equatable**: For value equality in models and entities, reducing boilerplate code.
- **http**: For handling HTTP requests to fetch data from APIs.
- **dartz**: Functional programming library used for handling failures and option types.
- **cached_network_image**: To handle async image fetching status.

## Technologies Used

- **Flutter**: Framework for building the UI.
- **Dart**: Programming language used for app development.
- **Bloc/Cubit**: For state management and handling business logic.
- **Provider**: For simpler state management scenarios.
- **GetIt**: For dependency injection.
- **Equatable**: For simplifying equality checks.
- **Dartz**: For functional error handling (Either and Option types).
- **HTTP**: For making API calls.
- **Clean Architecture**: Separation of concerns between different layers.
- **Mockito**: For mocking dependencies in unit tests.
- **Flutter Test**: For writing unit and widget tests.(Still working on it.)


![Adsız tasarım (2)](https://github.com/user-attachments/assets/bfae50c9-1bfc-40fd-b74b-b2f20e538371)

