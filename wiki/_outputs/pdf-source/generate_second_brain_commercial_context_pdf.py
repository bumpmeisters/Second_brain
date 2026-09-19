from __future__ import annotations

from pathlib import Path
from xml.sax.saxutils import escape

from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.units import mm
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.pdfgen import canvas
from reportlab.platypus import (
    BaseDocTemplate,
    Flowable,
    Frame,
    KeepTogether,
    NextPageTemplate,
    PageBreak,
    PageTemplate,
    Paragraph,
    Spacer,
    Table,
    TableStyle,
)


ROOT = Path(__file__).resolve().parents[3]
OUTPUT = ROOT / "wiki" / "_outputs" / "second-brain-commercial-context-systems-de-eu-2026.pdf"

PAGE_W, PAGE_H = A4
MARGIN_X = 18 * mm
MARGIN_TOP = 20 * mm
MARGIN_BOTTOM = 18 * mm
CONTENT_W = PAGE_W - 2 * MARGIN_X

NAVY = colors.HexColor("#0B1220")
NAVY_2 = colors.HexColor("#17243A")
TEAL = colors.HexColor("#00B89C")
TEAL_DARK = colors.HexColor("#087F73")
PURPLE = colors.HexColor("#7758D6")
AMBER = colors.HexColor("#F4A940")
RED = colors.HexColor("#D95D5D")
INK = colors.HexColor("#152033")
MUTED = colors.HexColor("#5E6B7D")
LIGHT = colors.HexColor("#F3F6FA")
PALE_TEAL = colors.HexColor("#E8F8F4")
PALE_PURPLE = colors.HexColor("#F0ECFB")
PALE_AMBER = colors.HexColor("#FFF4DF")
PALE_RED = colors.HexColor("#FDEDED")
WHITE = colors.white
LINE = colors.HexColor("#DCE3EC")


def register_fonts() -> None:
    fonts = {
        "ArialNova": Path(r"C:\Windows\Fonts\ArialNova.ttf"),
        "ArialNova-Bold": Path(r"C:\Windows\Fonts\ArialNova-Bold.ttf"),
        "ArialNova-Italic": Path(r"C:\Windows\Fonts\ArialNova-Italic.ttf"),
        "ArialNova-Light": Path(r"C:\Windows\Fonts\ArialNova-Light.ttf"),
    }
    fallback = {
        "ArialNova": Path(r"C:\Windows\Fonts\arial.ttf"),
        "ArialNova-Bold": Path(r"C:\Windows\Fonts\arialbd.ttf"),
        "ArialNova-Italic": Path(r"C:\Windows\Fonts\ariali.ttf"),
        "ArialNova-Light": Path(r"C:\Windows\Fonts\arial.ttf"),
    }
    for name, path in fonts.items():
        selected = path if path.exists() else fallback[name]
        pdfmetrics.registerFont(TTFont(name, str(selected)))


register_fonts()


def clean(text: str) -> str:
    return (
        text.replace("\u2011", "-")
        .replace("\u2012", "-")
        .replace("\u2013", "-")
        .replace("\u2014", "-")
        .replace("\u2212", "-")
        .replace("\u00a0", " ")
    )


styles = getSampleStyleSheet()
BODY = ParagraphStyle(
    "Body",
    fontName="ArialNova",
    fontSize=9.4,
    leading=13.2,
    textColor=INK,
    spaceAfter=5,
)
BODY_SMALL = ParagraphStyle(
    "BodySmall",
    parent=BODY,
    fontSize=8.2,
    leading=11.2,
    spaceAfter=4,
)
TINY = ParagraphStyle(
    "Tiny",
    parent=BODY,
    fontSize=7.1,
    leading=9.4,
    textColor=MUTED,
)
H1 = ParagraphStyle(
    "H1",
    fontName="ArialNova-Bold",
    fontSize=22,
    leading=25,
    textColor=NAVY,
    spaceAfter=10,
)
H2 = ParagraphStyle(
    "H2",
    fontName="ArialNova-Bold",
    fontSize=14,
    leading=17,
    textColor=NAVY,
    spaceBefore=8,
    spaceAfter=6,
)
H3 = ParagraphStyle(
    "H3",
    fontName="ArialNova-Bold",
    fontSize=10.5,
    leading=13.5,
    textColor=NAVY,
    spaceBefore=5,
    spaceAfter=3,
)
KICKER = ParagraphStyle(
    "Kicker",
    fontName="ArialNova-Bold",
    fontSize=8.2,
    leading=10,
    textColor=TEAL_DARK,
    spaceAfter=4,
)
QUOTE = ParagraphStyle(
    "Quote",
    fontName="ArialNova-Bold",
    fontSize=13.5,
    leading=18,
    textColor=NAVY,
    leftIndent=7 * mm,
    rightIndent=7 * mm,
    spaceBefore=8,
    spaceAfter=8,
)
CAPTION = ParagraphStyle(
    "Caption",
    fontName="ArialNova",
    fontSize=7.4,
    leading=9.5,
    textColor=MUTED,
    spaceBefore=2,
    spaceAfter=5,
)
SOURCE = ParagraphStyle(
    "Source",
    fontName="ArialNova",
    fontSize=7,
    leading=9.2,
    textColor=MUTED,
    spaceBefore=4,
    spaceAfter=4,
)
TABLE_HEAD = ParagraphStyle(
    "TableHead",
    fontName="ArialNova-Bold",
    fontSize=7.5,
    leading=9.4,
    textColor=WHITE,
)
TABLE_BODY = ParagraphStyle(
    "TableBody",
    fontName="ArialNova",
    fontSize=7.3,
    leading=9.4,
    textColor=INK,
)


def p(text: str, style: ParagraphStyle = BODY) -> Paragraph:
    return Paragraph(clean(text), style)


def source_note(text: str) -> Paragraph:
    return p(f"<b>Quelle:</b> {text}", SOURCE)


def tag(text: str, bg=PALE_TEAL, fg=TEAL_DARK, width: float | None = None) -> Table:
    table = Table([[p(f"<b>{escape(clean(text))}</b>", ParagraphStyle(
        "TagText", parent=TINY, fontName="ArialNova-Bold", textColor=fg, alignment=TA_CENTER
    ))]], colWidths=[width] if width else None)
    table.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), bg),
        ("BOX", (0, 0), (-1, -1), 0.5, bg),
        ("LEFTPADDING", (0, 0), (-1, -1), 6),
        ("RIGHTPADDING", (0, 0), (-1, -1), 6),
        ("TOPPADDING", (0, 0), (-1, -1), 3),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 3),
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
    ]))
    return table


def card(
    title: str,
    body: str,
    *,
    bg=LIGHT,
    accent=TEAL,
    width: float | None = None,
    title_style: ParagraphStyle = H3,
    body_style: ParagraphStyle = BODY_SMALL,
) -> Table:
    inner = Table(
        [[p(clean(title), title_style)], [p(clean(body), body_style)]],
        colWidths=[(width or CONTENT_W) - 10 * mm],
    )
    inner.setStyle(TableStyle([
        ("LEFTPADDING", (0, 0), (-1, -1), 0),
        ("RIGHTPADDING", (0, 0), (-1, -1), 0),
        ("TOPPADDING", (0, 0), (-1, -1), 0),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 1),
    ]))
    outer = Table([["", inner]], colWidths=[3 * mm, (width or CONTENT_W) - 3 * mm])
    outer.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), bg),
        ("BACKGROUND", (0, 0), (0, 0), accent),
        ("LEFTPADDING", (1, 0), (1, 0), 7 * mm),
        ("RIGHTPADDING", (1, 0), (1, 0), 5 * mm),
        ("TOPPADDING", (1, 0), (1, 0), 5 * mm),
        ("BOTTOMPADDING", (1, 0), (1, 0), 5 * mm),
        ("LEFTPADDING", (0, 0), (0, 0), 0),
        ("RIGHTPADDING", (0, 0), (0, 0), 0),
        ("TOPPADDING", (0, 0), (0, 0), 0),
        ("BOTTOMPADDING", (0, 0), (0, 0), 0),
        ("BOX", (0, 0), (-1, -1), 0.5, LINE),
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
    ]))
    return outer


def two_col(left, right, gap=6 * mm, widths=None) -> Table:
    if widths is None:
        col = (CONTENT_W - gap) / 2
        widths = [col, gap, col]
    table = Table([[left, "", right]], colWidths=widths)
    table.setStyle(TableStyle([
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
        ("LEFTPADDING", (0, 0), (-1, -1), 0),
        ("RIGHTPADDING", (0, 0), (-1, -1), 0),
        ("TOPPADDING", (0, 0), (-1, -1), 0),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 0),
    ]))
    return table


def bullet_list(items: list[str], style=BODY_SMALL, bullet_color=TEAL_DARK) -> Table:
    rows = []
    for item in items:
        rows.append([
            p("●", ParagraphStyle("Dot", parent=style, textColor=bullet_color, fontSize=5.5, leading=style.leading)),
            p(item, style),
        ])
    table = Table(rows, colWidths=[4 * mm, None])
    table.setStyle(TableStyle([
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
        ("LEFTPADDING", (0, 0), (-1, -1), 0),
        ("RIGHTPADDING", (0, 0), (-1, -1), 0),
        ("TOPPADDING", (0, 0), (-1, -1), 0),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 1.5),
    ]))
    return table


class SectionBand(Flowable):
    def __init__(self, number: str, title: str, subtitle: str = "", color=TEAL):
        super().__init__()
        self.number = number
        self.title = clean(title)
        self.subtitle = clean(subtitle)
        self.color = color
        self.height = 34 * mm

    def wrap(self, availWidth, availHeight):
        self._availWidth = availWidth
        return availWidth, self.height

    def draw(self):
        c = self.canv
        w = self._availWidth
        c.setFillColor(NAVY)
        c.roundRect(0, 0, w, self.height, 5 * mm, fill=1, stroke=0)
        c.setFillColor(self.color)
        c.circle(15 * mm, self.height - 14 * mm, 7 * mm, fill=1, stroke=0)
        c.setFillColor(NAVY)
        c.setFont("ArialNova-Bold", 11)
        c.drawCentredString(15 * mm, self.height - 17 * mm, self.number)
        c.setFillColor(WHITE)
        c.setFont("ArialNova-Bold", 18)
        c.drawString(29 * mm, self.height - 13 * mm, self.title)
        if self.subtitle:
            c.setFillColor(colors.HexColor("#C7D1DF"))
            c.setFont("ArialNova", 8.8)
            c.drawString(29 * mm, self.height - 22 * mm, self.subtitle)


class ContextFlow(Flowable):
    def __init__(self):
        super().__init__()
        self.height = 47 * mm

    def wrap(self, availWidth, availHeight):
        self._availWidth = availWidth
        return availWidth, self.height

    def draw(self):
        c = self.canv
        w = self._availWidth
        labels = [
            ("Quellen", "Dokumente\nCRM\nGespräche"),
            ("Context Layer", "Struktur\nRechte\nGültigkeit"),
            ("Workflow", "Briefing\nSales Prep\nContent"),
            ("Output", "zitiert\nprüfbar\nfreigegeben"),
            ("ContextOps", "Pflege\nTests\nFeedback"),
        ]
        colors_list = [NAVY_2, TEAL_DARK, PURPLE, AMBER, TEAL]
        gap = 5 * mm
        box_w = (w - gap * 4) / 5
        y = 8 * mm
        for idx, ((title, lines), fill) in enumerate(zip(labels, colors_list)):
            x = idx * (box_w + gap)
            c.setFillColor(fill)
            c.roundRect(x, y, box_w, 30 * mm, 3 * mm, fill=1, stroke=0)
            c.setFillColor(WHITE if idx != 3 else NAVY)
            c.setFont("ArialNova-Bold", 8)
            c.drawCentredString(x + box_w / 2, y + 22 * mm, title)
            c.setFont("ArialNova", 6.8)
            for line_i, line in enumerate(lines.split("\n")):
                c.drawCentredString(x + box_w / 2, y + (14 - line_i * 4.2) * mm, line)
            if idx < 4:
                arrow_x = x + box_w
                c.setStrokeColor(MUTED)
                c.setFillColor(MUTED)
                c.setLineWidth(1)
                c.line(arrow_x + 1 * mm, y + 15 * mm, arrow_x + gap - 1.5 * mm, y + 15 * mm)
                c.wedge(
                    arrow_x + gap - 3 * mm,
                    y + 13.5 * mm,
                    arrow_x + gap,
                    y + 16.5 * mm,
                    270,
                    180,
                    fill=1,
                    stroke=0,
                )
        c.setStrokeColor(TEAL)
        c.setLineWidth(1.1)
        c.line(w - box_w / 2, y + 4 * mm, box_w / 2, y + 4 * mm)
        c.setFillColor(TEAL)
        c.wedge(box_w / 2 - 1.5 * mm, y + 2.5 * mm, box_w / 2 + 1.5 * mm, y + 5.5 * mm, 90, 180, fill=1, stroke=0)


class AdoptionChart(Flowable):
    def __init__(self):
        super().__init__()
        self.height = 58 * mm

    def wrap(self, availWidth, availHeight):
        self._availWidth = availWidth
        return availWidth, self.height

    def draw(self):
        c = self.canv
        w = self._availWidth
        data = [
            ("10-49 Beschäftigte", 23, TEAL),
            ("50-249 Beschäftigte", 36, PURPLE),
            ("250+ Beschäftigte", 57, AMBER),
        ]
        label_w = 43 * mm
        max_bar = w - label_w - 18 * mm
        y = self.height - 13 * mm
        c.setFont("ArialNova-Bold", 8)
        c.setFillColor(NAVY)
        c.drawString(0, self.height - 5 * mm, "AI-Nutzung in Deutschland 2025 nach Unternehmensgröße")
        for label, value, fill in data:
            c.setFillColor(INK)
            c.setFont("ArialNova", 7.8)
            c.drawString(0, y + 1.5 * mm, label)
            c.setFillColor(LINE)
            c.roundRect(label_w, y, max_bar, 6 * mm, 2 * mm, fill=1, stroke=0)
            c.setFillColor(fill)
            c.roundRect(label_w, y, max_bar * value / 60, 6 * mm, 2 * mm, fill=1, stroke=0)
            c.setFillColor(NAVY)
            c.setFont("ArialNova-Bold", 8.2)
            c.drawRightString(w, y + 1.3 * mm, f"{value}%")
            y -= 13 * mm
        c.setFont("ArialNova", 6.8)
        c.setFillColor(MUTED)
        c.drawString(0, 2 * mm, "Quelle: Destatis, Unternehmen mit mindestens 10 Beschäftigten.")


class EvidenceLadder(Flowable):
    def __init__(self):
        super().__init__()
        self.height = 78 * mm

    def wrap(self, availWidth, availHeight):
        self._availWidth = availWidth
        return availWidth, self.height

    def draw(self):
        c = self.canv
        w = self._availWidth
        levels = [
            ("A", "Offizielle Statistik & Recht", "Marktgröße, Größenunterschiede, Pflichten", TEAL_DARK),
            ("B", "Kausale & systematische Forschung", "Wirkung im untersuchten Workflow", PURPLE),
            ("C", "Explorative Organisationsforschung", "Muster und Erfolgsbedingungen", AMBER),
            ("D", "Benannte Anbieterfälle", "Praxisnähe, mögliche Metriken", colors.HexColor("#E47A56")),
            ("E", "Marktangebote", "Preisanker und Konkurrenz", MUTED),
        ]
        step_h = 13 * mm
        base_w = w
        for i, (letter, title, desc, fill) in enumerate(levels):
            level_w = base_w - i * 12 * mm
            x = (w - level_w) / 2
            y = self.height - (i + 1) * step_h
            c.setFillColor(fill)
            c.roundRect(x, y, level_w, 10 * mm, 2 * mm, fill=1, stroke=0)
            c.setFillColor(WHITE)
            c.setFont("ArialNova-Bold", 8.2)
            c.drawString(x + 4 * mm, y + 3.2 * mm, f"{letter}  {title}")
            c.setFont("ArialNova", 6.8)
            c.drawRightString(x + level_w - 4 * mm, y + 3.3 * mm, desc)
        c.setFillColor(MUTED)
        c.setFont("ArialNova", 6.8)
        c.drawCentredString(w / 2, 2 * mm, "Je weiter unten, desto stärker müssen Aussagen als Hypothese behandelt werden.")


class OpportunityBars(Flowable):
    def __init__(self, data: list[tuple[str, int]]):
        super().__init__()
        self.data = data
        self.height = 82 * mm

    def wrap(self, availWidth, availHeight):
        self._availWidth = availWidth
        return availWidth, self.height

    def draw(self):
        c = self.canv
        w = self._availWidth
        label_w = 56 * mm
        max_bar = w - label_w - 12 * mm
        y = self.height - 9 * mm
        colors_seq = [TEAL, PURPLE, AMBER, TEAL_DARK, colors.HexColor("#6884B8"), colors.HexColor("#A77BC8"), MUTED]
        for idx, (label, value) in enumerate(self.data):
            c.setFillColor(INK)
            c.setFont("ArialNova", 7.6)
            c.drawString(0, y + 1.2 * mm, label)
            c.setFillColor(LINE)
            c.roundRect(label_w, y, max_bar, 5 * mm, 1.8 * mm, fill=1, stroke=0)
            c.setFillColor(colors_seq[idx])
            c.roundRect(label_w, y, max_bar * value / 100, 5 * mm, 1.8 * mm, fill=1, stroke=0)
            c.setFillColor(NAVY)
            c.setFont("ArialNova-Bold", 7.8)
            c.drawRightString(w, y + 1 * mm, str(value))
            y -= 10 * mm


class PilotTimeline(Flowable):
    def __init__(self):
        super().__init__()
        self.height = 48 * mm

    def wrap(self, availWidth, availHeight):
        self._availWidth = availWidth
        return availWidth, self.height

    def draw(self):
        c = self.canv
        w = self._availWidth
        phases = [
            ("1", "Diagnose", "Workflow\nBaseline"),
            ("2", "Kontext", "Quellen\nStruktur"),
            ("3", "Build", "AI-Zugriff\nPrototyp"),
            ("4", "Test", "Golden\nQuestions"),
            ("5", "Betrieb", "Training\nContextOps"),
        ]
        gap = 4 * mm
        box_w = (w - 4 * gap) / 5
        for i, (num, title, desc) in enumerate(phases):
            x = i * (box_w + gap)
            fill = [TEAL_DARK, TEAL, PURPLE, AMBER, NAVY_2][i]
            c.setFillColor(fill)
            c.roundRect(x, 7 * mm, box_w, 30 * mm, 3 * mm, fill=1, stroke=0)
            c.setFillColor(WHITE if i != 3 else NAVY)
            c.setFont("ArialNova-Bold", 8.5)
            c.drawString(x + 4 * mm, 30 * mm, f"W{num}")
            c.setFont("ArialNova-Bold", 8)
            c.drawString(x + 4 * mm, 23 * mm, title)
            c.setFont("ArialNova", 6.8)
            for j, line in enumerate(desc.split("\n")):
                c.drawString(x + 4 * mm, (15 - j * 4.4) * mm, line)


def stat_card(number: str, label: str, note: str, fill=TEAL_DARK, width=None) -> Table:
    number_style = ParagraphStyle(
        "StatNumber",
        fontName="ArialNova-Bold",
        fontSize=24,
        leading=26,
        textColor=WHITE,
        alignment=TA_CENTER,
    )
    label_style = ParagraphStyle(
        "StatLabel",
        fontName="ArialNova-Bold",
        fontSize=8.4,
        leading=10.5,
        textColor=WHITE,
        alignment=TA_CENTER,
    )
    note_style = ParagraphStyle(
        "StatNote",
        fontName="ArialNova",
        fontSize=6.7,
        leading=8.4,
        textColor=colors.HexColor("#D8E1EB"),
        alignment=TA_CENTER,
    )
    inner = Table(
        [[p(number, number_style)], [p(label, label_style)], [p(note, note_style)]],
        colWidths=[(width or CONTENT_W / 3) - 6 * mm],
    )
    inner.setStyle(TableStyle([
        ("LEFTPADDING", (0, 0), (-1, -1), 3),
        ("RIGHTPADDING", (0, 0), (-1, -1), 3),
        ("TOPPADDING", (0, 0), (-1, -1), 2),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 2),
    ]))
    out = Table([[inner]], colWidths=[width or CONTENT_W / 3])
    out.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), fill),
        ("BOX", (0, 0), (-1, -1), 0, fill),
        ("LEFTPADDING", (0, 0), (-1, -1), 3 * mm),
        ("RIGHTPADDING", (0, 0), (-1, -1), 3 * mm),
        ("TOPPADDING", (0, 0), (-1, -1), 5 * mm),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 5 * mm),
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
    ]))
    return out


def data_table(headers: list[str], rows: list[list[str]], widths: list[float]) -> Table:
    data = [[p(h, TABLE_HEAD) for h in headers]]
    for row in rows:
        data.append([p(cell, TABLE_BODY) for cell in row])
    table = Table(data, colWidths=widths, repeatRows=1)
    style_cmds = [
        ("BACKGROUND", (0, 0), (-1, 0), NAVY_2),
        ("GRID", (0, 0), (-1, -1), 0.4, LINE),
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
        ("LEFTPADDING", (0, 0), (-1, -1), 3 * mm),
        ("RIGHTPADDING", (0, 0), (-1, -1), 3 * mm),
        ("TOPPADDING", (0, 0), (-1, -1), 2.5 * mm),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 2.5 * mm),
    ]
    for r in range(1, len(data)):
        style_cmds.append(("BACKGROUND", (0, r), (-1, r), WHITE if r % 2 else LIGHT))
    table.setStyle(TableStyle(style_cmds))
    return table


def draw_cover(c: canvas.Canvas, doc) -> None:
    c.saveState()
    c.setFillColor(NAVY)
    c.rect(0, 0, PAGE_W, PAGE_H, fill=1, stroke=0)
    c.setFillColor(NAVY_2)
    c.circle(PAGE_W - 18 * mm, PAGE_H - 25 * mm, 58 * mm, fill=1, stroke=0)
    c.setFillColor(PURPLE)
    c.circle(PAGE_W - 6 * mm, PAGE_H - 8 * mm, 32 * mm, fill=1, stroke=0)
    c.setFillColor(TEAL)
    c.circle(PAGE_W - 32 * mm, PAGE_H - 51 * mm, 16 * mm, fill=1, stroke=0)
    c.setFillColor(AMBER)
    c.circle(23 * mm, 22 * mm, 7 * mm, fill=1, stroke=0)
    c.restoreState()


def draw_body(c: canvas.Canvas, doc) -> None:
    c.saveState()
    c.setFillColor(WHITE)
    c.rect(0, 0, PAGE_W, PAGE_H, fill=1, stroke=0)
    c.setStrokeColor(LINE)
    c.setLineWidth(0.5)
    c.line(MARGIN_X, PAGE_H - 12 * mm, PAGE_W - MARGIN_X, PAGE_H - 12 * mm)
    c.setFont("ArialNova-Bold", 6.8)
    c.setFillColor(MUTED)
    c.drawString(MARGIN_X, PAGE_H - 9 * mm, "COMMERCIAL CONTEXT SYSTEMS")
    c.setFont("ArialNova", 6.8)
    c.drawRightString(PAGE_W - MARGIN_X, PAGE_H - 9 * mm, "Research Edition | 30.07.2026")
    c.line(MARGIN_X, 11 * mm, PAGE_W - MARGIN_X, 11 * mm)
    c.setFont("ArialNova", 6.8)
    c.drawString(MARGIN_X, 7 * mm, "Deutschland & EU | KMU und Mid-Market")
    c.drawRightString(PAGE_W - MARGIN_X, 7 * mm, f"{doc.page}")
    c.restoreState()


def build_story() -> list:
    story: list = []

    # Cover
    story += [
        Spacer(1, 35 * mm),
        p("RESEARCH EDITION 2026", ParagraphStyle(
            "CoverKicker", parent=KICKER, textColor=TEAL, fontSize=9.5, leading=12
        )),
        p("Commercial<br/>Context Systems", ParagraphStyle(
            "CoverTitle", fontName="ArialNova-Bold", fontSize=35, leading=37, textColor=WHITE
        )),
        Spacer(1, 8 * mm),
        p("Wie sich AI-fähige „Second Brains“ als Beratung, Pilot und Managed Service in Deutschland und der EU monetarisieren lassen",
          ParagraphStyle("CoverSub", fontName="ArialNova-Light", fontSize=14, leading=19, textColor=colors.HexColor("#D8E1EB"))),
        Spacer(1, 22 * mm),
        Table(
            [[tag("MARKT", NAVY_2, WHITE), tag("EVIDENZ", NAVY_2, WHITE), tag("ANGEBOTE", NAVY_2, WHITE), tag("PILOT", NAVY_2, WHITE)]],
            colWidths=[34 * mm] * 4,
            hAlign="LEFT",
            style=TableStyle([
                ("LEFTPADDING", (0, 0), (-1, -1), 0),
                ("RIGHTPADDING", (0, 0), (-1, -1), 3 * mm),
                ("TOPPADDING", (0, 0), (-1, -1), 0),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 0),
            ]),
        ),
        Spacer(1, 31 * mm),
        p("Für: Geschäftsführung, Marketing, Sales, Agenturen und wissensintensive Teams",
          ParagraphStyle("CoverFooter", fontName="ArialNova", fontSize=8.5, leading=11, textColor=colors.HexColor("#AAB7C8"))),
        NextPageTemplate("body"),
        PageBreak(),
    ]

    # Executive brief
    story += [
        p("EXECUTIVE BRIEF", KICKER),
        p("Die Chance ist nicht das Second Brain.<br/>Die Chance ist verlässlicher Kontext.", H1),
        p(
            "Generative AI wird zur Standardfunktion. Unternehmensspezifischer Kontext bleibt dagegen knapp: "
            "Zielkunden, Claims, Kundenhistorie, Entscheidungen, Ausnahmen, Quellen und Freigaben entstehen im Unternehmen "
            "und müssen dort orchestriert werden."
        ),
        Spacer(1, 3 * mm),
        card(
            "Zentrale Empfehlung",
            "<b>Verkauft kein Tool und keine bessere Prompt-Sammlung.</b> Verkauft die Fähigkeit eines Teams, "
            "in einem wichtigen Workflow schneller zu belastbaren, marken- und kundengerechten Ergebnissen zu kommen - "
            "ohne dass Geschäftsführung oder Senior-Experten jedes Mal fehlenden Kontext nachliefern.",
            bg=PALE_TEAL,
            accent=TEAL,
        ),
        Spacer(1, 6 * mm),
        p("Was jetzt priorisiert werden sollte", H2),
        two_col(
            card(
                "1  Beachhead",
                "<b>Agenturen und Beratungen mit 20-150 Beschäftigten.</b><br/>"
                "Produkt: Client Context Sprint für Briefings, Übergaben und Content.",
                bg=PALE_PURPLE,
                accent=PURPLE,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "2  Wachstumsmarkt",
                "<b>B2B-Unternehmen mit getrenntem Marketing- und Sales-Wissen.</b><br/>"
                "Produkt: Revenue Context Sprint für Zielkunden, Claims, Einwände und Sales-Lernen.",
                bg=PALE_AMBER,
                accent=AMBER,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 5 * mm),
        two_col(
            card(
                "3  Geschäftsmodell",
                "Audit plus enger Pilot: <b>7.500-10.000 EUR</b>.<br/>"
                "Managed ContextOps: <b>1.000-2.500 EUR pro Monat</b>.<br/>"
                "Preise sind zu validierende Hypothesen.",
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "4  Technologie",
                "Methodisch technologieoffen. M365 ist eine priorisierte Delivery-Route, kein exklusives Segment. "
                "Komplexe Tenant-, Purview- und Security-Themen über Partner abdecken.",
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 6 * mm),
        p("Was zunächst nicht gebaut werden sollte", H2),
        bullet_list([
            "kein allgemeines Company Brain für das gesamte Unternehmen",
            "keine individuelle SaaS-Plattform vor drei bis fünf realen Projekten",
            "keine vollautonomen Agents in sensiblen oder kundenwirksamen Entscheidungen",
            "keine unternehmensweite Datenmigration innerhalb eines Lernpiloten",
        ]),
        PageBreak(),
    ]

    # Context system
    story += [
        SectionBand("01", "Das Produkt", "Vom Wissensspeicher zum arbeitenden Context System", TEAL),
        Spacer(1, 8 * mm),
        p("Ein Second Brain ist kein Selbstzweck", H1),
        p(
            "Ein professionelles Second Brain verbindet eine quellenbasierte Wissensbasis mit einem konkreten Arbeitsablauf. "
            "Sein Wert entsteht erst, wenn Menschen und AI den richtigen Kontext finden, die Antwort prüfen können und das "
            "System nach jeder Nutzung besser gepflegt wird."
        ),
        Spacer(1, 6 * mm),
        ContextFlow(),
        Spacer(1, 4 * mm),
        p("Fünf Bestandteile eines verkaufbaren Systems", H2),
        data_table(
            ["Baustein", "Aufgabe", "Kundennutzen"],
            [
                ["Wissensbasis", "Quellen, Entscheidungen und Regeln erfassen", "Unternehmenswissen wird verfügbar"],
                ["Kontextarchitektur", "Wissen für einen Workflow auswählen und strukturieren", "weniger generische Ergebnisse"],
                ["Retrieval & Tests", "reale Fragen, Sollantworten und Quellen prüfen", "Vertrauen wird messbar"],
                ["Governance", "Rechte, Freigaben, Gültigkeit und Eigentümer klären", "Risiko und Widerspruch sinken"],
                ["ContextOps", "Lücken, Änderungen und Nutzung laufend bearbeiten", "der Kontext bleibt aktuell"],
            ],
            [32 * mm, 72 * mm, 69 * mm],
        ),
        Spacer(1, 4 * mm),
        card(
            "Die Kategorie für den Markt",
            "<b>Commercial Context Systems</b><br/>AI-fähige Wissens- und Workflow-Systeme für Marketing, Sales und Kundenarbeit.",
            bg=PALE_TEAL,
            accent=TEAL,
        ),
        PageBreak(),
    ]

    # Market evidence
    story += [
        SectionBand("02", "Warum jetzt", "Marktverbreitung, Größenlücke und Kompetenzbedarf", PURPLE),
        Spacer(1, 8 * mm),
        p("AI ist angekommen. Reife und Kontext sind ungleich verteilt.", H1),
        Table(
            [[
                stat_card("26%", "deutsche Unternehmen nutzen AI", "Destatis 2025", TEAL_DARK, 56 * mm),
                stat_card("20%", "EU-Unternehmen nutzen AI", "Eurostat 2025", PURPLE, 56 * mm),
                stat_card("780k", "deutsche Mittelständler nutzen AI", "KfW 2026", NAVY_2, 56 * mm),
            ]],
            colWidths=[56 * mm, 56 * mm, 56 * mm],
            style=TableStyle([
                ("LEFTPADDING", (0, 0), (-1, -1), 0),
                ("RIGHTPADDING", (0, 0), (-1, -1), 3 * mm),
                ("TOPPADDING", (0, 0), (-1, -1), 0),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 0),
                ("VALIGN", (0, 0), (-1, -1), "TOP"),
            ]),
        ),
        Spacer(1, 7 * mm),
        AdoptionChart(),
        Spacer(1, 2 * mm),
        two_col(
            card(
                "Wissensintensive Services als Frühsegment",
                "KfW berichtet eine AI-Nutzung von <b>28%</b> bei wissensbasierten Dienstleistungen. "
                "Mittelständler ab 50 Beschäftigten liegen bei <b>36%</b>.",
                bg=PALE_PURPLE,
                accent=PURPLE,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Die Adoption ist nicht nur technisch",
                "Die OECD nennt Skills, Daten, Finanzierung und Infrastruktur als zentrale Enabler. "
                "Rund <b>40%</b> der deutschen Befragten in einer G7-SME-Erhebung nannten fehlendes GenAI-Nutzungswissen als Barriere.",
                bg=PALE_AMBER,
                accent=AMBER,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        source_note(
            "[E1] Destatis 2025; [E2] KfW Fokus Nr. 533, 2026; [E3] Eurostat 2025; [E4] OECD SME AI Adoption 2025. "
            "Nutzung ist kein Beleg für Erfolg oder Zahlungsbereitschaft."
        ),
        PageBreak(),
    ]

    # Evidence method
    story += [
        SectionBand("03", "Evidenz", "Was wirklich belegt ist - und was Hypothese bleibt", AMBER),
        Spacer(1, 8 * mm),
        p("Nicht jede Prozentzahl ist gleich belastbar", H1),
        p(
            "Die Marktthese wird mit unterschiedlichen Quellentypen gestützt. Offizielle Statistik belegt Verbreitung, "
            "Feldforschung kann Wirkung in einem konkreten Workflow zeigen, Anbieterfälle illustrieren Umsetzungen. "
            "Keiner dieser Belege beweist allein, dass ein deutsches KMU euer Angebot kaufen wird."
        ),
        Spacer(1, 5 * mm),
        EvidenceLadder(),
        Spacer(1, 4 * mm),
        two_col(
            card(
                "Gut belegt",
                "AI-Adoption wächst. Größere und wissensintensive Mittelständler sind weiter. "
                "Skills und organisatorische Reife sind zentrale Bedingungen. Enge, wissensreiche Workflows können messbaren Nutzen erzeugen.",
                bg=PALE_TEAL,
                accent=TEAL,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Noch zu validieren",
                "Welches Segment hat Budget? Welcher Workflow ist dringend? Welche Pilotmetrik trägt den Verkauf? "
                "Wie viel Pflege wird ausgelagert? Versteht der Markt die Kategorie Commercial Context System?",
                bg=PALE_RED,
                accent=RED,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 5 * mm),
        card(
            "Evidenzgrenze",
            "Es existiert kein belastbarer, allgemeiner ROI für ein „Second Brain“. Die tragfähige Beweisführung muss "
            "workflow-spezifisch sein: Baseline, Golden Questions, Nutzungsdaten und ein klarer Vorher-Nachher-Vergleich.",
            bg=LIGHT,
            accent=MUTED,
        ),
        PageBreak(),
    ]

    # QJE study
    story += [
        p("EVIDENZ B | KAUSALE FELDFORSCHUNG", KICKER),
        p("Wenn Organisationswissen im Workflow verfügbar wird", H1),
        p(
            "Die stärkste wissenschaftliche Analogie zu einem Context System stammt aus dem Customer Support. "
            "Brynjolfsson, Li und Raymond untersuchten die gestaffelte Einführung eines generativen AI-Assistenten "
            "bei 5.172 Support-Mitarbeitern eines Fortune-500-Softwareunternehmens."
        ),
        Spacer(1, 5 * mm),
        Table(
            [[
                stat_card("+15%", "gelöste Fälle pro Stunde", "durchschnittlicher Effekt", TEAL_DARK, 54 * mm),
                stat_card("5.172", "Mitarbeiter im Feld", "realer Betriebsprozess", PURPLE, 54 * mm),
                stat_card("2 vs. 8-10", "Monate bis zum Vergleichsniveau", "neue Mitarbeiter mit vs. ohne AI", AMBER, 60 * mm),
            ]],
            colWidths=[54 * mm, 54 * mm, 60 * mm],
            style=TableStyle([
                ("LEFTPADDING", (0, 0), (-1, -1), 0),
                ("RIGHTPADDING", (0, 0), (-1, -1), 3 * mm),
                ("TOPPADDING", (0, 0), (-1, -1), 0),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 0),
            ]),
        ),
        Spacer(1, 8 * mm),
        two_col(
            card(
                "Warum die Studie relevant ist",
                "Der Assistent arbeitete nicht als allgemeiner Chatbot. Er nutzte frühere Interaktionen und technische "
                "Dokumentation, um situationsbezogene Vorschläge zu geben. Der größte Nutzen entstand dort, wo ein "
                "Mitarbeiter ein Problem selten, das System es aber oft gesehen hatte.",
                bg=PALE_TEAL,
                accent=TEAL,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Was sie nicht beweist",
                "Support ist ein stabiler, digitalisierter Prozess. Marketingstrategie, Executive Decisions und Beratung "
                "sind offener und schwerer zu evaluieren. Top-Performer profitierten weniger; einzelne Qualitätsmetriken "
                "verschlechterten sich leicht.",
                bg=PALE_AMBER,
                accent=AMBER,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 7 * mm),
        p("Business-Übersetzung", H2),
        data_table(
            ["Studienmuster", "Mögliche Opportunity"],
            [
                ["Best Practices werden an weniger Erfahrene verteilt", "Sales Knowledge System / Founder Knowledge Transfer"],
                ["Dokumentation plus Interaktionshistorie", "Marketing-Sales Context Layer"],
                ["stärkster Effekt bei moderat seltenen Problemen", "Golden Questions aus realen Ausnahmefällen"],
                ["Top-Performer brauchen andere Assistenz", "Human Review und rollenbezogene Workflows"],
            ],
            [80 * mm, 93 * mm],
        ),
        source_note("[E5] Brynjolfsson, Li & Raymond, Generative AI at Work, Quarterly Journal of Economics, 2025."),
        PageBreak(),
    ]

    # Jagged frontier and other research
    story += [
        p("EVIDENZ B/C | TASK-FIT UND ORGANISATION", KICKER),
        p("AI ist stark - aber nicht gleichmäßig stark", H1),
        two_col(
            card(
                "Jagged Technological Frontier",
                "Randomisiertes Feldexperiment mit <b>758 BCG-Beratern</b>. Bei Aufgaben innerhalb der AI-Leistungsgrenze: "
                "<b>mehr als 25% schneller</b>, <b>mehr als 40% höhere Qualität</b> und <b>mehr als 12% mehr erledigte Aufgaben</b>.",
                bg=PALE_PURPLE,
                accent=PURPLE,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Die Warnung",
                "Bei Aufgaben außerhalb der Leistungsgrenze konnte AI die Ergebnisse verschlechtern. "
                "Die Konsequenz ist kein breiter Rollout, sondern eine enge Auswahl wiederholbarer, gut prüfbarer Workflows.",
                bg=PALE_RED,
                accent=RED,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 7 * mm),
        p("Drei weitere Forschungssignale", H2),
        data_table(
            ["Quelle", "Ergebnis", "Bedeutung"],
            [
                [
                    "Systematischer RAG-Review 2026",
                    "Enterprise RAG ist relevant, aber operative Daten stammen häufig zuerst aus Vendor Reports und Preprints.",
                    "Technik ist plausibel; Business-Wirkung muss im Pilot bewiesen werden.",
                ],
                [
                    "Journal of Knowledge Management",
                    "52 Experteninterviews, 20 Einflussfaktoren für AI in KM und Entscheidungen.",
                    "Menschen, Prozesse, Technologie und Feedback gehören zusammen.",
                ],
                [
                    "Familien-SME-Forschung",
                    "Tacit Knowledge Transfer ist wichtig, allein aber nicht ausreichend für Innovation.",
                    "Founder Brain muss Anwendung und neues Lernen ermöglichen.",
                ],
            ],
            [46 * mm, 68 * mm, 59 * mm],
        ),
        Spacer(1, 7 * mm),
        card(
            "Der Pilot als wissenschaftlich saubere Antwort",
            "Ein Team. Ein wiederkehrender Workflow. Ein definierter Done-Zustand. Echte Fragen. Eine Baseline. "
            "Quellenpflicht. Menschliche Freigabe. Erst dann lässt sich unterscheiden, ob der Context Layer wirkt "
            "oder nur zusätzliche Dokumentation erzeugt.",
            bg=PALE_TEAL,
            accent=TEAL,
        ),
        source_note("[E6] HBS/BCG; [E7] Applied Sciences RAG Review; [E8] Leoni et al.; [E9] Letonja & Duh."),
        PageBreak(),
    ]

    # Cases
    story += [
        SectionBand("04", "Praxisfälle", "Europäische Umsetzungsmuster - Anbieterberichte klar gekennzeichnet", TEAL),
        Spacer(1, 8 * mm),
        p("Die stärksten Cases für euren Beachhead", H1),
        two_col(
            card(
                "Karhu Helsinki | Agency Client Brain",
                "<b>Finnland, ca. 40 Beschäftigte.</b><br/>Eigene Wissensräume je Kunde; Kickoffs, Spezifikationen, "
                "Entscheidungen und Updates für Team und Kunde. Berichtet werden einfacheres Onboarding, flüssigere "
                "Übergaben und weniger interne E-Mails.<br/><br/><b>Wichtige Grenze:</b> interne und kundensichtbare Inhalte trennen.",
                bg=PALE_TEAL,
                accent=TEAL,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Brainlabs | Context Layer für Agenten",
                "<b>Internationale Mediaagentur.</b><br/>Notion als Kontext- und Sichtbarkeitsebene über eigenen Tools. "
                "Kunden-Onboarding wird in Aufgaben übersetzt; Markenrichtlinien fließen in Outputs. "
                "Ein Anbieter-Webinar beschreibt Automatisierung über rund 300 Kundenaccounts.",
                bg=PALE_PURPLE,
                accent=PURPLE,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 7 * mm),
        two_col(
            card(
                "Alan | Marketing-Sales Learning Loop",
                "<b>Frankreich/Europa.</b><br/>Sales-Transkripte werden gegen ein Narrative Framework analysiert. "
                "Dust berichtet 80% weniger Analyseaufwand, 10x mehr Insights und mehr als 20% Effizienzgewinn in Sales und Marketing.",
                bg=PALE_AMBER,
                accent=AMBER,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Patch | Sales Knowledge",
                "<b>Europa, 1-50 Beschäftigte.</b><br/>Sales-Recherche und Expertenwissen in Agents. Dust berichtet "
                "nach drei Monaten 70% wöchentliche Nutzung und Datennutzung in rund 70% der Sales Calls statt 10% zuvor.",
                bg=LIGHT,
                accent=NAVY_2,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 6 * mm),
        source_note(
            "Alle Zahlen auf dieser Seite sind vendor-reported: [E10] Slite/Karhu; [E11] Notion/Brainlabs; "
            "[E12] Dust/Alan; [E13] Dust/Patch. Sie sind Musterbelege, keine unabhängigen Kausalstudien."
        ),
        PageBreak(),
    ]

    story += [
        p("PRAXISFÄLLE | DEUTSCHLAND UND EU", KICKER),
        p("Wissenszugriff, Adoption und schrittweiser Aufbau", H1),
        data_table(
            ["Unternehmen", "Ausgangslage und Lösung", "Berichtetes Signal", "Evidenzgrenze"],
            [
                [
                    "ECE Group<br/>Deutschland",
                    "Copilot durchsucht vorhandene Unternehmenswissensbasis; Training und Community begleiten den Pilot.",
                    "Rund 70% der Pilotnutzer wollten die Lizenz behalten.",
                    "Microsoft-Kundenfall, kein unabhängiger ROI.",
                ],
                [
                    "Idea Informatica<br/>Italien, 11-50",
                    "Wissen lag auf Servern, Rechnern und in Köpfen langjähriger Mitarbeiter.",
                    "Zentralisierung und besseres Onboarding berichtet.",
                    "Slite-Kundenfall ohne harte ROI-Metrik.",
                ],
                [
                    "Eulerian<br/>Frankreich, ca. 50",
                    "Keine Big-Bang-Migration von 20.000+ Altdokumenten; Inhalte bei realer Nachfrage neu aufgebaut.",
                    "700+ strukturierte Dokumente in wenigen Monaten.",
                    "Menge belegt noch keine Nutzungsqualität.",
                ],
                [
                    "Mercedes-Benz<br/>Deutschland",
                    "Confluence, Jira und Rovo über einheitlichen Teamwork Graph; mehr Governance bei wachsender Komplexität.",
                    "Organisatorisches Gedächtnis als Plattformprinzip.",
                    "Enterprise-Fall, nur bedingt auf KMU übertragbar.",
                ],
            ],
            [31 * mm, 69 * mm, 43 * mm, 30 * mm],
        ),
        Spacer(1, 7 * mm),
        card(
            "Das wiederkehrende Muster",
            "Erfolgreiche Cases beginnen selten mit dem gesamten Unternehmenswissen. Sie starten mit einem klaren Problem, "
            "begrenzten Quellen, sichtbaren Nutzern und einer realen Arbeitsroutine. Governance und Trennung von Zugriffen "
            "werden wichtiger, sobald der Einsatz skaliert.",
            bg=PALE_TEAL,
            accent=TEAL,
        ),
        source_note("[E14] Microsoft/ECE; [E15] Slite/Idea Informatica; [E16] Slite/Eulerian; [E17] Atlassian/Mercedes-Benz."),
        PageBreak(),
    ]

    # Opportunities
    story += [
        SectionBand("05", "Opportunities", "Geschäftschancen im vergleichbaren Portfolio", PURPLE),
        Spacer(1, 8 * mm),
        p("Sieben Chancen - aber nicht sieben Startangebote", H1),
        p(
            "Die Scores sind eine Arbeitshypothese. Bewertet wurden Schmerz, Skill-Fit, Preisplausibilität, "
            "Umsetzbarkeit in vier bis sechs Wochen, Fallbelege, Retainer-Potenzial, EU-Risiko und Differenzierung."
        ),
        Spacer(1, 5 * mm),
        OpportunityBars([
            ("Agency Client Brain", 90),
            ("Marketing-Sales Context Layer", 86),
            ("Sales Knowledge System", 84),
            ("Marketing Context Hub", 83),
            ("Founder Knowledge Transfer", 79),
            ("Executive Decision Memory", 75),
            ("AI Readiness Knowledge Audit", 74),
        ]),
        Spacer(1, 5 * mm),
        two_col(
            card(
                "Beachhead",
                "<b>Agency Client Brain</b><br/>Schneller Zugang, wiederholbare Kundenstruktur, starker Skill-Fit und "
                "natürliche Expansion auf weitere Accounts.",
                bg=PALE_TEAL,
                accent=TEAL,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Strategischer Ausbau",
                "<b>Marketing-Sales Context Layer</b><br/>Höherer langfristiger Wert durch gemeinsame Zielkunden, "
                "Claims, Gesprächswissen und Übergaben - aber komplexerer Erstverkauf.",
                bg=PALE_PURPLE,
                accent=PURPLE,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 4 * mm),
        source_note("Scores sind keine Marktdaten. Sie strukturieren die derzeitige Hypothese und müssen durch Käuferinterviews ersetzt werden."),
        PageBreak(),
    ]

    # Opportunity details 1
    story += [
        p("OPPORTUNITY 01", KICKER),
        p("Agency Client Context System", H1),
        p(
            "Ein wiederverwendbares Kundenkontext-System für Agenturen und Beratungen. Pro Kunde werden Ziele, Zielgruppen, "
            "Marke, Produkte, freigegebene Claims, Entscheidungen, Kampagnenlernen und offene Fragen in einer einheitlichen "
            "Struktur verbunden."
        ),
        Spacer(1, 5 * mm),
        two_col(
            card(
                "Wer kauft?",
                "Agenturinhaber, Geschäftsführung, COO, Head of Client Service, Account- oder Strategy-Leitung.",
                bg=PALE_TEAL,
                accent=TEAL,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Wann wird gekauft?",
                "Übergaben hängen an Gesprächen, Briefings variieren, Entscheidungen liegen in E-Mails, "
                "Onboarding dauert und die Geschäftsführung wird Freigabeflaschenhals.",
                bg=PALE_AMBER,
                accent=AMBER,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 6 * mm),
        p("Pilotprodukt: Client Context Sprint", H2),
        data_table(
            ["Scope", "Lieferobjekt", "Test"],
            [
                ["1 wichtiger Bestandskunde", "Client Context Pack", "20 echte Kundenfragen"],
                ["5-12 interne Nutzer", "Quellen- und Rechteinventar", "Briefing vor/nach Aufbau"],
                ["1-2 Outputs", "AI-Workflow plus Freigabe", "Übergabe ohne Senior-Call"],
                ["5 Wochen", "30-Tage-Betriebsplan", "Nutzung und Lücken"],
            ],
            [50 * mm, 70 * mm, 53 * mm],
        ),
        Spacer(1, 7 * mm),
        card(
            "Warum das skaliert",
            "Die Informationsarchitektur kann von einem Kunden auf weitere Accounts übertragen werden. "
            "Ein erfolgreicher Pilot erzeugt dadurch einen natürlichen Expansionseffekt und später ein Partner- oder Lizenzmodell.",
            bg=PALE_PURPLE,
            accent=PURPLE,
        ),
        Spacer(1, 5 * mm),
        card(
            "Hauptrisiko",
            "Interne und kundensichtbare Informationen vermischen sich. Der Pilot braucht deshalb eine explizite "
            "Freigabelogik und getrennte Sicht auf interne Notizen, Arbeitswissen und veröffentlichbare Aussagen.",
            bg=PALE_RED,
            accent=RED,
        ),
        PageBreak(),
    ]

    # Opportunity details 2
    story += [
        p("OPPORTUNITIES 02-04", KICKER),
        p("Die kommerzielle Context Suite", H1),
        data_table(
            ["Modul", "Kernproblem", "Pilot-Output", "Käufer"],
            [
                [
                    "Marketing-Sales Context Layer",
                    "unterschiedliche Zielkunden, Claims und Begriffe; Sales-Lernen erreicht Marketing nicht",
                    "Revenue Context Pack plus Account Brief oder Einwandworkflow",
                    "CEO, CMO, CRO, RevOps",
                ],
                [
                    "Sales Knowledge System",
                    "Kundenfragen, Einwände und Top-Performer-Wissen sind schwer auffindbar",
                    "30-50 geprüfte Fragen, Proof Points und Meeting Prep",
                    "Head of Sales, CRO, Enablement",
                ],
                [
                    "Marketing Context Hub",
                    "AI-Content klingt generisch; Marke, Markt und Produkt müssen immer neu erklärt werden",
                    "Context Pack für ein Produkt, Segment und Content-Format",
                    "CMO, Head of Marketing, Product Marketing",
                ],
            ],
            [39 * mm, 56 * mm, 52 * mm, 26 * mm],
        ),
        Spacer(1, 7 * mm),
        two_col(
            card(
                "Stärkste gemeinsame Value Proposition",
                "Wir verbinden Zielkunden, Kundenfragen, Claims, Belege und Gesprächswissen so, dass Marketing und Sales "
                "denselben überprüfbaren Kontext verwenden.",
                bg=PALE_TEAL,
                accent=TEAL,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Wichtigste Begrenzung",
                "Nicht gleichzeitig CRM bereinigen, Positionierung neu entwickeln, alle Gespräche analysieren und Content automatisieren. "
                "Ein Produkt, ein Segment, ein Workflow.",
                bg=PALE_RED,
                accent=RED,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 7 * mm),
        p("Geeignete Pilotmetriken", H2),
        bullet_list([
            "Zeit für ein belastbares Account- oder Content-Briefing",
            "Anteil der Antworten mit freigegebener Quelle",
            "Zahl notwendiger Rückfragen an Geschäftsführung oder Top-Verkäufer",
            "Anteil der Entwürfe, die ohne grundlegende Neuerstellung weiterverwendet werden",
            "Nutzung des definierten Workflows - nicht bloße Logins",
        ]),
        PageBreak(),
    ]

    # Adjacent opportunities
    story += [
        p("OPPORTUNITIES 05-07", KICKER),
        p("Wertvolle Module - aber nicht der erste Kernmarkt", H1),
        two_col(
            card(
                "Founder Knowledge Transfer",
                "<b>Anlass:</b> Nachfolge, Wachstum, Rollenwechsel, Abwesenheit.<br/>"
                "<b>Produkt:</b> 6-8 Interviews, Entscheidungsmuster, Kundenwissen, Qualitätskriterien und Retrieval-Tests.<br/>"
                "<b>Chance:</b> hohe Interviewpassung und hoher Wert bei akutem Anlass.<br/>"
                "<b>Grenze:</b> geringeres natürliches Retainer-Potenzial.",
                bg=PALE_PURPLE,
                accent=PURPLE,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Executive Decision Memory",
                "<b>Anlass:</b> wiederholte Diskussionen, verlorene Begründungen, unklare Gültigkeit.<br/>"
                "<b>Produkt:</b> Decision Log mit Optionen, Annahmen, Belegen und Review-Datum.<br/>"
                "<b>Chance:</b> differenziertes Executive-Modul.<br/>"
                "<b>Grenze:</b> hoher Vertrauensbedarf und schwerer kurzfristiger ROI.",
                bg=PALE_AMBER,
                accent=AMBER,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 7 * mm),
        card(
            "AI Readiness Knowledge Audit",
            "<b>Gutes Einstiegsprodukt, schwacher Moat.</b> Der deutsche Markt bietet bereits allgemeine Readiness-Checks. "
            "Differenziert wird der Audit erst, wenn er einen konkreten Workflow prüft: Quellen, Rechte, Golden Questions, "
            "Wissenseigentümer, Lücken und Pilotdesign.",
            bg=LIGHT,
            accent=NAVY_2,
        ),
        Spacer(1, 7 * mm),
        p("Die Portfolio-Logik", H2),
        ContextFlow(),
        p(
            "Founder Memory und Executive Decisions können später als hochwertige Context Packs in dieselbe Architektur "
            "eingebunden werden. Der erste Verkauf sollte dennoch an Kundenarbeit, Marketing oder Sales hängen.",
            CAPTION,
        ),
        PageBreak(),
    ]

    # Segmentation
    story += [
        SectionBand("06", "Segmentierung", "Workflow zuerst, Firmografie zur Eingrenzung, Technologie als Delivery-Filter", AMBER),
        Spacer(1, 8 * mm),
        p("Die beste Segmentierung beginnt beim teuren Kontextverlust", H1),
        data_table(
            ["Segmentbasis", "Stärke", "Schwäche", "Rolle"],
            [
                ["Firmografie", "leicht zu targetieren", "erklärt den Schmerz schlecht", "Größe und Komplexität eingrenzen"],
                ["Technografie", "Delivery und Partnervertrieb einfacher", "Tool ist kein Kaufanlass", "M365/Notion/Google als Filter"],
                ["Workflow/Problem", "nah am wirtschaftlichen Nutzen", "in Listen schwerer erkennbar", "primäre Segmentierung"],
            ],
            [36 * mm, 49 * mm, 49 * mm, 39 * mm],
        ),
        Spacer(1, 7 * mm),
        p("Segment-Tournament", H2),
        data_table(
            ["Segmenthypothese", "Problem", "Zugang", "Budget", "Wiederholung", "Urteil"],
            [
                ["Agenturen/Beratungen, 20-150", "hoch", "hoch", "mittel-hoch", "sehr hoch", "BEACHHEAD"],
                ["B2B Tech/Services, 50-500", "hoch", "mittel", "hoch", "hoch", "WACHSTUM"],
                ["Founder-led Wissensunternehmen", "mittel", "mittel-hoch", "mittel-hoch", "mittel", "ANLASS"],
                ["beliebige M365-KMU", "niedrig-mittel", "mittel", "hoch", "hoch", "DELIVERY-WEDGE"],
            ],
            [67 * mm, 21 * mm, 19 * mm, 22 * mm, 24 * mm, 20 * mm],
        ),
        Spacer(1, 7 * mm),
        card(
            "Empfohlene Beachhead-Definition",
            "<b>Agenturen und kleinere Beratungen mit 20-150 Beschäftigten, mindestens fünf parallel betreuten "
            "Bestandskunden, mehreren Account- oder Delivery-Teams und vorhandener AI-Nutzung, bei denen Briefings, "
            "Übergaben oder Freigaben regelmäßig an fehlendem Kundenkontext scheitern.</b>",
            bg=PALE_TEAL,
            accent=TEAL,
        ),
        Spacer(1, 5 * mm),
        source_note("Die Segmentpriorität ist eine Hypothese. Sie wird nur durch 15-20 problemorientierte Käuferinterviews belastbar."),
        PageBreak(),
    ]

    # M365
    story += [
        p("DELIVERY-ROUTE", KICKER),
        p("Microsoft 365: sinnvoller Einstieg, falsche Kategorie", H1),
        two_col(
            card(
                "Warum M365 in Deutschland attraktiv ist",
                "Identitäten, Rechte, SharePoint, Teams und Compliance-Kontrollen sind oft vorhanden. "
                "Microsoft bietet Datenschutz- und EU-Datenresidenz-Zusagen; Copilot respektiert bestehende Benutzerrechte.",
                bg=PALE_TEAL,
                accent=TEAL,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Warum das nicht automatisch sicher ist",
                "Copilot übernimmt auch zu weit vergebene Rechte. Microsoft weist ausdrücklich auf Oversharing-Risiken hin. "
                "Purview, SharePoint Advanced Management und Tenant-Konfiguration können Spezialwissen erfordern.",
                bg=PALE_RED,
                accent=RED,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 8 * mm),
        p("Empfohlenes Betriebsmodell", H2),
        data_table(
            ["Ebene", "Eigene Kompetenz", "Partnerkompetenz"],
            [
                ["Methode", "Interviews, Context Architecture, Golden Questions, Claims, Workflows", "-"],
                ["Plattform", "leichte Konfiguration, Content-Struktur, Pilotnutzer", "Tenant, Purview, Security, komplexe Integrationen"],
                ["Governance", "Quellen, Eigentümer, Freigaben, Human Review", "DSB, Rechtsberatung, Betriebsrat"],
            ],
            [33 * mm, 78 * mm, 62 * mm],
        ),
        Spacer(1, 8 * mm),
        card(
            "Positionierungsregel",
            "<b>Technologieoffen verkaufen, standardisierte Adapter liefern.</b> M365 kann der erste Adapter sein. "
            "Notion, Google Workspace, Atlassian oder Slite bleiben relevant für Agenturen und moderne B2B-Teams.",
            bg=PALE_PURPLE,
            accent=PURPLE,
        ),
        source_note("[E18] Microsoft Copilot Architecture; [E19] Microsoft Copilot Security; [E20] Enterprise Data Protection."),
        PageBreak(),
    ]

    # Monetization
    story += [
        SectionBand("07", "Geschäftsmodell", "Vom bezahlten Audit zum Managed ContextOps", TEAL),
        Spacer(1, 8 * mm),
        p("Produktleiter statt Projektnebel", H1),
        data_table(
            ["Stufe", "Produkt", "Ergebnis", "Preishypothese"],
            [
                ["1", "Context Opportunity Audit", "Workflow, Friktionsmap, Quellen, Golden Questions, Pilotdesign", "3.500-5.000 EUR"],
                ["2", "Context-to-Workflow Pilot", "produktiver AI-Workflow, Tests, Governance und Übergabe", "7.500-10.000 EUR"],
                ["3", "Managed ContextOps", "Freshness, Fehlfragen, neue Claims, Rechte und Reviews", "1.000-2.500 EUR/Monat"],
                ["4", "Expansion", "weiterer Kunde, Segment, Workflow oder Quelle", "projektabhängig"],
                ["5", "Templates/Lizenz/SaaS", "skalierbare IP aus bewiesenen Projekten", "erst nach 3-5 Fällen"],
            ],
            [15 * mm, 45 * mm, 75 * mm, 38 * mm],
        ),
        Spacer(1, 8 * mm),
        two_col(
            card(
                "Öffentliche Preisanker",
                "Deutsche Anbieter listen Readiness-Angebote bei rund <b>3.943 EUR</b> und <b>5.590 EUR</b>. "
                "Ein Paket aus Assessment, Workshop, Proof of Concept und vier Wochen Support wird mit <b>9.900 EUR</b> angeboten.",
                bg=PALE_AMBER,
                accent=AMBER,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Die Evidenzgrenze",
                "Listenpreise sind keine Transaktionsdaten. Sie zeigen, dass die Zielspanne plausibel ist - und dass "
                "ein allgemeines AI-Readiness-Angebot bereits stark besetzt und wenig differenziert wäre.",
                bg=PALE_RED,
                accent=RED,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 7 * mm),
        card(
            "Was der Retainer verspricht",
            "Nicht: „Wir pflegen Ihr Wiki.“ Sondern: Kritische Inhalte haben Eigentümer und Review-Datum; fehlgeschlagene "
            "Golden Questions werden innerhalb eines vereinbarten Zyklus bearbeitet; neue freigegebene Erkenntnisse fließen "
            "kontrolliert in den Workflow.",
            bg=PALE_TEAL,
            accent=TEAL,
        ),
        source_note("[E21] Microsoft Marketplace/abtis; [E22] ORBIT; [E23] Dynamic Support. Angebotspreise, nicht realisierte Umsätze."),
        PageBreak(),
    ]

    # Pilot
    story += [
        SectionBand("08", "Der erste Pilot", "Fünf Wochen, ein Kunde, ein Workflow, ein messbarer Ausgangspunkt", PURPLE),
        Spacer(1, 8 * mm),
        p("Client Context Sprint", H1),
        p("<b>Preisziel:</b> 8.500 EUR &nbsp;&nbsp; <b>Kapazität:</b> max. 100 Stunden &nbsp;&nbsp; <b>Nutzer:</b> 5-12 &nbsp;&nbsp; <b>Quellen:</b> max. 10"),
        Spacer(1, 7 * mm),
        PilotTimeline(),
        Spacer(1, 4 * mm),
        p("Lieferobjekte", H2),
        two_col(
            bullet_list([
                "Kontext- und Friktionsmap",
                "Quellen- und Rechteinventar",
                "Client Context Pack",
                "freigegebene Claims und Entscheidungen",
            ]),
            bullet_list([
                "ein funktionierender AI-Workflow",
                "20 Golden Questions mit Quellen",
                "Rollen- und Aktualisierungsmodell",
                "Training und 30-Tage-Betriebsplan",
            ]),
        ),
        Spacer(1, 7 * mm),
        p("Nicht im Scope", H2),
        card(
            "Klare Grenze",
            "Keine Migration aller Unternehmensdaten. Kein unternehmensweiter Chatbot. Keine vollständige CRM-Bereinigung. "
            "Keine autonome Kundenkommunikation. Keine individuelle SaaS-Entwicklung. Keine Umsatzgarantie.",
            bg=PALE_RED,
            accent=RED,
        ),
        Spacer(1, 7 * mm),
        p("Pilotentscheidung", H2),
        p(
            "Der Pilot gilt als erfolgreich, wenn der definierte Workflow messbar besser funktioniert, die Antworten "
            "quellenbasiert sind, reale Nutzer wiederkehren und ein verantwortlicher Kunde die Pflege übernimmt oder als "
            "Managed ContextOps beauftragt."
        ),
        PageBreak(),
    ]

    # Measurement
    story += [
        p("MESSUNG", KICKER),
        p("Die Baseline schützt vor schönen Demos", H1),
        data_table(
            ["Dimension", "Metriken", "Warum wichtig"],
            [
                [
                    "Retrieval",
                    "korrekte Golden Questions; geeignete Quellen; veraltete oder widersprüchliche Antworten",
                    "trennt Suche, Quelle und Generation",
                ],
                [
                    "Workflow",
                    "Zeit für Briefing; Rückfragen an Experten; Entwürfe ohne Neuerstellung",
                    "zeigt operativen Wert",
                ],
                [
                    "Adoption",
                    "wiederholte Nutzung; gemeldete Lücken; Inhalte mit Eigentümer und Review-Datum",
                    "verhindert Shelfware",
                ],
                [
                    "Business",
                    "Übergabezeit; Onboarding; Freigabeabhängigkeit; Konsistenz",
                    "bindet System an einen Käufernutzen",
                ],
            ],
            [28 * mm, 91 * mm, 54 * mm],
        ),
        Spacer(1, 8 * mm),
        two_col(
            card(
                "Vorher",
                "10-20 reale Aufgaben mit vorhandenen Tools durchführen. Zeit, Rückfragen, Quellen und Ergebnisqualität dokumentieren.",
                bg=PALE_AMBER,
                accent=AMBER,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Nachher",
                "Dieselben Aufgabentypen mit Context Layer durchführen. Fehler nach Retrieval, Quelle, Prompt, Berechtigung oder Review klassifizieren.",
                bg=PALE_TEAL,
                accent=TEAL,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        Spacer(1, 8 * mm),
        card(
            "Keine pauschalen Prozentversprechen",
            "Zielwerte werden erst nach der Baseline gemeinsam festgelegt. Vendor-Metriken wie 70% Nutzung oder 80% weniger Analysezeit "
            "sind Inspiration für Messgrößen, aber keine Verkaufszusage.",
            bg=PALE_RED,
            accent=RED,
        ),
        PageBreak(),
    ]

    # EU standard
    story += [
        SectionBand("09", "EU-Delivery-Standard", "EU-fähig bedeutet mehr als EU-Hosting", AMBER),
        Spacer(1, 8 * mm),
        p("Zwölf Punkte, die jeder Pilot klären muss", H1),
        data_table(
            ["#","Prüffeld","Leitfrage"],
            [
                ["1","Zweck & Scope","Welcher Workflow, welche Nutzer, welche Entscheidung?"],
                ["2","Quellenregister","Woher stammt Wissen, wer besitzt es, wie aktuell ist es?"],
                ["3","Personenbezogene Daten","Welche Daten sind enthalten und wofür werden sie verarbeitet?"],
                ["4","Rollen & Verträge","Verantwortlicher, Auftragsverarbeiter, Unterauftragsverarbeiter, AVV/DPA?"],
                ["5","Datenminimierung","Welche Quellen und Felder werden wirklich benötigt?"],
                ["6","Zugriff","Wie werden intern, kundenbezogen und freigegeben getrennt?"],
                ["7","Aufbewahrung","Welche Fristen, Löschung, Rückgabe und Exit-Regeln gelten?"],
                ["8","Drittlandtransfer","Wo werden Daten gespeichert und verarbeitet?"],
                ["9","Logging","Welche Quellen, Interaktionen und Änderungen bleiben nachvollziehbar?"],
                ["10","Human Review","Welche externen oder kritischen Outputs brauchen Freigabe?"],
                ["11","AI-Kompetenz","Welche Rollen brauchen welche Einweisung?"],
                ["12","Beschäftigtendaten","DSB, Betriebsrat und gegebenenfalls DSFA einbeziehen?"],
            ],
            [10 * mm, 46 * mm, 117 * mm],
        ),
        Spacer(1, 6 * mm),
        source_note(
            "[E24] EU 2026/1744, AI Literacy; [E25] DSK Orientierungshilfen AI/RAG; [E26] EDPB LLM Privacy Risks. "
            "Der Report ist keine Rechtsberatung."
        ),
        PageBreak(),
    ]

    # Interview
    story += [
        SectionBand("10", "Marktvalidierung", "15-20 Gespräche, konkrete Vorfälle, echte Budgetwege", TEAL),
        Spacer(1, 8 * mm),
        p("Nicht nach Interesse fragen. Nach dem letzten Kontextversagen.", H1),
        p("Empfohlene Stichprobe", H2),
        Table(
            [[
                stat_card("6", "Agentur- oder Beratungsinhaber", "Beachhead", TEAL_DARK, 55 * mm),
                stat_card("6", "Marketing/Sales/RevOps-Leiter", "Wachstumsmarkt", PURPLE, 55 * mm),
                stat_card("3+2", "Founder plus M365-Experten", "Anlass & Delivery", NAVY_2, 58 * mm),
            ]],
            colWidths=[55 * mm, 55 * mm, 58 * mm],
            style=TableStyle([
                ("LEFTPADDING", (0, 0), (-1, -1), 0),
                ("RIGHTPADDING", (0, 0), (-1, -1), 3 * mm),
                ("TOPPADDING", (0, 0), (-1, -1), 0),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 0),
            ]),
        ),
        Spacer(1, 7 * mm),
        p("Fragen, die Kaufrealität sichtbar machen", H2),
        bullet_list([
            "Erzählen Sie von der letzten Situation, in der wichtige Kunden- oder Unternehmensinformationen nicht auffindbar waren.",
            "Welcher Output oder welche Entscheidung war betroffen - und was musste anschließend getan werden?",
            "Wer wurde gefragt, wie lange dauerte es und welche Folgen hatte es für Zeit, Qualität oder Kunde?",
            "Wann war ein AI-Ergebnis zuletzt zu generisch oder falsch? Welcher Kontext fehlte konkret?",
            "Wer dürfte einen Pilot beauftragen, wer könnte ihn stoppen und aus welchem Budget wurde zuletzt Ähnliches bezahlt?",
            "Was müsste ein fünf- bis sechswöchiger Pilot beweisen, damit Sie ihn fortsetzen?",
        ]),
        Spacer(1, 7 * mm),
        two_col(
            card(
                "Kaufsignale",
                "konkreter Vorfall; mindestens monatlich; messbarer Schaden; namentlicher Sponsor; zugängliche Quellen; "
                "reale Pilotnutzer; Zahlungsbereitschaft.",
                bg=PALE_TEAL,
                accent=TEAL,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
            card(
                "Ausschlusssignale",
                "nur AI-Neugier; kein wiederkehrender Workflow; kein Wissenseigentümer; komplette Plattform für 5.000 EUR; "
                "keine Nutzerzeit; reiner Toolvergleich.",
                bg=PALE_RED,
                accent=RED,
                width=(CONTENT_W - 6 * mm) / 2,
            ),
        ),
        PageBreak(),
    ]

    # Decision
    story += [
        SectionBand("11", "Entscheidung", "Was in den nächsten 90 Tagen getan werden sollte", PURPLE),
        Spacer(1, 8 * mm),
        p("Von der Marktthese zum ersten belastbaren Case", H1),
        data_table(
            ["Zeitraum", "Aktion", "Gate"],
            [
                ["Woche 1-2", "Interviewleitfaden finalisieren, 15-20 Gespräche terminieren", "mindestens 12 bestätigte Termine"],
                ["Woche 2-4", "Problem- und Kaufinterviews führen, Muster codieren", "5 gleiche Workflow-Probleme"],
                ["Woche 4", "zwei Design-Partner auswählen", "2 konkrete Pilotprüfungen"],
                ["Woche 5-10", "bezahlten Client Context Sprint durchführen", "Baseline, Tests, Nutzung und Handover"],
                ["Woche 11-12", "Case und Angebotsversion 2 entwickeln", "klarer Folgeauftrag oder belastbare Ablehnung"],
            ],
            [29 * mm, 91 * mm, 53 * mm],
        ),
        Spacer(1, 9 * mm),
        card(
            "Priorisierungsregel",
            "Ein Segment wird nur gewählt, wenn mindestens fünf Gesprächspartner denselben wiederkehrenden Workflow-Schmerz "
            "beschreiben, mindestens drei einen Käufer und Budgetweg benennen und mindestens zwei einen bezahlten Pilot konkret prüfen.",
            bg=PALE_TEAL,
            accent=TEAL,
        ),
        Spacer(1, 8 * mm),
        p("Die langfristige Position", H2),
        p(
            "Modelle und Tools werden austauschbarer. Der dauerhafte Wert liegt in gepflegtem Unternehmenskontext, "
            "klaren Arbeitsverträgen zwischen Mensch und AI, überprüfbaren Quellen und einem Betriebssystem für Aktualität. "
            "Genau daraus kann ContextOps als wiederkehrendes Geschäft entstehen."
        ),
        Spacer(1, 8 * mm),
        p("„Die Modelle werden besser. Der knappe Wert verschiebt sich zu dem Kontext, den nur das Unternehmen erzeugen kann.“", QUOTE),
        PageBreak(),
    ]

    # References
    refs = [
        ("E1", "Destatis - Unternehmen mit Nutzung von AI nach Beschäftigtengrößenklassen, 2025", "https://www.destatis.de/DE/Themen/Branchen-Unternehmen/Unternehmen/IKT-in-Unternehmen-IKT-Branche/Tabellen/ikti-unternehmen-kuenstliche-intelligenz.html", "A"),
        ("E2", "KfW Research - Einsatz von AI im Mittelstand, Fokus Nr. 533, Februar 2026", "https://www.kfw.de/PDF/Download-Center/Konzernthemen/Research/PDF-Dokumente-Fokus-Volkswirtschaft/Fokus-2026/Fokus-Nr.-533-Februar-2026-KI-Mittelstand.pdf", "A"),
        ("E3", "Eurostat - 20% of EU enterprises use AI technologies, 2025", "https://ec.europa.eu/eurostat/web/products-eurostat-news/w/ddn-20251211-2", "A"),
        ("E4", "OECD - AI adoption by small and medium-sized enterprises, 2025", "https://www.oecd.org/content/dam/oecd/en/publications/reports/2025/12/ai-adoption-by-small-and-medium-sized-enterprises_9c48eae6/426399c1-en.pdf", "A"),
        ("E5", "Brynjolfsson, Li & Raymond - Generative AI at Work, QJE 2025", "https://academic.oup.com/qje/article/140/2/889/7990658", "B"),
        ("E6", "Harvard Business School/BCG - Navigating the Jagged Technological Frontier", "https://aiinstitute.hbs.edu/navigating-the-jagged-technological-frontier/", "B"),
        ("E7", "Applied Sciences - RAG and LLMs for Enterprise Knowledge Management, 2026", "https://www.mdpi.com/2076-3417/16/1/368", "B"),
        ("E8", "Leoni et al. - AI-empowered KM processes for decision-making", "https://www.sciencedirect.com/org/science/article/pii/S1367327024000516", "C"),
        ("E9", "Letonja & Duh - Knowledge transfer in family businesses", "https://ideas.repec.org/a/taf/tkmrxx/v14y2016i2p213-224.html", "C"),
        ("E10", "Slite - Karhu Helsinki customer story", "https://slite.com/blog/karhuhelsinky-slite-case-study", "D"),
        ("E11", "Notion - Brainlabs customer story", "https://www.notion.com/en-gb/customers/brainlabs", "D"),
        ("E12", "Dust - Alan PMM and Sales Intelligence", "https://dust.tt/blog/alans-pmm-team-transforms-sales-conversations-into-intelligence-with-ai-agents", "D"),
        ("E13", "Dust - Patch AI agents", "https://dust.tt/blog/how-patch-empowered-70-of-its-team-to-use-ai-agents-weekly", "D"),
        ("E14", "Microsoft - ECE Group and Microsoft 365 Copilot", "https://www.microsoft.com/en/customers/story/23971-ece-group-microsoft-365-copilot", "D"),
        ("E15", "Slite - Idea Informatica customer story", "https://slite.com/customers/idea-informatica", "D"),
        ("E16", "Slite - Eulerian customer story", "https://slite.com/customers/eulerian", "D"),
        ("E17", "Atlassian - Mercedes-Benz customer story", "https://www.atlassian.com/de/customers/mercedes-benz", "D"),
        ("E18", "Microsoft Learn - Microsoft 365 Copilot architecture", "https://learn.microsoft.com/en-us/microsoft-365/copilot/microsoft-365-copilot-architecture", "A"),
        ("E19", "Microsoft Learn - Security for Microsoft 365 Copilot", "https://learn.microsoft.com/en-us/microsoft-365/copilot/security-microsoft-365-copilot", "A"),
        ("E20", "Microsoft Learn - Enterprise data protection for Copilot", "https://learn.microsoft.com/en-us/microsoft-365/copilot/enterprise-data-protection", "A"),
        ("E21", "Microsoft Marketplace - abtis M365 Copilot Readiness Workshop", "https://marketplace.microsoft.com/de-de/marketplace/consulting-services/abtisgmbh-1020116.abtis-microsoft_365-copilot-readiness-workshop?tab=Overview", "E"),
        ("E22", "ORBIT - AI Readiness Check", "https://www.orbit.de/ki-readiness-check/", "E"),
        ("E23", "Dynamic Support - AI Consulting Packages", "https://dynamicsupport.de/en/", "E"),
        ("E24", "EUR-Lex - Regulation (EU) 2026/1744, amended AI literacy Article 4", "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32026R1744", "A"),
        ("E25", "Datenschutzkonferenz - Orientierungshilfen zu AI, TOM und RAG", "https://www.datenschutzkonferenz-online.de/orientierungshilfen.html", "A"),
        ("E26", "EDPB - AI Privacy Risks & Mitigations for LLMs", "https://www.edpb.europa.eu/documents/support-pool-of-experts/ai-privacy-risks-mitigations-large-language-models-llms_en", "A"),
        ("E27", "Microsoft - Malteser customer story", "https://www.microsoft.com/en/customers/story/23067-malteser-microsoft-365", "D"),
        ("E28", "Massingham - Measuring the Impact of Knowledge Loss", "https://journals.sagepub.com/doi/pdf/10.1177/1350507608096040", "C"),
    ]
    story += [
        SectionBand("A", "Quellenverzeichnis", "Evidenzstufen A-E, geprüft bis 30.07.2026", NAVY_2),
        Spacer(1, 8 * mm),
        p("Quellen und Evidenzklassen", H1),
        p(
            "<b>A</b> offizielle Statistik/Recht &nbsp;&nbsp; <b>B</b> kausale/systematische Forschung &nbsp;&nbsp; "
            "<b>C</b> explorative Forschung &nbsp;&nbsp; <b>D</b> Anbieterfall &nbsp;&nbsp; <b>E</b> Marktangebot",
            BODY_SMALL,
        ),
        Spacer(1, 4 * mm),
    ]
    level_colors = {"A": TEAL_DARK, "B": PURPLE, "C": AMBER, "D": colors.HexColor("#E47A56"), "E": MUTED}
    for rid, title, url, level in refs:
        row = Table(
            [[
                tag(level, bg=level_colors[level], fg=WHITE, width=10 * mm),
                p(f"<b>[{rid}] {escape(clean(title))}</b><br/><link href='{url}' color='#087F73'>Quelle öffnen</link>", BODY_SMALL),
            ]],
            colWidths=[13 * mm, CONTENT_W - 13 * mm],
        )
        row.setStyle(TableStyle([
            ("VALIGN", (0, 0), (-1, -1), "TOP"),
            ("LEFTPADDING", (0, 0), (-1, -1), 0),
            ("RIGHTPADDING", (0, 0), (-1, -1), 2 * mm),
            ("TOPPADDING", (0, 0), (-1, -1), 1.5 * mm),
            ("BOTTOMPADDING", (0, 0), (-1, -1), 1.5 * mm),
            ("LINEBELOW", (0, 0), (-1, -1), 0.3, LINE),
        ]))
        story.append(row)

    story += [
        Spacer(1, 8 * mm),
        card(
            "Methodischer Hinweis",
            "Vendor Cases wurden aufgenommen, weil sie konkrete Workflows, Nutzergruppen und Messgrößen zeigen. "
            "Sie werden nicht als unabhängiger Wirksamkeitsbeleg behandelt. Listenpreise sind keine realisierten Umsätze. "
            "Der Report ersetzt keine Rechtsberatung.",
            bg=LIGHT,
            accent=MUTED,
        ),
    ]
    return story


def main() -> None:
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    cover_frame = Frame(22 * mm, 16 * mm, PAGE_W - 44 * mm, PAGE_H - 32 * mm, id="cover_frame", showBoundary=0)
    body_frame = Frame(
        MARGIN_X,
        MARGIN_BOTTOM,
        CONTENT_W,
        PAGE_H - MARGIN_TOP - MARGIN_BOTTOM,
        id="body_frame",
        showBoundary=0,
        leftPadding=0,
        rightPadding=0,
        topPadding=0,
        bottomPadding=0,
    )
    doc = BaseDocTemplate(
        str(OUTPUT),
        pagesize=A4,
        leftMargin=MARGIN_X,
        rightMargin=MARGIN_X,
        topMargin=MARGIN_TOP,
        bottomMargin=MARGIN_BOTTOM,
        title="Commercial Context Systems - Business Opportunities Deutschland und EU",
        author="OpenAI Codex",
        subject="Markt, Evidenz, Angebote und Pilotdesign für AI-fähige Second Brains",
    )
    doc.addPageTemplates([
        PageTemplate(id="cover", frames=[cover_frame], onPage=draw_cover),
        PageTemplate(id="body", frames=[body_frame], onPage=draw_body),
    ])
    doc.build(build_story())
    print(OUTPUT)


if __name__ == "__main__":
    main()
