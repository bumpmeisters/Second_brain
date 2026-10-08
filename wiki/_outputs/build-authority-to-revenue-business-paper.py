from __future__ import annotations

import html
import hashlib
import re
from pathlib import Path

from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_LEFT
from reportlab.lib.fonts import addMapping
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.units import mm
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import (
    BaseDocTemplate,
    CondPageBreak,
    Flowable,
    Frame,
    KeepTogether,
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
SOURCE = HERE / "authority-to-revenue-strategisches-business-paper-2026-08-03.md"
OUTPUT = HERE / "authority-to-revenue-strategisches-business-paper-2026-08-03.pdf"

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
RED = colors.HexColor("#CE4B58")
PALE_BLUE = colors.HexColor("#EAF1FF")
PALE_CYAN = colors.HexColor("#E9F8FB")
PALE_GREEN = colors.HexColor("#EAF8F4")
PALE_GOLD = colors.HexColor("#FFF6DF")
PAPER = colors.HexColor("#F6F8FC")
LINE = colors.HexColor("#DDE3EE")
WHITE = colors.white


def register_fonts() -> None:
    regular = Path(r"C:\Windows\Fonts\segoeui.ttf")
    semibold = Path(r"C:\Windows\Fonts\seguisb.ttf")
    bold = Path(r"C:\Windows\Fonts\segoeuib.ttf")
    pdfmetrics.registerFont(TTFont("Segoe", str(regular)))
    pdfmetrics.registerFont(TTFont("Segoe-Semibold", str(semibold)))
    pdfmetrics.registerFont(TTFont("Segoe-Bold", str(bold)))
    addMapping("Segoe", 0, 0, "Segoe")
    addMapping("Segoe", 1, 0, "Segoe-Bold")


register_fonts()


STYLES = getSampleStyleSheet()
BODY = ParagraphStyle(
    "Body",
    fontName="Segoe",
    fontSize=9.35,
    leading=13.6,
    textColor=INK,
    spaceAfter=6.2,
    allowWidows=0,
    allowOrphans=0,
)
LEAD = ParagraphStyle(
    "Lead",
    parent=BODY,
    fontSize=11.1,
    leading=16,
    textColor=NAVY,
    spaceAfter=9,
)
H2 = ParagraphStyle(
    "H2",
    fontName="Segoe-Bold",
    fontSize=20,
    leading=23.5,
    textColor=NAVY,
    spaceBefore=2,
    spaceAfter=11,
    keepWithNext=True,
)
H3 = ParagraphStyle(
    "H3",
    fontName="Segoe-Semibold",
    fontSize=12.4,
    leading=15.2,
    textColor=BLUE,
    spaceBefore=10,
    spaceAfter=5,
    keepWithNext=True,
)
QUOTE = ParagraphStyle(
    "Quote",
    fontName="Segoe-Semibold",
    fontSize=11.3,
    leading=16,
    textColor=NAVY,
    leftIndent=10,
    rightIndent=10,
    spaceBefore=4,
    spaceAfter=4,
)
LIST_TEXT = ParagraphStyle(
    "ListText",
    parent=BODY,
    fontSize=9.05,
    leading=12.6,
    spaceAfter=1,
)
SMALL = ParagraphStyle(
    "Small",
    fontName="Segoe",
    fontSize=7.8,
    leading=10.5,
    textColor=MUTED,
)
CAPTION = ParagraphStyle(
    "Caption",
    parent=SMALL,
    fontName="Segoe-Semibold",
    textColor=BLUE,
    spaceAfter=4,
)
SOURCE_STYLE = ParagraphStyle(
    "Source",
    parent=BODY,
    fontSize=8.4,
    leading=11.8,
    textColor=INK,
    leftIndent=9,
    borderColor=LINE,
    borderWidth=0.6,
    borderPadding=7,
    backColor=colors.white,
    spaceBefore=3,
    spaceAfter=6,
)
COVER_TITLE = ParagraphStyle(
    "CoverTitle",
    fontName="Segoe-Bold",
    fontSize=31,
    leading=34,
    textColor=WHITE,
    alignment=TA_LEFT,
    spaceAfter=10,
)
COVER_SUB = ParagraphStyle(
    "CoverSub",
    fontName="Segoe-Semibold",
    fontSize=15.2,
    leading=20,
    textColor=colors.HexColor("#C8D6FA"),
    spaceAfter=18,
)
COVER_THESIS = ParagraphStyle(
    "CoverThesis",
    fontName="Segoe-Semibold",
    fontSize=13.8,
    leading=20.5,
    textColor=WHITE,
    spaceAfter=8,
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


class Card(Flowable):
    def __init__(self, content, width=CONTENT_W, pad=9, fill=PALE_BLUE, stroke=LINE, radius=7):
        self.content = content if isinstance(content, list) else [content]
        self.card_width = width
        self.pad = pad
        self.fill = fill
        self.stroke = stroke
        self.radius = radius
        self._heights = []
        super().__init__()

    def wrap(self, availWidth, availHeight):
        width = min(self.card_width, availWidth)
        inner = width - 2 * self.pad
        total = 2 * self.pad
        self._heights = []
        for flow in self.content:
            _, h = flow.wrap(inner, availHeight)
            self._heights.append(h)
            total += h
        self.width = width
        self.height = total
        return width, total

    def draw(self):
        c = self.canv
        c.saveState()
        c.setFillColor(self.fill)
        c.setStrokeColor(self.stroke)
        c.setLineWidth(0.65)
        c.roundRect(0, 0, self.width, self.height, self.radius, fill=1, stroke=1)
        y = self.height - self.pad
        inner = self.width - 2 * self.pad
        for flow, h in zip(self.content, self._heights):
            y -= h
            flow.drawOn(c, self.pad, y)
        c.restoreState()


class SectionRule(Flowable):
    def __init__(self):
        super().__init__()
        self.height = 5

    def wrap(self, availWidth, availHeight):
        self.width = availWidth
        return availWidth, self.height

    def draw(self):
        self.canv.setStrokeColor(BLUE)
        self.canv.setLineWidth(2.2)
        self.canv.line(0, 3, 23 * mm, 3)
        self.canv.setStrokeColor(LINE)
        self.canv.setLineWidth(0.55)
        self.canv.line(25 * mm, 3, self.width, 3)


class FourStageFlow(Flowable):
    stages = [
        ("01", "EXPERTISE", "Wissen, Erfahrung, Belege", BLUE, PALE_BLUE),
        ("02", "AUTHORITY", "erkennbare, belastbare Perspektive", CYAN, PALE_CYAN),
        ("03", "GESPRÄCHE", "relevante Interaktion und Lernen", GOLD, PALE_GOLD),
        ("04", "TEAMWISSEN", "bessere Kundenentscheidungen", GREEN, PALE_GREEN),
    ]

    def __init__(self):
        super().__init__()
        self.height = 47 * mm

    def wrap(self, availWidth, availHeight):
        self.width = availWidth
        return availWidth, self.height

    def draw(self):
        c = self.canv
        gap = 5.2 * mm
        box_w = (self.width - 3 * gap) / 4
        box_h = 31 * mm
        y = 8 * mm
        for idx, (num, title, desc, accent, fill) in enumerate(self.stages):
            x = idx * (box_w + gap)
            c.setFillColor(fill)
            c.setStrokeColor(accent)
            c.setLineWidth(0.9)
            c.roundRect(x, y, box_w, box_h, 7, fill=1, stroke=1)
            c.setFillColor(accent)
            c.circle(x + 7 * mm, y + box_h - 7 * mm, 3.7 * mm, fill=1, stroke=0)
            c.setFont("Segoe-Bold", 7.2)
            c.setFillColor(WHITE)
            c.drawCentredString(x + 7 * mm, y + box_h - 8.2 * mm, num)
            p1 = Paragraph(title, ParagraphStyle("stage-title", fontName="Segoe-Bold", fontSize=8.6, leading=10, textColor=NAVY))
            p2 = Paragraph(desc, ParagraphStyle("stage-desc", fontName="Segoe", fontSize=7.2, leading=9.3, textColor=MUTED))
            p1.wrapOn(c, box_w - 10 * mm, 12 * mm)
            p1.drawOn(c, x + 5 * mm, y + 12.5 * mm)
            p2.wrapOn(c, box_w - 10 * mm, 12 * mm)
            p2.drawOn(c, x + 5 * mm, y + 3.5 * mm)
            if idx < 3:
                ax = x + box_w + 1.1 * mm
                ay = y + box_h / 2
                c.setStrokeColor(MUTED)
                c.setFillColor(MUTED)
                c.setLineWidth(1)
                c.line(ax, ay, ax + 2.9 * mm, ay)
                c.line(ax + 2.9 * mm, ay, ax + 1.5 * mm, ay + 1.3 * mm)
                c.line(ax + 2.9 * mm, ay, ax + 1.5 * mm, ay - 1.3 * mm)
        c.setFont("Segoe-Semibold", 7.5)
        c.setFillColor(BLUE)
        c.drawRightString(self.width, 2.6 * mm, "Jeder Durchlauf erzeugt neue Expertise -> der Kreislauf verbessert sich")


class ArchitectureFlow(Flowable):
    rows = [
        ("MARKT", "Authority Studio", "Market & Buyer Intelligence", BLUE),
        ("KOMMERZIELLE ARBEIT", "Account & Opportunity Rooms", "Conversation Workbench", CYAN),
        ("KÄUFER", "Buyer Decision Room", "Entscheidungsunterstützung", GOLD),
        ("TEAM", "Enablement Hub", "Fälle, Coaching, Übergaben", GREEN),
        ("KONTEXT", "Commercial Knowledge Core", "Claims, Proof, Zielkontexte, Lernobjekte", NAVY),
        ("KONTROLLE", "Governance & Evaluation", "Rechte, Freigaben, Protokolle, Qualitätsprüfungen", RED),
    ]

    def __init__(self):
        super().__init__()
        self.height = 69 * mm

    def wrap(self, availWidth, availHeight):
        self.width = availWidth
        return availWidth, self.height

    def draw(self):
        c = self.canv
        row_h = 9.8 * mm
        start_y = self.height - row_h
        label_w = 31 * mm
        gap = 1.4 * mm
        for i, (label, left, right, accent) in enumerate(self.rows):
            y = start_y - i * (row_h + gap)
            c.setFillColor(accent)
            c.roundRect(0, y, label_w, row_h, 5, fill=1, stroke=0)
            c.setFillColor(colors.HexColor("#FFFFFF"))
            c.setFont("Segoe-Bold", 6.9)
            c.drawCentredString(label_w / 2, y + 3.7 * mm, label)
            x = label_w + 2.5 * mm
            w = self.width - x
            c.setFillColor(colors.white)
            c.setStrokeColor(LINE)
            c.setLineWidth(0.7)
            c.roundRect(x, y, w, row_h, 5, fill=1, stroke=1)
            p1 = Paragraph(left, ParagraphStyle("arch-left", fontName="Segoe-Semibold", fontSize=8.3, leading=9.5, textColor=NAVY))
            p2 = Paragraph(right, ParagraphStyle("arch-right", fontName="Segoe", fontSize=7.5, leading=9, textColor=MUTED))
            p1.wrapOn(c, w * .42, row_h)
            p2.wrapOn(c, w * .48, row_h)
            p1.drawOn(c, x + 4 * mm, y + 3.2 * mm)
            p2.drawOn(c, x + w * .50, y + 3.2 * mm)


class SegmentFlow(Flowable):
    segments = [
        ("SOHO", "Expert Authority System", "Expertenzeit skalieren", "leicht, persönlich"),
        ("SMB", "Commercial Learning System", "Funktionen verbinden", "strategischer Kern"),
        ("MID-MARKET", "Governed Context Layer", "Komplexität beherrschen", "integriert, kontrolliert"),
    ]

    def __init__(self):
        super().__init__()
        self.height = 48 * mm

    def wrap(self, availWidth, availHeight):
        self.width = availWidth
        return availWidth, self.height

    def draw(self):
        c = self.canv
        gap = 4 * mm
        box_w = (self.width - 2 * gap) / 3
        box_h = 39 * mm
        colorset = [(BLUE, PALE_BLUE), (GREEN, PALE_GREEN), (NAVY, colors.HexColor("#EEF0F6"))]
        for i, (segment, product, value, mode) in enumerate(self.segments):
            x = i * (box_w + gap)
            accent, fill = colorset[i]
            c.setFillColor(fill)
            c.setStrokeColor(accent)
            c.setLineWidth(0.9)
            c.roundRect(x, 4 * mm, box_w, box_h, 7, fill=1, stroke=1)
            c.setFillColor(accent)
            c.roundRect(x, 33 * mm, box_w, 10 * mm, 7, fill=1, stroke=0)
            c.rect(x, 33 * mm, box_w, 5 * mm, fill=1, stroke=0)
            c.setFillColor(WHITE)
            c.setFont("Segoe-Bold", 8)
            c.drawCentredString(x + box_w / 2, 36.8 * mm, segment)
            styles = [
                ParagraphStyle("seg1", fontName="Segoe-Bold", fontSize=9, leading=11, textColor=NAVY, alignment=TA_CENTER),
                ParagraphStyle("seg2", fontName="Segoe", fontSize=7.7, leading=9.6, textColor=INK, alignment=TA_CENTER),
                ParagraphStyle("seg3", fontName="Segoe-Semibold", fontSize=7.2, leading=9, textColor=accent, alignment=TA_CENTER),
            ]
            vals = [(product, 24.5 * mm, styles[0]), (value, 14 * mm, styles[1]), (mode, 6.8 * mm, styles[2])]
            for txt, y, sty in vals:
                p = Paragraph(txt, sty)
                p.wrapOn(c, box_w - 8 * mm, 12 * mm)
                p.drawOn(c, x + 4 * mm, y)


class RevenueFlow(Flowable):
    items = [
        ("01", "FOUNDATION", "Context Design, Claims, Proof, Rechte", BLUE, PALE_BLUE),
        ("02", "PLATTFORM", "Knowledge Core, Workspaces, Agenten", CYAN, PALE_CYAN),
        ("03", "CONTEXTOPS", "Pflege, Prüfung, Evaluation, Lernen", GREEN, PALE_GREEN),
        ("04", "ENABLEMENT", "Arbeitsweisen, Governance, Adoption", GOLD, PALE_GOLD),
    ]

    def __init__(self):
        super().__init__()
        self.height = 57 * mm

    def wrap(self, availWidth, availHeight):
        self.width = availWidth
        return availWidth, self.height

    def draw(self):
        c = self.canv
        gap = 4 * mm
        box_w = (self.width - gap) / 2
        box_h = 22 * mm
        for i, (num, title, desc, accent, fill) in enumerate(self.items):
            row, col = divmod(i, 2)
            x = col * (box_w + gap)
            y = self.height - (row + 1) * box_h - row * gap - 2 * mm
            c.setFillColor(fill)
            c.setStrokeColor(accent)
            c.setLineWidth(0.8)
            c.roundRect(x, y, box_w, box_h, 7, fill=1, stroke=1)
            c.setFillColor(accent)
            c.setFont("Segoe-Bold", 15)
            c.drawString(x + 4 * mm, y + 10.5 * mm, num)
            p1 = Paragraph(title, ParagraphStyle("rev-title", fontName="Segoe-Bold", fontSize=8.6, leading=10, textColor=NAVY))
            p2 = Paragraph(desc, ParagraphStyle("rev-desc", fontName="Segoe", fontSize=7.4, leading=9, textColor=MUTED))
            p1.wrapOn(c, box_w - 18 * mm, 10 * mm)
            p2.wrapOn(c, box_w - 18 * mm, 10 * mm)
            p1.drawOn(c, x + 15 * mm, y + 11 * mm)
            p2.drawOn(c, x + 15 * mm, y + 3.5 * mm)


class BusinessPaperDoc(BaseDocTemplate):
    def __init__(self, filename):
        super().__init__(
            filename,
            pagesize=A4,
            leftMargin=MARGIN_X,
            rightMargin=MARGIN_X,
            topMargin=TOP,
            bottomMargin=BOTTOM,
            title="Authority-to-Revenue - Strategisches Business Paper",
            author="Strategische Partnerdiskussion",
            subject="Agentic Commercial Enablement",
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
        canvas.circle(PAGE_W + 12 * mm, PAGE_H - 20 * mm, 62 * mm, fill=1, stroke=0)
        canvas.setFillColor(colors.HexColor("#164AA9"))
        canvas.circle(PAGE_W - 3 * mm, PAGE_H - 5 * mm, 28 * mm, fill=1, stroke=0)
        canvas.setStrokeColor(colors.HexColor("#315FAF"))
        canvas.setLineWidth(0.8)
        for offset in range(0, 7):
            y = 25 * mm + offset * 6 * mm
            canvas.line(0, y, PAGE_W * 0.42, y)
        canvas.setFillColor(CYAN)
        canvas.rect(22 * mm, PAGE_H - 31 * mm, 24 * mm, 2.4 * mm, fill=1, stroke=0)
        canvas.setFont("Segoe-Semibold", 7.5)
        canvas.setFillColor(colors.HexColor("#AFC4F7"))
        canvas.drawString(22 * mm, 16 * mm, "STRATEGISCHE PARTNERDISKUSSION  |  03.08.2026")
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
        canvas.drawString(MARGIN_X, PAGE_H - 10.6 * mm, "AUTHORITY-TO-REVENUE")
        canvas.drawRightString(PAGE_W - MARGIN_X, PAGE_H - 10.6 * mm, "STRATEGISCHES BUSINESS PAPER")
        canvas.line(MARGIN_X, 12.8 * mm, PAGE_W - MARGIN_X, 12.8 * mm)
        canvas.setFont("Segoe", 6.8)
        canvas.drawString(MARGIN_X, 8.8 * mm, "Von Expertise zu Authority. Von Authority zu Gesprächen. Von Gesprächen zu Teamwissen.")
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
    flow_items = []
    for item in items:
        flow_items.append(ListItem(Paragraph(inline_markup(item), LIST_TEXT), leftIndent=3))
    return ListFlowable(
        flow_items,
        bulletType="1" if ordered else "bullet",
        start=str(start) if ordered else None,
        leftIndent=16,
        bulletFontName="Segoe-Semibold",
        bulletFontSize=7.8,
        bulletColor=BLUE,
        bulletOffsetY=1.2,
        spaceBefore=1,
        spaceAfter=6,
    )


def build_story() -> list:
    story = []
    story.extend([
        Spacer(1, 47 * mm),
        Paragraph("AUTHORITY-TO-REVENUE", COVER_TITLE),
        Paragraph("Strategisches Business Paper für eine agentische Commercial-Enablement-Lösung", COVER_SUB),
        Spacer(1, 13 * mm),
        Card([
            Paragraph("Von Expertise zu Authority.<br/>Von Authority zu Gesprächen.<br/>Von Gesprächen zu Teamwissen.<br/>Von Teamwissen zu besseren Kundenentscheidungen.", COVER_THESIS),
        ], width=CONTENT_W, pad=11, fill=colors.HexColor("#173267"), stroke=colors.HexColor("#3565B9"), radius=8),
        Spacer(1, 18 * mm),
        Paragraph("Eine vollständige Business-Idee für wissens- und vertrauensintensive B2B-Märkte - mit Lösungsbild, Zielsegmenten, Geschäftsmodell, Differenzierung und kritischen Risiken.", ParagraphStyle("cover-copy", parent=BODY, fontSize=10.2, leading=15, textColor=colors.HexColor("#C8D6FA"))),
        NextPageTemplate("normal"),
        PageBreak(),
        Paragraph("Inhalt", H2),
        SectionRule(),
        Spacer(1, 5 * mm),
    ])

    toc = TableOfContents()
    toc.levelStyles = [
        ParagraphStyle("TOC0", fontName="Segoe-Semibold", fontSize=9.7, leading=15, textColor=NAVY, leftIndent=0, firstLineIndent=0, spaceBefore=3),
        ParagraphStyle("TOC1", fontName="Segoe", fontSize=8.1, leading=12, textColor=MUTED, leftIndent=11, firstLineIndent=0),
    ]
    story.append(toc)
    story.append(PageBreak())

    lines = SOURCE.read_text(encoding="utf-8").splitlines()
    start = next(i for i, line in enumerate(lines) if line.strip() == "## Executive Summary")
    lines = lines[start:]

    paragraph_buffer: list[str] = []
    first_h2 = True

    def flush_paragraph():
        nonlocal paragraph_buffer
        if not paragraph_buffer:
            return
        raw = " ".join(s.strip() for s in paragraph_buffer).strip()
        paragraph_buffer = []
        if not raw:
            return
        style = LEAD if len(story) < 12 else BODY
        story.append(Paragraph(inline_markup(raw), style))

    i = 0
    while i < len(lines):
        line = lines[i].rstrip()
        stripped = line.strip()
        if not stripped:
            flush_paragraph()
            i += 1
            continue
        if stripped == "---":
            flush_paragraph()
            i += 1
            continue
        if stripped.startswith("## "):
            flush_paragraph()
            heading = stripped[3:].strip()
            if not first_h2:
                story.append(CondPageBreak(82 * mm))
            first_h2 = False
            story.extend([Paragraph(inline_markup(heading), H2), SectionRule(), Spacer(1, 3 * mm)])
            if heading.startswith("3. Der Authority-to-Revenue-Kreislauf"):
                story.extend([FourStageFlow(), Spacer(1, 2 * mm)])
            elif heading.startswith("4. Wie die Lösung end-to-end aussieht"):
                story.extend([ArchitectureFlow(), Spacer(1, 2 * mm)])
            elif heading.startswith("5. Die Zielgruppe"):
                story.extend([SegmentFlow(), Spacer(1, 2 * mm)])
            elif heading.startswith("8. Geschäftsmodell"):
                story.extend([RevenueFlow(), Spacer(1, 2 * mm)])
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
            story.append(Card(Paragraph(quote_html, QUOTE), fill=PALE_BLUE, stroke=colors.HexColor("#B7C9F2")))
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
        if stripped.startswith("http://") or stripped.startswith("https://"):
            flush_paragraph()
            url = normalize_text(stripped)
            story.append(Paragraph(f"<link href='{html.escape(url)}' color='#1D63E9'><u>Quelle öffnen</u></link>", SMALL))
            i += 1
            continue
        paragraph_buffer.append(stripped)
        i += 1

    flush_paragraph()

    story.append(Spacer(1, 5 * mm))
    closing = Table([
        [Paragraph("DIE OPPORTUNITY", ParagraphStyle("close-label", fontName="Segoe-Bold", fontSize=7.3, textColor=WHITE)),
         Paragraph("Die Übergänge zwischen Expertise, Authority, Gesprächen, Teamwissen und Kundenentscheidungen sind das Produkt.", ParagraphStyle("close-copy", fontName="Segoe-Semibold", fontSize=10.4, leading=14, textColor=WHITE))]
    ], colWidths=[33 * mm, CONTENT_W - 33 * mm], hAlign="LEFT")
    closing.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), NAVY),
        ("BACKGROUND", (0, 0), (0, 0), BLUE),
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
        ("LEFTPADDING", (0, 0), (-1, -1), 9),
        ("RIGHTPADDING", (0, 0), (-1, -1), 9),
        ("TOPPADDING", (0, 0), (-1, -1), 10),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 10),
        ("BOX", (0, 0), (-1, -1), 0, NAVY),
    ]))
    story.append(closing)
    return story


def main() -> None:
    doc = BusinessPaperDoc(str(OUTPUT))
    doc.multiBuild(build_story())
    print(OUTPUT)


if __name__ == "__main__":
    main()
