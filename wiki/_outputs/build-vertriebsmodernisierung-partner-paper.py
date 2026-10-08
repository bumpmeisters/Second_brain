from __future__ import annotations

import hashlib
import html
import importlib.util
import re
from pathlib import Path

from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle
from reportlab.lib.units import mm
from reportlab.platypus import (
    BaseDocTemplate,
    CondPageBreak,
    Flowable,
    Frame,
    ListFlowable,
    ListItem,
    NextPageTemplate,
    PageBreak,
    PageTemplate,
    Paragraph,
    Spacer,
    Table,
    TableStyle,
)
from reportlab.platypus.tableofcontents import TableOfContents


HERE = Path(__file__).resolve().parent
SOURCE = HERE / "vertriebsmodernisierung-mittelstand-partner-paper-2026-08-03.md"
OUTPUT = HERE / "vertriebsmodernisierung-fuer-den-mittelstand-partner-paper-2026-08-03.pdf"
BASE_SCRIPT = HERE / "build-authority-to-revenue-business-paper.py"


def load_base_module():
    spec = importlib.util.spec_from_file_location("business_paper_base", BASE_SCRIPT)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"Unable to import design base: {BASE_SCRIPT}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


bp = load_base_module()

PAGE_W, PAGE_H = A4
MARGIN_X = 19 * mm
TOP = 20 * mm
BOTTOM = 18 * mm
CONTENT_W = PAGE_W - 2 * MARGIN_X

NAVY = colors.HexColor("#0B1736")
INK = colors.HexColor("#18223B")
MUTED = colors.HexColor("#5D6880")
BLUE = colors.HexColor("#1D63E9")
CYAN = colors.HexColor("#22B8CF")
GREEN = colors.HexColor("#16A085")
GOLD = colors.HexColor("#E5A62F")
CORAL = colors.HexColor("#D9665B")
PALE_BLUE = colors.HexColor("#EAF1FF")
PALE_CYAN = colors.HexColor("#E9F8FB")
PALE_GREEN = colors.HexColor("#EAF8F4")
PALE_GOLD = colors.HexColor("#FFF6DF")
PALE_CORAL = colors.HexColor("#FCEEEB")
PAPER = colors.HexColor("#F6F8FC")
LINE = colors.HexColor("#DDE3EE")
WHITE = colors.white

BODY = ParagraphStyle(
    "BodyStandalone",
    fontName="Segoe",
    fontSize=9.25,
    leading=13.45,
    textColor=INK,
    spaceAfter=6.1,
    allowWidows=0,
    allowOrphans=0,
)
LEAD = ParagraphStyle(
    "LeadStandalone",
    parent=BODY,
    fontSize=10.9,
    leading=15.8,
    textColor=NAVY,
    spaceAfter=9,
)
H2 = ParagraphStyle(
    "H2",
    fontName="Segoe-Bold",
    fontSize=19.5,
    leading=23,
    textColor=NAVY,
    spaceBefore=2,
    spaceAfter=10,
    keepWithNext=True,
)
H3 = ParagraphStyle(
    "H3",
    fontName="Segoe-Semibold",
    fontSize=12.2,
    leading=15,
    textColor=BLUE,
    spaceBefore=9,
    spaceAfter=5,
    keepWithNext=True,
)
QUOTE = ParagraphStyle(
    "QuoteStandalone",
    fontName="Segoe-Semibold",
    fontSize=11.1,
    leading=16,
    textColor=NAVY,
    leftIndent=8,
    rightIndent=8,
    spaceAfter=2,
)
LIST_TEXT = ParagraphStyle(
    "ListStandalone",
    parent=BODY,
    fontSize=8.95,
    leading=12.4,
    spaceAfter=1,
)
SMALL = ParagraphStyle(
    "SmallStandalone",
    fontName="Segoe",
    fontSize=7.45,
    leading=10.2,
    textColor=MUTED,
)
COVER_TITLE = ParagraphStyle(
    "CoverTitleStandalone",
    fontName="Segoe-Bold",
    fontSize=29.5,
    leading=33,
    textColor=WHITE,
    alignment=TA_LEFT,
    spaceAfter=10,
)
COVER_SUB = ParagraphStyle(
    "CoverSubStandalone",
    fontName="Segoe-Semibold",
    fontSize=14.1,
    leading=19,
    textColor=colors.HexColor("#C8D6FA"),
    spaceAfter=18,
)


def normalize_text(value: str) -> str:
    return (
        value.replace("\u2011", "-")
        .replace("\u2013", "-")
        .replace("\u2014", "-")
        .replace("\u00a0", " ")
    )


def inline_markup(text: str) -> str:
    text = normalize_text(text.strip())
    text = html.escape(text, quote=False)
    text = re.sub(r"\*\*(.+?)\*\*", r"<b>\1</b>", text)
    text = re.sub(r"`(.+?)`", r"<font name='Segoe-Semibold'>\1</font>", text)
    return text


def draw_arrow(canvas, x1, y, x2, color=MUTED):
    canvas.setStrokeColor(color)
    canvas.setFillColor(color)
    canvas.setLineWidth(1.1)
    canvas.line(x1, y, x2, y)
    canvas.line(x2, y, x2 - 2.2 * mm, y + 1.6 * mm)
    canvas.line(x2, y, x2 - 2.2 * mm, y - 1.6 * mm)


class GapBridge(Flowable):
    def __init__(self):
        super().__init__()
        self.height = 55 * mm

    def wrap(self, avail_width, avail_height):
        self.width = avail_width
        return avail_width, self.height

    def draw(self):
        c = self.canv
        box_w = 67 * mm
        box_h = 32 * mm
        y = 18 * mm
        left_x = 0
        right_x = self.width - box_w
        for x, title, lines, accent, fill in [
            (left_x, "TECHNOLOGIEPOTENZIAL", ["CRM & Daten", "Automation", "Intelligence", "KI-Assistenten"], BLUE, PALE_BLUE),
            (right_x, "ORGANISATIONSREALITÄT", ["gewachsene Prozesse", "verteiltes Wissen", "Adoptionshürden", "unklare Prioritäten"], CORAL, PALE_CORAL),
        ]:
            c.setFillColor(fill)
            c.setStrokeColor(accent)
            c.setLineWidth(0.9)
            c.roundRect(x, y, box_w, box_h, 7, fill=1, stroke=1)
            c.setFillColor(accent)
            c.roundRect(x, y + box_h - 10 * mm, box_w, 10 * mm, 7, fill=1, stroke=0)
            c.rect(x, y + box_h - 10 * mm, box_w, 4 * mm, fill=1, stroke=0)
            c.setFillColor(WHITE)
            c.setFont("Segoe-Bold", 7.4)
            c.drawCentredString(x + box_w / 2, y + box_h - 6.3 * mm, title)
            for idx, line in enumerate(lines):
                c.setFillColor(accent)
                c.circle(x + 7 * mm, y + 16.5 * mm - idx * 4.3 * mm, 1.1 * mm, fill=1, stroke=0)
                c.setFillColor(INK)
                c.setFont("Segoe", 7.4)
                c.drawString(x + 10.2 * mm, y + 15.3 * mm - idx * 4.3 * mm, line)

        bridge_x = left_x + box_w + 8 * mm
        bridge_w = right_x - bridge_x - 8 * mm
        c.setFillColor(NAVY)
        c.roundRect(bridge_x, y + 6 * mm, bridge_w, 20 * mm, 7, fill=1, stroke=0)
        c.setFillColor(CYAN)
        c.setFont("Segoe-Bold", 7.1)
        c.drawCentredString(bridge_x + bridge_w / 2, y + 19.1 * mm, "DIE BERATUNGSBRÜCKE")
        p = Paragraph(
            "Prozessdiagnose<br/>Capability-Übersetzung<br/>begrenzter Pilot",
            ParagraphStyle("bridge", fontName="Segoe-Semibold", fontSize=7.5, leading=10.2, textColor=WHITE, alignment=TA_CENTER),
        )
        p.wrapOn(c, bridge_w - 5 * mm, 15 * mm)
        p.drawOn(c, bridge_x + 2.5 * mm, y + 7.5 * mm)
        draw_arrow(c, left_x + box_w + 1.5 * mm, y + 16 * mm, bridge_x - 1.5 * mm, BLUE)
        draw_arrow(c, bridge_x + bridge_w + 1.5 * mm, y + 16 * mm, right_x - 1.5 * mm, CORAL)
        c.setFillColor(MUTED)
        c.setFont("Segoe-Semibold", 7.2)
        c.drawCentredString(self.width / 2, 6.5 * mm, "Der Wert liegt nicht im Toolwissen, sondern in der richtigen Übersetzung.")


class AuthorityFlywheel(Flowable):
    items = [
        ("01", "WISSEN", "Prozesse, Capabilities, Fälle", BLUE, PALE_BLUE),
        ("02", "CONTENT", "Thesen und Entscheidungshilfen", CYAN, PALE_CYAN),
        ("03", "AUTHORITY", "Relevanz in enger Zielgruppe", GOLD, PALE_GOLD),
        ("04", "GESPRÄCHE", "Probleme und Nachfrage lernen", CORAL, PALE_CORAL),
        ("05", "BERATUNG", "Diagnose, Pilot, Adoption", GREEN, PALE_GREEN),
    ]

    def __init__(self):
        super().__init__()
        self.height = 49 * mm

    def wrap(self, avail_width, avail_height):
        self.width = avail_width
        return avail_width, self.height

    def draw(self):
        c = self.canv
        gap = 3.7 * mm
        box_w = (self.width - 4 * gap) / 5
        box_h = 28 * mm
        y = 13 * mm
        for idx, (num, title, desc, accent, fill) in enumerate(self.items):
            x = idx * (box_w + gap)
            c.setFillColor(fill)
            c.setStrokeColor(accent)
            c.setLineWidth(0.8)
            c.roundRect(x, y, box_w, box_h, 7, fill=1, stroke=1)
            c.setFillColor(accent)
            c.circle(x + box_w / 2, y + box_h - 6.2 * mm, 3.4 * mm, fill=1, stroke=0)
            c.setFillColor(WHITE)
            c.setFont("Segoe-Bold", 6.7)
            c.drawCentredString(x + box_w / 2, y + box_h - 7.2 * mm, num)
            c.setFillColor(NAVY)
            c.setFont("Segoe-Bold", 7.4)
            c.drawCentredString(x + box_w / 2, y + 13.1 * mm, title)
            p = Paragraph(desc, ParagraphStyle("fly-desc", fontName="Segoe", fontSize=6.45, leading=8.1, textColor=MUTED, alignment=TA_CENTER))
            p.wrapOn(c, box_w - 5 * mm, 10 * mm)
            p.drawOn(c, x + 2.5 * mm, y + 3.5 * mm)
            if idx < len(self.items) - 1:
                draw_arrow(c, x + box_w + 0.8 * mm, y + box_h / 2, x + box_w + gap - 0.8 * mm, MUTED)
        c.setStrokeColor(GREEN)
        c.setLineWidth(1)
        c.line(self.width - box_w / 2, 9.5 * mm, self.width - box_w / 2, 5.5 * mm)
        c.line(self.width - box_w / 2, 5.5 * mm, box_w / 2, 5.5 * mm)
        c.line(box_w / 2, 5.5 * mm, box_w / 2, 10.5 * mm)
        c.setFillColor(GREEN)
        c.setFont("Segoe-Semibold", 6.9)
        c.drawCentredString(self.width / 2, 1.5 * mm, "Freigegebene Fälle und Gegenbeispiele verbessern die Wissensbasis")


class OfferLadder(Flowable):
    items = [
        ("1", "OPPORTUNITY SCAN", "Engpässe priorisieren", BLUE),
        ("2", "ROADMAP", "Capability und Reihenfolge", CYAN),
        ("3", "WORKFLOW PILOT", "im Arbeitsfluss testen", GOLD),
        ("4", "ADOPTION", "Nutzung verankern", GREEN),
        ("5", "LEARNING SYSTEM", "Context und Enablement", NAVY),
    ]

    def __init__(self):
        super().__init__()
        self.height = 76 * mm

    def wrap(self, avail_width, avail_height):
        self.width = avail_width
        return avail_width, self.height

    def draw(self):
        c = self.canv
        start_w = 112 * mm
        step = 13 * mm
        box_h = 10.1 * mm
        gap = 1.7 * mm
        x0 = 5 * mm
        y = self.height - 10 * mm
        for idx, (num, title, desc, accent) in enumerate(self.items):
            width = start_w + idx * step
            x = x0
            y -= box_h + gap
            c.setFillColor(colors.white)
            c.setStrokeColor(accent)
            c.setLineWidth(0.9)
            c.roundRect(x, y, width, box_h, 5, fill=1, stroke=1)
            c.setFillColor(accent)
            c.roundRect(x, y, 13 * mm, box_h, 5, fill=1, stroke=0)
            c.rect(x + 7 * mm, y, 6 * mm, box_h, fill=1, stroke=0)
            c.setFillColor(WHITE)
            c.setFont("Segoe-Bold", 7.6)
            c.drawCentredString(x + 6.2 * mm, y + 3.4 * mm, num)
            c.setFillColor(NAVY)
            c.setFont("Segoe-Bold", 7.4)
            c.drawString(x + 17 * mm, y + 3.6 * mm, title)
            c.setFillColor(MUTED)
            c.setFont("Segoe", 6.9)
            c.drawRightString(x + width - 4 * mm, y + 3.6 * mm, desc)
        c.setFillColor(BLUE)
        c.setFont("Segoe-Semibold", 7.2)
        c.drawString(x0, 1.4 * mm, "Jede Stufe liefert einen eigenständigen Wert und eine neue Entscheidung.")


class ClientJourney(Flowable):
    items = [
        ("CONTENT", "Problem erkennen"),
        ("GESPRÄCH", "Problem einordnen"),
        ("SCAN", "Chancen priorisieren"),
        ("PILOT", "im Alltag testen"),
        ("ROLLOUT", "Arbeitsweise verankern"),
        ("LERNEN", "Wissen verbessern"),
    ]

    def __init__(self):
        super().__init__()
        self.height = 38 * mm

    def wrap(self, avail_width, avail_height):
        self.width = avail_width
        return avail_width, self.height

    def draw(self):
        c = self.canv
        gap = 3.1 * mm
        box_w = (self.width - 5 * gap) / 6
        box_h = 22 * mm
        y = 9 * mm
        accents = [BLUE, CYAN, GOLD, CORAL, GREEN, NAVY]
        fills = [PALE_BLUE, PALE_CYAN, PALE_GOLD, PALE_CORAL, PALE_GREEN, colors.HexColor("#EEF0F6")]
        for idx, ((title, desc), accent, fill) in enumerate(zip(self.items, accents, fills)):
            x = idx * (box_w + gap)
            c.setFillColor(fill)
            c.setStrokeColor(accent)
            c.setLineWidth(0.8)
            c.roundRect(x, y, box_w, box_h, 6, fill=1, stroke=1)
            c.setFillColor(accent)
            c.setFont("Segoe-Bold", 6.8)
            c.drawCentredString(x + box_w / 2, y + 14.5 * mm, title)
            p = Paragraph(desc, ParagraphStyle("journey-desc", fontName="Segoe", fontSize=6.2, leading=7.8, textColor=MUTED, alignment=TA_CENTER))
            p.wrapOn(c, box_w - 4 * mm, 9 * mm)
            p.drawOn(c, x + 2 * mm, y + 4 * mm)
            if idx < 5:
                draw_arrow(c, x + box_w + 0.6 * mm, y + box_h / 2, x + box_w + gap - 0.6 * mm, MUTED)


class ThreeLayerModel(Flowable):
    rows = [
        ("ÖFFENTLICHE AUTHORITY", "Wissensbasis, Content, Analysen und Entscheidungshilfen", BLUE, PALE_BLUE),
        ("BERATUNGS-WORKBENCH", "Diagnose, Capability Map, Roadmap, Pilot und Entscheidungslog", CYAN, PALE_CYAN),
        ("KUNDENSYSTEME", "CRM, Microsoft 365, Dokumente, Rechte und kommerzieller Kontext", GREEN, PALE_GREEN),
    ]

    def __init__(self):
        super().__init__()
        self.height = 45 * mm

    def wrap(self, avail_width, avail_height):
        self.width = avail_width
        return avail_width, self.height

    def draw(self):
        c = self.canv
        row_h = 10.7 * mm
        gap = 2.2 * mm
        y = self.height - row_h - 2 * mm
        for idx, (label, desc, accent, fill) in enumerate(self.rows):
            c.setFillColor(fill)
            c.setStrokeColor(accent)
            c.setLineWidth(0.8)
            c.roundRect(0, y, self.width, row_h, 5, fill=1, stroke=1)
            c.setFillColor(accent)
            c.roundRect(0, y, 48 * mm, row_h, 5, fill=1, stroke=0)
            c.rect(42 * mm, y, 6 * mm, row_h, fill=1, stroke=0)
            c.setFillColor(WHITE)
            c.setFont("Segoe-Bold", 7)
            c.drawCentredString(24 * mm, y + 4.1 * mm, label)
            c.setFillColor(INK)
            c.setFont("Segoe", 7.5)
            c.drawString(53 * mm, y + 4.1 * mm, desc)
            y -= row_h + gap


class ProofGrid(Flowable):
    items = [
        ("PROBLEM PROOF", "Wiederkehrender Engpass mit sichtbarer Folge", BLUE, PALE_BLUE),
        ("AUTHORITY PROOF", "Relevante Entscheider beginnen Gespräche", CYAN, PALE_CYAN),
        ("DELIVERY PROOF", "Scan und Pilot verbessern Entscheidungen", GOLD, PALE_GOLD),
        ("MARKET PROOF", "Mehrere Käufer priorisieren Budget", GREEN, PALE_GREEN),
    ]

    def __init__(self):
        super().__init__()
        self.height = 49 * mm

    def wrap(self, avail_width, avail_height):
        self.width = avail_width
        return avail_width, self.height

    def draw(self):
        c = self.canv
        gap = 4 * mm
        box_w = (self.width - gap) / 2
        box_h = 19 * mm
        for idx, (title, desc, accent, fill) in enumerate(self.items):
            row, col = divmod(idx, 2)
            x = col * (box_w + gap)
            y = self.height - (row + 1) * box_h - row * gap - 2 * mm
            c.setFillColor(fill)
            c.setStrokeColor(accent)
            c.setLineWidth(0.8)
            c.roundRect(x, y, box_w, box_h, 7, fill=1, stroke=1)
            c.setFillColor(accent)
            c.setFont("Segoe-Bold", 7.7)
            c.drawString(x + 4 * mm, y + 11.5 * mm, title)
            p = Paragraph(desc, ParagraphStyle("proof-desc", fontName="Segoe", fontSize=7.2, leading=9.2, textColor=INK))
            p.wrapOn(c, box_w - 8 * mm, 9 * mm)
            p.drawOn(c, x + 4 * mm, y + 3.2 * mm)


class StandaloneDoc(BaseDocTemplate):
    def __init__(self, filename: str):
        super().__init__(
            filename,
            pagesize=A4,
            leftMargin=MARGIN_X,
            rightMargin=MARGIN_X,
            topMargin=TOP,
            bottomMargin=BOTTOM,
            title="Vertriebsmodernisierung für den Mittelstand",
            author="Strategisches Partner-Paper",
            subject="Authority-getriebenes Beratungsmodell für technologiegestützte B2B-Vertriebsentwicklung",
        )
        cover_frame = Frame(22 * mm, 20 * mm, PAGE_W - 44 * mm, PAGE_H - 40 * mm, id="cover-frame", showBoundary=0)
        normal_frame = Frame(MARGIN_X, BOTTOM, CONTENT_W, PAGE_H - TOP - BOTTOM, id="normal-frame", showBoundary=0)
        self.addPageTemplates([
            PageTemplate(id="cover", frames=[cover_frame], onPage=self.cover_page),
            PageTemplate(id="normal", frames=[normal_frame], onPage=self.normal_page),
        ])

    def cover_page(self, canvas, doc):
        canvas.saveState()
        canvas.setFillColor(NAVY)
        canvas.rect(0, 0, PAGE_W, PAGE_H, fill=1, stroke=0)
        canvas.setFillColor(colors.HexColor("#102A61"))
        canvas.circle(PAGE_W + 8 * mm, PAGE_H - 17 * mm, 64 * mm, fill=1, stroke=0)
        canvas.setFillColor(colors.HexColor("#1650B7"))
        canvas.circle(PAGE_W - 1 * mm, PAGE_H - 3 * mm, 29 * mm, fill=1, stroke=0)
        canvas.setFillColor(colors.HexColor("#102A61"))
        canvas.circle(-4 * mm, 2 * mm, 47 * mm, fill=1, stroke=0)
        canvas.setStrokeColor(colors.HexColor("#315FAF"))
        canvas.setLineWidth(0.75)
        for offset in range(0, 8):
            y = 24 * mm + offset * 6 * mm
            canvas.line(0, y, PAGE_W * 0.44, y)
        canvas.setFillColor(CYAN)
        canvas.rect(22 * mm, PAGE_H - 31 * mm, 26 * mm, 2.5 * mm, fill=1, stroke=0)
        canvas.setFont("Segoe-Semibold", 7.4)
        canvas.setFillColor(colors.HexColor("#AFC4F7"))
        canvas.drawString(22 * mm, 16 * mm, "STRATEGISCHES PARTNER-PAPER  |  03.08.2026")
        canvas.restoreState()

    def normal_page(self, canvas, doc):
        canvas.saveState()
        canvas.setFillColor(PAPER)
        canvas.rect(0, 0, PAGE_W, PAGE_H, fill=1, stroke=0)
        canvas.setFillColor(WHITE)
        canvas.roundRect(12 * mm, 12 * mm, PAGE_W - 24 * mm, PAGE_H - 24 * mm, 8, fill=1, stroke=0)
        canvas.setStrokeColor(LINE)
        canvas.setLineWidth(0.55)
        canvas.line(MARGIN_X, PAGE_H - 13.5 * mm, PAGE_W - MARGIN_X, PAGE_H - 13.5 * mm)
        canvas.setFont("Segoe-Semibold", 6.8)
        canvas.setFillColor(MUTED)
        canvas.drawString(MARGIN_X, PAGE_H - 10.6 * mm, "VERTRIEBSMODERNISIERUNG FÜR DEN MITTELSTAND")
        canvas.drawRightString(PAGE_W - MARGIN_X, PAGE_H - 10.6 * mm, "STRATEGISCHES PARTNER-PAPER")
        canvas.line(MARGIN_X, 12.8 * mm, PAGE_W - MARGIN_X, 12.8 * mm)
        canvas.setFont("Segoe", 6.7)
        canvas.drawString(MARGIN_X, 8.8 * mm, "Prozess vor Plattform. Capability vor Tool. Pilot vor Rollout.")
        canvas.setFont("Segoe-Semibold", 7)
        canvas.setFillColor(BLUE)
        canvas.drawRightString(PAGE_W - MARGIN_X, 8.8 * mm, f"{doc.page - 1:02d}")
        canvas.restoreState()

    def afterFlowable(self, flowable):
        if isinstance(flowable, Paragraph) and flowable.style.name in ("H2", "H3"):
            level = 0 if flowable.style.name == "H2" else 1
            text = flowable.getPlainText()
            key = "heading-" + hashlib.sha1((flowable.style.name + "|" + text).encode("utf-8")).hexdigest()[:16]
            self.canv.bookmarkPage(key)
            self.canv.addOutlineEntry(text, key, level=level, closed=False)
            self.notify("TOCEntry", (level, text, self.page - 1, key))


def make_list(items: list[str], ordered: bool = False, start: int = 1):
    flows = [ListItem(Paragraph(inline_markup(item), LIST_TEXT), leftIndent=3) for item in items]
    return ListFlowable(
        flows,
        bulletType="1" if ordered else "bullet",
        start=str(start) if ordered else None,
        leftIndent=16,
        bulletFontName="Segoe-Semibold",
        bulletFontSize=7.8,
        bulletColor=BLUE,
        bulletOffsetY=1.1,
        spaceBefore=1,
        spaceAfter=6,
    )


def build_story() -> list:
    story = [
        Spacer(1, 43 * mm),
        Paragraph("VERTRIEBSMODERNISIERUNG<br/>FÜR DEN MITTELSTAND", COVER_TITLE),
        Paragraph("Eine authority-getriebene Beratungsidee zwischen Sales-Prozess, Technologie und Umsetzung", COVER_SUB),
        Spacer(1, 11 * mm),
        bp.Card(
            Paragraph(
                "Vom Vertriebsproblem zur richtigen Capability.<br/>Von der Capability zum kontrollierten Pilot.<br/>Vom Pilot zum besseren Vertriebsprozess.",
                ParagraphStyle("cover-thesis", fontName="Segoe-Semibold", fontSize=13.1, leading=19, textColor=WHITE),
            ),
            width=CONTENT_W,
            pad=11,
            fill=colors.HexColor("#173267"),
            stroke=colors.HexColor("#3565B9"),
            radius=8,
        ),
        Spacer(1, 16 * mm),
        Paragraph(
            "Ein eigenständiges strategisches Business Paper über Markt-Gap, Zielkunden, Positionierung, Authority-Aufbau, Beratungsportfolio, Geschäftsmodell, Risiken und Validierung.",
            ParagraphStyle("cover-copy", parent=BODY, fontSize=10.1, leading=15, textColor=colors.HexColor("#C8D6FA")),
        ),
        NextPageTemplate("normal"),
        PageBreak(),
        Paragraph("Inhalt", H2),
        bp.SectionRule(),
        Spacer(1, 5 * mm),
    ]

    toc = TableOfContents()
    toc.levelStyles = [
        ParagraphStyle("TOC0", fontName="Segoe-Semibold", fontSize=9.6, leading=15, textColor=NAVY, leftIndent=0, firstLineIndent=0, spaceBefore=3),
        ParagraphStyle("TOC1", fontName="Segoe", fontSize=8.0, leading=11.8, textColor=MUTED, leftIndent=11, firstLineIndent=0),
    ]
    story.append(toc)
    story.append(PageBreak())

    lines = SOURCE.read_text(encoding="utf-8").splitlines()
    start = next(i for i, line in enumerate(lines) if line.strip() == "## Executive Summary")
    lines = lines[start:]
    paragraph_buffer: list[str] = []
    first_section = True

    inject = {
        "2. Warum die Idee jetzt relevant ist": GapBridge,
        "5. Die Wissens- und Authority-Maschine": AuthorityFlywheel,
        "6. Das Beratungsportfolio": OfferLadder,
        "7. Die Kundenreise": ClientJourney,
        "8. Technologie als Mittel, nicht als Ausgangspunkt": ThreeLayerModel,
        "12. Beweislogik": ProofGrid,
    }

    def flush_paragraph():
        nonlocal paragraph_buffer
        if not paragraph_buffer:
            return
        raw = " ".join(s.strip() for s in paragraph_buffer).strip()
        paragraph_buffer = []
        if raw:
            style = LEAD if len(story) < 14 else BODY
            story.append(Paragraph(inline_markup(raw), style))

    i = 0
    while i < len(lines):
        stripped = lines[i].strip()
        if not stripped or stripped == "---":
            flush_paragraph()
            i += 1
            continue
        if stripped.startswith("## "):
            flush_paragraph()
            heading = stripped[3:].strip()
            if not first_section:
                story.append(CondPageBreak(80 * mm))
            first_section = False
            story.extend([Paragraph(inline_markup(heading), H2), bp.SectionRule(), Spacer(1, 3 * mm)])
            if heading in inject:
                story.extend([inject[heading](), Spacer(1, 2 * mm)])
            i += 1
            continue
        if stripped.startswith("### "):
            flush_paragraph()
            story.append(Paragraph(inline_markup(stripped[4:]), H3))
            i += 1
            continue
        if stripped.startswith(">"):
            flush_paragraph()
            quote_lines = []
            while i < len(lines) and (lines[i].strip().startswith(">") or not lines[i].strip()):
                current = lines[i].strip()
                if current.startswith(">"):
                    current = current[1:].strip()
                    if current:
                        quote_lines.append(current)
                i += 1
            quote_html = "<br/>".join(inline_markup(q) for q in quote_lines)
            story.append(bp.Card(Paragraph(quote_html, QUOTE), fill=PALE_BLUE, stroke=colors.HexColor("#B7C9F2")))
            story.append(Spacer(1, 4))
            continue
        if re.match(r"^-\s+", stripped):
            flush_paragraph()
            items = []
            while i < len(lines) and re.match(r"^-\s+", lines[i].strip()):
                items.append(re.sub(r"^-\s+", "", lines[i].strip()))
                i += 1
            story.append(make_list(items, ordered=False))
            continue
        if re.match(r"^\d+\.\s+", stripped):
            flush_paragraph()
            items = []
            start_number = int(re.match(r"^(\d+)\.", stripped).group(1))
            while i < len(lines) and re.match(r"^\d+\.\s+", lines[i].strip()):
                items.append(re.sub(r"^\d+\.\s+", "", lines[i].strip()))
                i += 1
            story.append(make_list(items, ordered=True, start=start_number))
            continue
        paragraph_buffer.append(stripped)
        i += 1

    flush_paragraph()
    story.append(Spacer(1, 6 * mm))
    closing = Table(
        [[
            Paragraph("DIE GESCHÄFTSIDEE", ParagraphStyle("close-label", fontName="Segoe-Bold", fontSize=7.2, textColor=WHITE)),
            Paragraph(
                "Ein authority-getriebenes Beratungsmodell, das mittelständischen B2B-Unternehmen hilft, moderne Sales-Technologie in konkrete, tragfähige Vertriebsverbesserung zu übersetzen.",
                ParagraphStyle("close-copy", fontName="Segoe-Semibold", fontSize=10.2, leading=14, textColor=WHITE),
            ),
        ]],
        colWidths=[35 * mm, CONTENT_W - 35 * mm],
        hAlign="LEFT",
    )
    closing.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), NAVY),
        ("BACKGROUND", (0, 0), (0, 0), BLUE),
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
        ("LEFTPADDING", (0, 0), (-1, -1), 9),
        ("RIGHTPADDING", (0, 0), (-1, -1), 9),
        ("TOPPADDING", (0, 0), (-1, -1), 10),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 10),
    ]))
    story.append(closing)
    return story


def main() -> None:
    source_text = SOURCE.read_text(encoding="utf-8")
    forbidden = ["[[", "]]", "second-brain-enabled", "authority-to-revenue-agentic", "wiki/", "Vault"]
    found = [item for item in forbidden if item.lower() in source_text.lower()]
    if found:
        raise ValueError(f"Standalone source contains internal references: {found}")
    doc = StandaloneDoc(str(OUTPUT))
    doc.multiBuild(build_story())
    print(OUTPUT)


if __name__ == "__main__":
    main()
