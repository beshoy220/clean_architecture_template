# 🧱 Clean Architecture Template (Flutter)

A scalable Flutter project template based on **Clean Architecture** principles to help you build maintainable, testable, and production-ready applications.

This template separates concerns into clear layers so your app can grow without becoming messy.

---

# 🧠 Architecture Overview

Clean Architecture divides the app into **3 main layers per feature**:

- Presentation → UI + State Management
- Domain → Business Logic (pure Dart, no Flutter dependencies)
- Data → APIs, Databases, Models, Repository Implementations

Dependency rule:

> Presentation → Domain → Data  
> Outer layers depend on inner layers, never the opposite.

---

# 📁 Project Structure

```
├── core
│   ├── connection
│   ├── databases
│   │   ├── local_data
│   │   └── remote_data
│   │       ├── api
│   │       ├── firebase_database
│   │       └── supabase_database
│   ├── meta_data
│   ├── navigation
│   └── responsiveness
│
└── features
    ├── home
    │   ├── data
    │   ├── domain
    │   └── presentation
    │
    └── template
        ├── data
        │   ├── data_sources
        │   ├── models
        │   └── repo_implementation
        │
        ├── domain
        │   ├── entities
        │   ├── repo_interface
        │   └── usecases
        │
        └── presentation
            ├── state_manager
            └── ui
                ├── components
                ├── fragments
                └── screens
```

---

# 🔧 Core Folder Explanation

The `core` folder contains reusable utilities shared across features.

## connection

Handles:

- Network checking
- Connectivity status
- Internet helpers

## databases

Abstraction layer for data sources:

- `local_data` → Hive, SQLite, SharedPreferences
- `remote_data/api` → REST APIs (Dio, HTTP)
- `firebase_database` → Firebase services
- `supabase_database` → Supabase services

This allows you to switch providers easily later.

## meta_data

App-wide constants like:

- Colors
- Themes
- Strings
- Config values

## navigation

Centralized routing system:

- Not implemented yet (But the matrial route 3.0 is a great solution)

## responsiveness

Helpers for:

- Screen scaling
- Device adaptation
- Layout utilities

---

# 🚀 Feature Structure (Important)

Each feature is **independent** and contains its own layers.

Example:

```
features/
   authentication/
   home/
   profile/
```

This makes large apps manageable and modular.

---

# 🧩 Layer Responsibilities

## 1️⃣ Presentation Layer

Contains:

```
presentation/
   state_manager/
   ui/
```

### state_manager

Your choice:

- Bloc / Cubit
- Riverpod
- Provider
- GetX
- MobX

Responsible for:

- Calling use cases
- Managing UI state
- Emitting loading / success / error

### ui

Contains visual parts:

```
components → reusable widgets
fragments  → partial UI sections
screens    → full pages
```

---

## 2️⃣ Domain Layer (Most Important)

Pure Dart — no Flutter imports.

```
domain/
   entities/
   repo_interface/
   usecases/
```

### entities

Business objects.

Example:

```dart
class User {
  final String id;
  final String name;

  User({required this.id, required this.name});
}
```

Entities should NOT depend on APIs or databases.

---

### repo_interface

Contracts (Interface) that define what the app needs.

Example:

```dart
abstract class UserRepository {
  Future<User> getUser();
}
```

---

### usecases

Application logic.

Each use case = **one action**.

Example:

```dart
class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<User> call() {
    return repository.getUser();
  }
}
```

---

## 3️⃣ Data Layer

Calls data, model it and check data logic like get data from API or Cache.

```
data/
   data_sources/
   models/
   repo_implementation/
```

### data_sources

Actual data providers:


- Remote DB like: API calls, supabase or firebase
- Local DB: shared_pref, secured local DB or local lightSQL

---

### models

DTO objects that map JSON ↔ Entities.

Example:

```dart
class UserModel extends User {
  UserModel({required super.id, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
```

---

### repo_implementation

Implements domain repository using data sources.

```dart
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remote;

  UserRepositoryImpl(this.remote);

  @override
  Future<User> getUser() {
    return remote.getUser();
  }
}
```

---

# 🔄 Data Flow Example

```
UI
 ↓
State Manager (Bloc / Cubit)
 ↓
UseCase
 ↓
Repository Interface
 ↓
Repository Implementation
 ↓
Data Source (API / DB)
 ↓
Response
```

---

# 🧪 Why This Architecture?

✅ Scalable for large apps  
✅ Easy testing (mock repositories)  
✅ Replace backend without UI changes  
✅ Clear separation of concerns  
✅ Team-friendly structure  
✅ Production ready  

---

# 🏁 Getting Started

## 1️⃣ Clone

```bash
git clone <repo_url>
```

## 2️⃣ Install dependencies

```bash
flutter pub get
```

## 3️⃣ Run project

```bash
flutter run
```

---

# ➕ How To Add a New Feature

Example: `authentication`

## Step 1 — Create folder

```
features/authentication/
```

## Step 2 — Add layers

```
data/
domain/
presentation/
```

## Step 3 — Define entity

```
domain/entities/user.dart
```

## Step 4 — Create repository contract (Interface)

```
domain/repo_interface/auth_repo.dart
```

## Step 5 — Create use case

```
domain/usecases/login.dart
```

## Step 6 — Implement repository

```
data/repo_implementation/auth_repo_impl.dart
```

## Step 7 — Define Model

```
data/models/auth_model.dart
```

## Step 8 — Build Data sources 

```
data/datasources/remote_datasource.dart
data/datasources/local_datasource.dart

```

## Step 7 — Add state manager + UI

```
presentation/state_manager/
presentation/ui/screens/
```

Done ✅

---

# 🧠 Best Practices

- One use case = one action
- Never import Flutter inside domain
- Models extend entities
- UI never talks directly to data sources
- Keep features independent
- Use dependency injection (get_it / injectable)

---

# 📌 When Should You Use This Template?

Use it if your app:

- Will grow large
- Has multiple developers
- Uses APIs or databases
- Needs maintainability
- Requires testing

Avoid if:

- Small prototype
- One screen app
- Hackathon project

---


# ⭐ Tip for New Developers

If this architecture feels complex:

Start by understanding only:

> UI → UseCase → Repository → DataSource

Everything else becomes easy after that.
