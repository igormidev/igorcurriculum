# My personal curriculum website
![](https://github.com/igormidev/igorcurriculum/blob/master/art/how_i_can_help_you_print.png?raw=true)

This repository contains the source code for my personal curriculum website, built with Flutter and published at [igorcurriculum.com](https://igorcurriculum.com).

It is not just a static resume. It is a portfolio site that presents my work through four main lenses: public packages, professional experience, technical edge, and finished SaaS attempts. The goal is to show both what I have built and how I think about engineering, product quality, and delivery.

## What this website covers

### My public packages
This section highlights a selection of Dart and Flutter packages I published publicly, including:

- `babel_text`
- `pricing_page`
- `dart_debouncer`
- `enchanted_collection`
- `enchanted_regex`
- `sandbox_logger`
- `youtube_shorts`
- `cursor_autocomplete_options`

The section is meant to show practical open source work, reusable UI components, and utility libraries that came out of real product needs.

### Experience
The experience area summarizes the most relevant parts of my professional background, including:

- Top Rated Upwork freelancer with 100% job success
- Senior Flutter work on an app with more than 800k users
- Health product delivery involving video and chat features
- Tech lead work on banking and fleet payment products

The intention is to make the repository useful as a public, inspectable curriculum instead of a plain PDF.

### Technical edge
This section explains what differentiates my work technically:

- Flutter since the beta era
- Backend range with Serverpod
- Strong architecture and maintainability focus
- Performance-first product thinking
- Offline, sync, and realtime awareness
- AI-assisted engineering workflows with agent orchestration

This is the part of the site that tries to answer not only "what have I done?" but also "why is my approach different?"

### SaaS attempts
The website also documents two complete SaaS products that I finished, published, and later open sourced as curriculum projects:

- [ZenScrap](https://github.com/igormidev/zenscrap)
- [Mustache Hub](https://github.com/igormidev/mustachehub)

Both products reached a real production state. They did not become the business outcomes I wanted, but they remain valuable examples of end-to-end product execution.

## Why this repository exists

- Present my work in a richer format than a traditional resume
- Show real code behind the portfolio itself
- Demonstrate product presentation, interaction polish, and responsive Flutter Web work
- Keep a public reference point for clients, recruiters, and collaborators

## Tech stack

- Flutter Web
- Dart
- Material 3
- `provider`
- `responsive_framework`
- `flutter_animate`
- `lottie`

The project is a responsive Flutter application with themed presentation, animated UI details, curated portfolio sections, and a generated static build committed in `docs/` for web hosting.

## Project structure

- `lib/`: application code and portfolio sections
- `art/`: source assets used by the app
- `web/`: Flutter web entry files
- `docs/`: generated web output used for deployment

## Run locally

Install dependencies and run the Flutter web app:

```bash
flutter pub get
flutter run -d chrome
```

To generate a production web build:

```bash
flutter build web --release
```

## Links

- Website: [igorcurriculum.com](https://igorcurriculum.com)
- GitHub: [github.com/igormidev](https://github.com/igormidev)
- LinkedIn: [linkedin.com/in/igor-midev](https://www.linkedin.com/in/igor-midev/)
- Upwork: [upwork.com/freelancers/igormidev](https://www.upwork.com/freelancers/igormidev)
