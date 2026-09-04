# Rahul Rawat — Flutter Web Portfolio

A responsive, recruiter-focused portfolio positioning Rahul as an AI/ML Engineer who builds and ships production AI products.

## Configure personal links

Edit `lib/core/config/portfolio_config.dart`. Replace each value beginning with `REPLACE_WITH_` before deployment. Unconfigured actions are safely disabled in the UI rather than opening a broken link.

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

## Validate and build

```bash
flutter analyze
flutter test
flutter build web --release
```

The app intentionally uses only Flutter SDK packages. This keeps the web bundle lean and avoids unnecessary runtime dependencies.

## Routes

- `/` — portfolio home
- `/projects/vastu-ai` — flagship Vastu AI case study
- `/projects/astro-panchang-calendar` — published app overview
- `/projects/secure-offline-pdf-reader` — published app overview

