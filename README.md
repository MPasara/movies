# 🎬 Movie App

A Flutter app that displays popular movies, powered by [TMDb](https://www.themoviedb.org/) API.

---

## 📑 Table of Contents

1. [Environment Setup](#environment-setup)  
   - [Create a `.env` file](#create-a-env-file)  
   - [Getting your TMDb API key](#getting-your-tmdb-api-key)  
   - [Generate the Envied code](#generate-the-envied-code)  
   - [Run the app](#run-the-app)  
2. [Features](#features)
3. [Architecture & Decisions](#architecture--decisions)

---

## ⚙️ Environment Setup

This project uses the [envied](https://pub.dev/packages/envied) package to manage environment variables.

It follows the pattern described in Code With Andrea’s tutorial *“How to Store API Keys in Flutter: --dart-define vs .env files”*, by using `.env` files combined with `envied` for safe handling of API keys. The tutorial is available at this link:  
https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/

### Create a `.env` file

Copy the provided `.env.example` file and rename it to `.env`:

```bash
cp .env.example .env
Then open .env and replace the placeholder values with your own:

# TMDb API key (replace with your own key)
TMDB_API_KEY=your_api_key_here

# Base URL for TMDb API requests
TMDB_BASE_URL=https://api.themoviedb.org/3

# Base URL for TMDb images (poster, backdrop, etc.)
TMDB_IMAGE_BASE_URL=https://image.tmdb.org/t/p
Getting your TMDb API key
Go to TMDb and log in (or create an account).

In your Profile / Account settings → API tab, request or view your API key.
Once you get it, paste it under TMDB_API_KEY in .env.

Generate the Envied code
Run these commands in the project root:

flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
This will generate the env.g.dart file based on your .env and all other .g files that need to be generated

Run the app

flutter run
(If prompted, choose a device.)
```
## ✨ Features
Popular Movies Page – Displays a paginated list of popular movies from TMDb.

Infinite Scroll & Pull to Refresh – Browse endlessly with infinite scroll pagination, or refresh the list with pull to refresh.

Search – Search for movies directly on the popular movies page.

Movie Details Page – View detailed information about each movie, including poster, description, and more.

Favourites – Mark movies as favourites. Favourites are cached locally on the device for quick access.

Multilingual Support – Switch between English and Croatian languages in-app.

## 🏗️ Architecture & Decisions
State Management: The app uses Bloc to separate business logic from UI, ensuring predictable state handling.

Networking: Dio and Retrofit are used for HTTP requests to the TMDb API

Folder Structure: Organized with a feature-first approach (each feature has its own data, domain, and presentation layers).

Environment Management: Envied handles API keys securely via .env files.
