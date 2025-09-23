# 🎬 Movie App

A Flutter app that displays popular movies, powered by [TMDb](https://www.themoviedb.org/) API.

---

## ⚙️ Environment Setup

This project uses the [envied](https://pub.dev/packages/envied) package to manage environment variables.

It follows the pattern described in Code With Andrea’s tutorial *“How to Store API Keys in Flutter: --dart-define vs .env files”*, by using `.env` files combined with `envied` for safe handling of API keys. The tutorial is available at this link:  
https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/

---

### 1. Create a `.env` file

Copy the provided `.env.example` file and rename it to `.env`:

```bash
cp .env.example .env
Then open .env and replace the placeholder values with your own:


Copy code
# TMDb API key (replace with your own key)
TMDB_API_KEY=your_api_key_here

# Base URL for TMDb API requests
TMDB_BASE_URL=https://api.themoviedb.org/3

# Base URL for TMDb images (poster, backdrop, etc.)
TMDB_IMAGE_BASE_URL=https://image.tmdb.org/t/p
2. Getting your TMDb API key
Go to TMDb and log in (or create an account).

In your Profile / Account settings → API tab, request or view your API key.

Once you get it, paste it under TMDB_API_KEY in .env.

3. Generate the Envied code
Run these commands in the project root:


Copy code
flutter clean
flutter pub get
dart run build_runner build -d
This will generate the env.g.dart file based on your .env.

4. Run the app

flutter run
(If prompted, choose a device.)
```
### 2. ✨ Features
```bash
Popular Movies Page – Displays a paginated list of popular movies from TMDb.

Infinite Scroll & Pull to Refresh – Browse endlessly with infinite scroll pagination, or refresh the list with pull to refresh.

Search – Search for movies directly on the popular movies page.

Movie Details Page – View detailed information about each movie, including poster, description, and more.

Favourites – Mark movies as favourites. Favourites are cached locally on the device for quick access.

Multilingual Support – Switch between English and Croatian languages in-app.
```
