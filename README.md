# depistazmu

A new Depistazmu project.

## Getting Started

### Intro

Structure of the project
```bash
.
├── README.md
├── android # Generate a key with keytool
│   ├── app
│   ├── build.gradle
│   ├── gradle
│   ├── gradle.properties
│   ├── gradlew
│   ├── gradlew.bat
│   ├── local.properties
│   └── settings.gradle
├── assets # Assets
│   ├── france_flag.png
│   ├── icon
│   ├── logo.png
│   ├── mauritius_flag.png
│   └── uk_flag.png
├── language # Language files (add yours), delete if needed
│   ├── en_EN.json
│   ├── en_MU.json
│   └── fr_FR.json
├── lib
│   ├── config # configure language here
│   ├── constants # constants for routes in here
│   ├── district_enum.dart # District for your country
│   ├── main.dart
│   ├── models
│   ├── repository # You can use firebase or any backend you want
│   ├── risk_enum.dart
│   ├── router.dart # Router config
│   ├── screens
│   ├── store_state_enum.dart
│   ├── stores
│   ├── utils
│   └── widgets
├── pubspec.lock
├── pubspec.yaml # Configs here
└── web
    ├── icons
    ├── index.html
    └── manifest.json

```

1. This project is using Flutter `beta` channel. First, switch to beta channel using:

```bash

flutter channel beta

```

