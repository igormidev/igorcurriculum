#!/usr/bin/env python3
"""Generate Igor Miranda's ATS-friendly illustrated curriculum PDF."""

from __future__ import annotations

import sys
from html import escape
from pathlib import Path

from PIL import Image as PillowImage
from PIL import ImageOps
from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.units import inch, mm
from reportlab.platypus import (
    HRFlowable,
    Image,
    KeepTogether,
    PageBreak,
    Paragraph,
    SimpleDocTemplate,
    Spacer,
    Table,
    TableStyle,
)


REPO_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_OUTPUT = REPO_ROOT / "output" / "pdf" / "igor_miranda_dart_flutter_resume.pdf"
TEMP_IMAGE_DIR = REPO_ROOT / "tmp" / "pdfs" / "resume_images"

GOOGLE_PLAY_URL = (
    "https://play.google.com/store/apps/details?id=com.root_hub_flutter"
)
APPLE_APP_STORE_URL = "https://apps.apple.com/br/app/root-hub/id6759731801"

INK = colors.HexColor("#202A32")
MUTED = colors.HexColor("#52606B")
ACCENT = colors.HexColor("#A05027")
ACCENT_DARK = colors.HexColor("#743619")
ACCENT_LIGHT = colors.HexColor("#F6E9E1")
LINE = colors.HexColor("#C8D0D5")
PAPER = colors.HexColor("#FFFCF8")


def _build_styles() -> dict[str, ParagraphStyle]:
    base = getSampleStyleSheet()
    return {
        "name": ParagraphStyle(
            "ResumeName",
            parent=base["Normal"],
            fontName="Helvetica-Bold",
            fontSize=22,
            leading=25,
            textColor=INK,
            spaceAfter=2,
        ),
        "headline": ParagraphStyle(
            "ResumeHeadline",
            parent=base["Normal"],
            fontName="Helvetica-Bold",
            fontSize=12.5,
            leading=15,
            textColor=ACCENT_DARK,
            spaceAfter=4,
        ),
        "tagline": ParagraphStyle(
            "ResumeTagline",
            parent=base["Normal"],
            fontName="Helvetica",
            fontSize=9.5,
            leading=12,
            textColor=MUTED,
            spaceAfter=6,
        ),
        "contact": ParagraphStyle(
            "ResumeContact",
            parent=base["Normal"],
            fontName="Helvetica",
            fontSize=8.35,
            leading=10.8,
            textColor=INK,
            splitLongWords=True,
            spaceAfter=1.5,
        ),
        "section": ParagraphStyle(
            "ResumeSection",
            parent=base["Heading2"],
            fontName="Helvetica-Bold",
            fontSize=10.8,
            leading=13,
            textColor=INK,
            keepWithNext=True,
            spaceBefore=6,
            spaceAfter=3,
        ),
        "subsection": ParagraphStyle(
            "ResumeSubsection",
            parent=base["Heading3"],
            fontName="Helvetica-Bold",
            fontSize=10.1,
            leading=12.2,
            textColor=INK,
            keepWithNext=True,
            spaceBefore=3,
            spaceAfter=1,
        ),
        "body": ParagraphStyle(
            "ResumeBody",
            parent=base["Normal"],
            fontName="Helvetica",
            fontSize=8.7,
            leading=11.35,
            textColor=INK,
            splitLongWords=True,
            spaceAfter=3,
        ),
        "small": ParagraphStyle(
            "ResumeSmall",
            parent=base["Normal"],
            fontName="Helvetica",
            fontSize=8,
            leading=10.2,
            textColor=MUTED,
            splitLongWords=True,
            spaceAfter=2,
        ),
        "period": ParagraphStyle(
            "ResumePeriod",
            parent=base["Normal"],
            fontName="Helvetica-Oblique",
            fontSize=8.2,
            leading=10.2,
            textColor=MUTED,
            keepWithNext=True,
            spaceAfter=1,
        ),
        "bullet": ParagraphStyle(
            "ResumeBullet",
            parent=base["Normal"],
            fontName="Helvetica",
            fontSize=8.55,
            leading=11.15,
            textColor=INK,
            leftIndent=10,
            firstLineIndent=-8,
            splitLongWords=True,
            spaceAfter=2.2,
        ),
        "caption": ParagraphStyle(
            "ResumeCaption",
            parent=base["Normal"],
            fontName="Helvetica",
            fontSize=7.7,
            leading=9.5,
            textColor=MUTED,
            alignment=TA_CENTER,
            spaceBefore=3,
        ),
        "visual_title": ParagraphStyle(
            "VisualTitle",
            parent=base["Heading1"],
            fontName="Helvetica-Bold",
            fontSize=16,
            leading=20,
            textColor=INK,
            alignment=TA_LEFT,
            spaceAfter=4,
        ),
    }


STYLES = _build_styles()


def _link(label: str, url: str) -> str:
    return f'<link href="{escape(url)}" color="#743619"><u>{escape(label)}</u></link>'


def _section_title(title: str) -> list:
    return [
        Paragraph(escape(title.upper()), STYLES["section"]),
        HRFlowable(width="100%", thickness=0.55, color=LINE, spaceAfter=4),
    ]


def _bullet(text: str) -> Paragraph:
    return Paragraph(f"- {escape(text)}", STYLES["bullet"])


def _rich_bullet(html_text: str) -> Paragraph:
    return Paragraph(f"- {html_text}", STYLES["bullet"])


def _experience_block(
    title: str,
    context: str,
    period: str,
    links: list[tuple[str, str]],
    bullets: list[str],
) -> KeepTogether:
    link_html = " | ".join(_link(label, url) for label, url in links)
    flowables = [
        Paragraph(
            f"{escape(title)} | {escape(context)}",
            STYLES["subsection"],
        ),
        Paragraph(escape(period), STYLES["period"]),
        Paragraph(link_html, STYLES["small"]),
        *[_bullet(item) for item in bullets],
        Spacer(1, 3),
    ]
    return KeepTogether(flowables)


def _linked_entry(title: str, url: str, description: str) -> Paragraph:
    return _rich_bullet(
        f"<b>{escape(title)}</b> - {_link(url, url)} - {escape(description)}"
    )


def _prepare_image(
    source: Path,
    output_name: str,
    max_size: tuple[int, int],
    quality: int = 86,
) -> Path:
    TEMP_IMAGE_DIR.mkdir(parents=True, exist_ok=True)
    destination = TEMP_IMAGE_DIR / output_name
    with PillowImage.open(source) as original:
        image = ImageOps.exif_transpose(original).convert("RGB")
        image.thumbnail(max_size, PillowImage.Resampling.LANCZOS)
        image.save(destination, "JPEG", quality=quality, optimize=True)
    return destination


def _portfolio_visuals() -> list:
    profile_path = _prepare_image(
        REPO_ROOT / "art" / "me.PNG",
        "igor_profile.jpg",
        (420, 480),
        quality=90,
    )
    root_hub_logo_path = _prepare_image(
        REPO_ROOT / "art" / "tumbnails" / "apps" / "root_hub.png",
        "root_hub_logo.jpg",
        (480, 480),
        quality=88,
    )
    root_hub_screenshot_path = _prepare_image(
        REPO_ROOT
        / "art"
        / "pdf"
        / "root_hub_scheduled_tables.png",
        "root_hub_scheduled_tables.jpg",
        (540, 1080),
        quality=84,
    )
    zenscrap_path = _prepare_image(
        REPO_ROOT / "art" / "tumbnails" / "saas" / "zenscrap.png",
        "zenscrap.jpg",
        (700, 450),
    )
    mustache_path = _prepare_image(
        REPO_ROOT / "art" / "tumbnails" / "saas" / "mustache_hub.png",
        "mustache_hub.jpg",
        (700, 450),
    )

    identity_table = Table(
        [
            [
                [
                    Image(str(profile_path), width=36 * mm, height=41.2 * mm),
                    Paragraph("Igor Miranda", STYLES["caption"]),
                ],
                [
                    Image(str(root_hub_logo_path), width=38 * mm, height=38 * mm),
                    Paragraph("Root Hub app identity", STYLES["caption"]),
                ],
            ]
        ],
        colWidths=[80 * mm, 80 * mm],
        hAlign="LEFT",
    )
    identity_table.setStyle(
        TableStyle(
            [
                ("VALIGN", (0, 0), (-1, -1), "TOP"),
                ("ALIGN", (0, 0), (-1, -1), "CENTER"),
                ("BACKGROUND", (0, 0), (-1, -1), PAPER),
                ("BOX", (0, 0), (-1, -1), 0.5, LINE),
                ("INNERGRID", (0, 0), (-1, -1), 0.35, LINE),
                ("LEFTPADDING", (0, 0), (-1, -1), 8),
                ("RIGHTPADDING", (0, 0), (-1, -1), 8),
                ("TOPPADDING", (0, 0), (-1, -1), 8),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
            ]
        )
    )

    root_hub_copy = [
        Paragraph("Root Hub in production", STYLES["subsection"]),
        Paragraph(
            "The published mobile product brings table discovery, scheduling, chat, "
            "result reporting, ratings, and rules assistance into one player journey.",
            STYLES["body"],
        ),
        _rich_bullet(f"{_link('Google Play', GOOGLE_PLAY_URL)}"),
        _rich_bullet(f"{_link('Apple App Store', APPLE_APP_STORE_URL)}"),
        _bullet("Approximately 60 monthly active users"),
        _bullet("Flutter mobile client and Serverpod backend"),
        _bullet("Jaspr deep-link and app-store redirect portal"),
        _bullet("Custom rating engine and rich table chat"),
    ]
    root_hub_table = Table(
        [
            [
                Image(
                    str(root_hub_screenshot_path),
                    width=37 * mm,
                    height=74 * mm,
                ),
                root_hub_copy,
            ]
        ],
        colWidths=[50 * mm, 110 * mm],
        hAlign="LEFT",
    )
    root_hub_table.setStyle(
        TableStyle(
            [
                ("VALIGN", (0, 0), (-1, -1), "TOP"),
                ("BACKGROUND", (0, 0), (-1, -1), ACCENT_LIGHT),
                ("BOX", (0, 0), (-1, -1), 0.65, ACCENT),
                ("LEFTPADDING", (0, 0), (-1, -1), 8),
                ("RIGHTPADDING", (0, 0), (-1, -1), 8),
                ("TOPPADDING", (0, 0), (-1, -1), 8),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 8),
            ]
        )
    )

    product_table = Table(
        [
            [
                [
                    Image(str(zenscrap_path), width=70 * mm, height=45 * mm),
                    Paragraph(
                        "ZenScrap - AI-assisted, self-healing web scraping SaaS",
                        STYLES["caption"],
                    ),
                ],
                [
                    Image(str(mustache_path), width=70 * mm, height=45 * mm),
                    Paragraph(
                        "Mustache Hub - structured template authoring SaaS",
                        STYLES["caption"],
                    ),
                ],
            ]
        ],
        colWidths=[80 * mm, 80 * mm],
        hAlign="LEFT",
    )
    product_table.setStyle(
        TableStyle(
            [
                ("VALIGN", (0, 0), (-1, -1), "TOP"),
                ("ALIGN", (0, 0), (-1, -1), "CENTER"),
                ("BOX", (0, 0), (-1, -1), 0.5, LINE),
                ("INNERGRID", (0, 0), (-1, -1), 0.35, LINE),
                ("LEFTPADDING", (0, 0), (-1, -1), 6),
                ("RIGHTPADDING", (0, 0), (-1, -1), 6),
                ("TOPPADDING", (0, 0), (-1, -1), 6),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
            ]
        )
    )

    return [
        PageBreak(),
        Paragraph("PORTFOLIO VISUALS", STYLES["visual_title"]),
        Paragraph(
            "Supplementary visuals from igorcurriculum.com and the featured "
            "products. All essential resume content appears as selectable text "
            "on the preceding pages for reliable ATS parsing.",
            STYLES["body"],
        ),
        Spacer(1, 5),
        identity_table,
        Spacer(1, 9),
        root_hub_table,
        Spacer(1, 9),
        product_table,
    ]


def _page_footer(canvas, doc) -> None:
    canvas.saveState()
    canvas.setTitle("Igor Miranda - Senior Dart and Flutter Specialist")
    canvas.setAuthor("Igor Miranda")
    canvas.setSubject("ATS-friendly Dart and Flutter curriculum")
    canvas.setKeywords(
        "Dart, Flutter, Serverpod, PostgreSQL, Riverpod, Firebase, PostHog, "
        "Shorebird, OpenAI, Jaspr, mobile engineering, backend engineering"
    )
    canvas.setStrokeColor(LINE)
    canvas.setLineWidth(0.4)
    canvas.line(doc.leftMargin, 14 * mm, A4[0] - doc.rightMargin, 14 * mm)
    canvas.setFont("Helvetica", 7.5)
    canvas.setFillColor(MUTED)
    canvas.drawString(doc.leftMargin, 9 * mm, "Igor Miranda - Dart / Flutter")
    canvas.drawRightString(
        A4[0] - doc.rightMargin,
        9 * mm,
        f"Page {doc.page}",
    )
    canvas.restoreState()


def _build_story() -> list:
    story = [
        Paragraph("IGOR MIRANDA", STYLES["name"]),
        Paragraph("Senior Dart / Flutter Specialist", STYLES["headline"]),
        Paragraph(
            "Production mobile and backend engineer building with Flutter since its beta era.",
            STYLES["tagline"],
        ),
        Paragraph(
            f"<b>Email:</b> {_link('igor-devwork@outlook.com', 'mailto:igor-devwork@outlook.com')}"
            f" | <b>Portfolio:</b> {_link('igorcurriculum.com', 'https://igorcurriculum.com')}"
            f" | <b>GitHub:</b> {_link('github.com/igormidev', 'https://github.com/igormidev')}",
            STYLES["contact"],
        ),
        Paragraph(
            f"<b>LinkedIn:</b> {_link('linkedin.com/in/igor-midev', 'https://www.linkedin.com/in/igor-midev/')}"
            f" | <b>Upwork:</b> {_link('upwork.com/freelancers/igormidev', 'https://www.upwork.com/freelancers/igormidev')}"
            f" | <b>WhatsApp:</b> {_link('+55 21 96710-3488', 'https://wa.me/5521967103488')}",
            STYLES["contact"],
        ),
        Spacer(1, 4),
        HRFlowable(width="100%", thickness=0.9, color=ACCENT, spaceAfter=4),
        *_section_title("Summary of qualifications"),
        _bullet(
            "Senior Dart and Flutter engineer with end-to-end experience across mobile, web, package authoring, architecture, PostgreSQL-backed APIs, and production delivery."
        ),
        _bullet(
            "Founder and full-stack engineer of Root Hub, a published iOS and Android community app with approximately 60 monthly active users."
        ),
        _bullet(
            "Top Rated Upwork freelancer with 100% job success and senior Flutter delivery experience on a product with more than 800 thousand users."
        ),
        _bullet(
            "Technical leadership experience in banking and fleet payments, with a performance-first and maintainability-focused engineering approach."
        ),
        *_section_title("Core technical skills"),
        Paragraph(
            "<b>Languages and frameworks:</b> Dart, Flutter, Flutter Web, Serverpod, "
            "PostgreSQL, Firebase, Supabase, Jaspr, dart_frog, shelf, Aqueduct, gRPC.",
            STYLES["body"],
        ),
        Paragraph(
            "<b>Architecture and state:</b> Riverpod, BLoC, Freezed, GetX, MobX, "
            "Triple, Flutter Hooks, go_router, auto_route, flutter_modular, clean "
            "architecture, package-based monorepos, custom lints.",
            STYLES["body"],
        ),
        Paragraph(
            "<b>Product and quality:</b> PostHog, Firebase Cloud Messaging, Firebase "
            "Analytics, AppsFlyer, Shorebird, secure storage, deep linking, i18n, "
            "offline-first flows, realtime systems, DevTools, profiling, mocktail, Mockito, RLS.",
            STYLES["body"],
        ),
        Paragraph(
            "<b>AI systems:</b> OpenAI Responses API, vector-store file search, RAG, "
            "server-sent events, LangChain, MCP integrations, agent orchestration, context engineering.",
            STYLES["body"],
        ),
        *_section_title("Featured published product"),
        Paragraph(
            "Root Hub | Founder and Full-stack Dart / Flutter Engineer",
            STYLES["subsection"],
        ),
        Paragraph(
            "Published on iOS and Android | Approximately 60 monthly active users",
            STYLES["period"],
        ),
        Paragraph(
            f"{_link('Google Play', GOOGLE_PLAY_URL)} | "
            f"{_link('Apple App Store', APPLE_APP_STORE_URL)}",
            STYLES["small"],
        ),
        _bullet(
            "Built a complete ROOT board-game community platform for nearby table discovery, hosting, invitations, scheduling, match reporting, player history, and unified rankings."
        ),
        _bullet(
            "Designed a custom opponent-relative rating algorithm with 13 faction-specific ratings, global aggregation, break-even score targets, favorite and underdog pressure, starter protection, winner bonuses, milestone history, leaderboards, and rebuild/backfill services."
        ),
        _bullet(
            "Delivered rich table chat with text, images, voice messages, replies, emoji reactions, typing/read state, unread counts, media validation, BlurHash placeholders, cloud storage, and localized push notifications."
        ),
        _bullet(
            "Implemented a Flutter client with Riverpod, Freezed, go_router, secure storage, FCM, PostHog, Shorebird code push, and Serverpod-generated contracts."
        ),
        _bullet(
            "Built a Dart and Serverpod backend with PostgreSQL models, authenticated versioned endpoints, transaction-safe match workflows, Google Places integration, background tasks, and multilingual responses."
        ),
        _bullet(
            "Integrated an OpenAI Responses API rules assistant with streamed reasoning and answers plus vector-store file search over multilingual ROOT rules, FAQs, and terminology."
        ),
        _bullet(
            "Created a Jaspr portal that detects iOS and Android, opens app deep links, preserves invite data across app-store fallbacks and Android install referrers, and hosts legal, support, and analytics pages."
        ),
        _bullet(
            "Created a custom lint plugin and deterministic checker for Flutter component boundaries, file naming, localization, endpoint versioning, required language parameters, translated server responses, and client/server locale parity."
        ),
        *_section_title("Professional experience"),
        _experience_block(
            "Freelance Senior Flutter Engineer",
            "Upwork",
            "March 2023 - Present",
            [("Upwork profile", "https://www.upwork.com/freelancers/igormidev")],
            [
                "Earned Top Rated status with 100% job success while delivering production Flutter work directly to clients.",
                "Built long-term client relationships through product quality, clear communication, and pragmatic execution.",
            ],
        ),
        _experience_block(
            "Senior Flutter Engineer",
            "Football social app with 800k+ downloads",
            "April 2023 - Present",
            [
                (
                    "DreamStock on Google Play",
                    "https://play.google.com/store/apps/details?id=dreamstock.com.dreamstock&hl=pt_BR&gl=US",
                )
            ],
            [
                "Delivered Pix payments, feed performance improvements, club selection queries, post UX refactors, in-app banners, rankings and badges, crowdfunding, and YouTube Shorts integration.",
                "Created the public youtube_shorts package to encapsulate production Shorts playback logic.",
            ],
        ),
        _experience_block(
            "Senior Flutter Engineer",
            "Alinea Health",
            "April 2023 - December 2023",
            [
                (
                    "Alinea on Google Play",
                    "https://play.google.com/store/apps/details?id=br.com.alineahealth.app&hl=pt&gl=US",
                )
            ],
            [
                "Contributed production features to a health-plan app, including video and provider chat experiences.",
                "Delivered within a task-demand freelance model in a health-product context.",
            ],
        ),
        _experience_block(
            "Tech Lead",
            "Target Bank and Target Fleet",
            "February 2022 - April 2023",
            [
                (
                    "Bank app",
                    "https://apps.apple.com/br/app/target-conta-digital/id1590916424?l=en",
                ),
                (
                    "Fleet app",
                    "https://play.google.com/store/apps/details?id=br.com.targetmp.cartaofrota&hl=pt_BR&gl=US",
                ),
            ],
            [
                "Designed maintainable and scalable Flutter architecture for banking and fleet-payment products.",
                "Led delivery of reliable apps for truck-driver digital banking and accredited gas-station payment operations.",
            ],
        ),
        *_section_title("Selected Dart and Flutter packages"),
        _linked_entry(
            "babel_text",
            "https://pub.dev/packages/babel_text",
            "Marker-based rich text with styles, callbacks, tooltips, selectable content, and inline widgets.",
        ),
        _linked_entry(
            "pricing_page",
            "https://pub.dev/packages/pricing_page",
            "Responsive Flutter pricing UI with async CTA states and polished plan presentation.",
        ),
        _linked_entry(
            "youtube_shorts",
            "https://pub.dev/packages/youtube_shorts",
            "Production-oriented vertical YouTube Shorts playback for Flutter.",
        ),
        _linked_entry(
            "dart_debouncer",
            "https://pub.dev/packages/dart_debouncer",
            "Multi-instance debounce flows for rapid Dart and Flutter interactions.",
        ),
        _linked_entry(
            "enchanted_collection",
            "https://pub.dev/packages/enchanted_collection",
            "Collection utilities and reusable algorithms for day-to-day Dart development.",
        ),
        _linked_entry(
            "enchanted_regex",
            "https://pub.dev/packages/enchanted_regex",
            "RegExp helpers focused on advanced group handling and practical parsing.",
        ),
        _linked_entry(
            "cursor_autocomplete_options",
            "https://pub.dev/packages/cursor_autocomplete_options",
            "Desktop and web autocomplete overlay aligned to the text cursor.",
        ),
        *_section_title("Other founder-built products"),
        _linked_entry(
            "ZenScrap",
            "https://github.com/igormidev/zenscrap",
            "AI-assisted scraping SaaS that converted natural-language extraction requests into tested scrapers and reusable APIs, with Serverpod, Flutter, analytics, billing, and a self-healing repair loop.",
        ),
        _linked_entry(
            "Mustache Hub",
            "https://github.com/igormidev/mustachehub",
            "Flutter and Firebase SaaS for structured Mustache templates, reusable variables, saved collections, shareable URLs, and live output generation.",
        ),
        *_section_title("Technical differentiators"),
        _bullet(
            "Flutter since beta, with deep practical knowledge of framework internals, rendering, widget lifecycle, state-management tradeoffs, navigation, deep links, and production debugging."
        ),
        _bullet(
            "Performance-first delivery focused on rebuild control, profiling, render-pipeline efficiency, memory behavior, and eliminating jank before it reaches users."
        ),
        _bullet(
            "Architecture discipline around package-based monorepos, internal packages, critical-path testing, custom lints, internationalization, offline/sync/realtime behavior, analytics, and backend security."
        ),
        _bullet(
            "Advanced AI-assisted engineering workflows with specialized agents, MCP tools, project skills, planning/execution/review loops, RAG pipelines, and context engineering."
        ),
        *_portfolio_visuals(),
    ]
    return story


def generate(output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    document = SimpleDocTemplate(
        str(output_path),
        pagesize=A4,
        leftMargin=17 * mm,
        rightMargin=17 * mm,
        topMargin=14 * mm,
        bottomMargin=19 * mm,
        title="Igor Miranda - Senior Dart and Flutter Specialist",
        author="Igor Miranda",
        subject="ATS-friendly Dart and Flutter curriculum",
    )
    document.build(
        _build_story(),
        onFirstPage=_page_footer,
        onLaterPages=_page_footer,
    )


def main() -> None:
    output = Path(sys.argv[1]).expanduser().resolve() if len(sys.argv) > 1 else DEFAULT_OUTPUT
    generate(output)
    print(f"PDF generated at: {output}")


if __name__ == "__main__":
    main()
