# RawatAI — Rahul Rawat's Portfolio

RawatAI is Rahul Rawat's responsive portfolio for AI/ML and NLP opportunities, featuring AI engineering case studies, three published Android applications, professional links, and a downloadable resume.

This is a public static portfolio. It has no user accounts, authentication, database, or sign-in flow.

**Website:** https://rahulrwt99.github.io/

## What the website includes

- Mobile, tablet, and desktop layouts with adaptive navigation.
- AI/ML positioning, project evidence, capabilities, skills, and contact sections.
- Vastu AI case study and dedicated pages for all three applications.
- Email, GitHub, LinkedIn, and Google Play links.
- Resume PDF served with the website.
- Dark charcoal and green styling, blue contact borders, and equal-height desktop app cards.

The website presents project information. It does not run the Vastu language model or publish the Android applications themselves.

## Update the portfolio

| Change | File |
| --- | --- |
| Email, location, social profiles, and store links | `lib/core/config/portfolio_config.dart` |
| Project descriptions, technologies, and skills | `lib/data/portfolio_content.dart` |
| Resume | `web/resume/Rahul_Rawat_Resume.pdf` |
| Colors and text styles | `lib/core/theme/app_theme.dart` |
| Search and sharing metadata | `web/index.html` |

Keep the resume filename unchanged when replacing the PDF. Add a `PortfolioProject` entry to the projects list to introduce another project; its detail route is generated from its slug. Update statements about the total number of published apps when that count changes.

Push changes to `main` to start the **Validate and publish portfolio** workflow. It installs Flutter 3.41.7, restores locked dependencies, analyzes the source, runs the content and layout tests, builds the release, and publishes it to GitHub Pages. Pull requests run the checks without publishing. A manual run is available from the repository's Actions tab.

Check the workflow status in Actions after an update. The website changes when deployment succeeds. If validation fails, the previous successful website remains live. A new repository or Android release does not automatically add a portfolio card; update the portfolio content as part of that release.

To undo a bad content change, revert its commit and push the correction to `main`; the same workflow republishes it. The website address stays the same for normal updates.

## Local development

Use Flutter 3.41.7 to match the deployment workflow:

```bash
flutter pub get --enforce-lockfile
flutter run -d chrome
```

Before publishing:

```bash
flutter analyze --no-pub
flutter test --no-pub
flutter build web --release --no-pub --base-href / --no-web-resources-cdn
```

Release files are generated in `build/web`. The website uses Flutter SDK dependencies and serves its rendering resources from its own host.

## Project links

- `/#/` — home
- `/#/projects/vastu-ai` — Vastu AI
- `/#/projects/astro-panchang-calendar` — Astro Panchang Calendar
- `/#/projects/secure-offline-pdf-reader` — Secure Offline PDF Reader

Hash-based navigation lets project links open and refresh on GitHub Pages without a server rewrite rule.

## Hosting setup

Repository: `Rahulrwt99/Rahulrwt99.github.io`. GitHub Pages uses GitHub Actions as its publishing source. Only `build/web` is deployed. The historical `.openai/hosting.json` is retained for the previous host and is not deployed by GitHub Pages.

No paid hosting service or custom domain is configured.

