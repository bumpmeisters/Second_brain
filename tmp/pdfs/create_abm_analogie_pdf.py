from pathlib import Path
from reportlab.lib import colors
from reportlab.lib.colors import HexColor
from reportlab.lib.enums import TA_CENTER, TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.units import mm
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import (
    BaseDocTemplate,
    Frame,
    KeepTogether,
    PageBreak,
    PageTemplate,
    Paragraph,
    Spacer,
    Table,
    TableStyle,
)


ROOT = Path(__file__).resolve().parents[2]
OUTPUT_DIR = ROOT / "wiki" / "_outputs" / "pdf"
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
OUTPUT = OUTPUT_DIR / "abm-speer-statt-netz-einordnung-enterprise-growth-system.pdf"

PAGE_W, PAGE_H = A4
MARGIN_X = 20 * mm
MARGIN_TOP = 21 * mm
MARGIN_BOTTOM = 18 * mm

NAVY = HexColor("#13263A")
BLUE = HexColor("#1F5A94")
CYAN = HexColor("#2AA5B3")
PALE_BLUE = HexColor("#EAF3F8")
PALE_CYAN = HexColor("#EAF7F7")
PALE_GOLD = HexColor("#FFF5DF")
GOLD = HexColor("#C28A21")
INK = HexColor("#1D2732")
MID = HexColor("#536171")
LIGHT = HexColor("#D9E1E8")
WHITE = colors.white


def register_fonts():
    fonts = {
        "UISans": Path("C:/Windows/Fonts/segoeui.ttf"),
        "UISans-Bold": Path("C:/Windows/Fonts/segoeuib.ttf"),
        "UISans-Italic": Path("C:/Windows/Fonts/segoeuii.ttf"),
    }
    for name, path in fonts.items():
        if not path.exists():
            raise FileNotFoundError(f"Required font missing: {path}")
        pdfmetrics.registerFont(TTFont(name, str(path)))


register_fonts()


styles = getSampleStyleSheet()
styles.add(ParagraphStyle(
    name="Eyebrow",
    fontName="UISans-Bold",
    fontSize=8.5,
    leading=11,
    textColor=CYAN,
    spaceAfter=4 * mm,
    tracking=0.8,
))
styles.add(ParagraphStyle(
    name="TitleCustom",
    fontName="UISans-Bold",
    fontSize=28,
    leading=32,
    textColor=NAVY,
    spaceAfter=5 * mm,
))
styles.add(ParagraphStyle(
    name="Subtitle",
    fontName="UISans",
    fontSize=13,
    leading=18,
    textColor=MID,
    spaceAfter=7 * mm,
))
styles.add(ParagraphStyle(
    name="H1Custom",
    fontName="UISans-Bold",
    fontSize=17,
    leading=21,
    textColor=NAVY,
    spaceBefore=3 * mm,
    spaceAfter=4 * mm,
    keepWithNext=True,
))
styles.add(ParagraphStyle(
    name="SectionTitle",
    fontName="UISans-Bold",
    fontSize=15.8,
    leading=19,
    textColor=NAVY,
    spaceBefore=0,
    spaceAfter=0,
))
styles.add(ParagraphStyle(
    name="H2Custom",
    fontName="UISans-Bold",
    fontSize=12.5,
    leading=16,
    textColor=BLUE,
    spaceBefore=3 * mm,
    spaceAfter=2 * mm,
    keepWithNext=True,
))
styles.add(ParagraphStyle(
    name="BodyCustom",
    fontName="UISans",
    fontSize=9.7,
    leading=14.2,
    textColor=INK,
    spaceAfter=2.5 * mm,
))
styles.add(ParagraphStyle(
    name="BodySmall",
    fontName="UISans",
    fontSize=8.2,
    leading=11.3,
    textColor=MID,
    spaceAfter=1.5 * mm,
))
styles.add(ParagraphStyle(
    name="BulletCustom",
    fontName="UISans",
    fontSize=9.5,
    leading=13.5,
    textColor=INK,
    leftIndent=5 * mm,
    firstLineIndent=-3.2 * mm,
    bulletIndent=0,
    spaceAfter=1.6 * mm,
))
styles.add(ParagraphStyle(
    name="Callout",
    fontName="UISans-Bold",
    fontSize=13,
    leading=18,
    textColor=NAVY,
    alignment=TA_LEFT,
))
styles.add(ParagraphStyle(
    name="Quote",
    fontName="UISans-Italic",
    fontSize=11,
    leading=16,
    textColor=NAVY,
    leftIndent=4 * mm,
    rightIndent=4 * mm,
))
styles.add(ParagraphStyle(
    name="TableHead",
    fontName="UISans-Bold",
    fontSize=8.5,
    leading=11,
    textColor=WHITE,
))
styles.add(ParagraphStyle(
    name="TableBody",
    fontName="UISans",
    fontSize=8.1,
    leading=11,
    textColor=INK,
))
styles.add(ParagraphStyle(
    name="TableBodyBold",
    fontName="UISans-Bold",
    fontSize=8.1,
    leading=11,
    textColor=NAVY,
))
styles.add(ParagraphStyle(
    name="Source",
    fontName="UISans",
    fontSize=7.6,
    leading=10.5,
    textColor=MID,
    leftIndent=4 * mm,
    firstLineIndent=-4 * mm,
    spaceAfter=2 * mm,
))


def P(text, style="BodyCustom"):
    return Paragraph(text, styles[style])


def bullet(text):
    return Paragraph(f"- {text}", styles["BulletCustom"])


def callout(text, color=PALE_BLUE, border=BLUE):
    tbl = Table([[P(text, "Callout")]], colWidths=[PAGE_W - 2 * MARGIN_X])
    tbl.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), color),
        ("BOX", (0, 0), (-1, -1), 0.8, border),
        ("LEFTPADDING", (0, 0), (-1, -1), 7 * mm),
        ("RIGHTPADDING", (0, 0), (-1, -1), 7 * mm),
        ("TOPPADDING", (0, 0), (-1, -1), 5 * mm),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 5 * mm),
    ]))
    return tbl


def section_bar(number, title):
    num = Table([[P(number, "TableHead")]], colWidths=[11 * mm], rowHeights=[11 * mm])
    num.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), BLUE),
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
        ("ALIGN", (0, 0), (-1, -1), "CENTER"),
    ]))
    title_p = Paragraph(title, styles["SectionTitle"])
    return Table([[num, title_p]], colWidths=[18 * mm, PAGE_W - 2 * MARGIN_X - 18 * mm], style=[
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
        ("LEFTPADDING", (0, 0), (-1, -1), 0),
        ("RIGHTPADDING", (0, 0), (-1, -1), 0),
        ("LEFTPADDING", (1, 0), (1, 0), 2 * mm),
        ("TOPPADDING", (0, 0), (-1, -1), 0),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 2 * mm),
    ])


def mapping_table(rows):
    data = [[P("Analogie", "TableHead"), P("Blueprint-Entsprechung", "TableHead"), P("Einordnung", "TableHead")]]
    for a, b, c in rows:
        data.append([P(a, "TableBodyBold"), P(b, "TableBody"), P(c, "TableBody")])
    tbl = Table(data, colWidths=[34 * mm, 54 * mm, 62 * mm], repeatRows=1)
    tbl.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), NAVY),
        ("GRID", (0, 0), (-1, -1), 0.35, LIGHT),
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
        ("ROWBACKGROUNDS", (0, 1), (-1, -1), [WHITE, HexColor("#F7F9FB")]),
        ("LEFTPADDING", (0, 0), (-1, -1), 3 * mm),
        ("RIGHTPADDING", (0, 0), (-1, -1), 3 * mm),
        ("TOPPADDING", (0, 0), (-1, -1), 2.5 * mm),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 2.5 * mm),
    ]))
    return tbl


def motion_table():
    rows = [
        ("Market Demand", "Markt, Kategorie oder Buying Audience", "Relevanz und Nachfrage entwickeln"),
        ("Account-based Demand", "Definierte Account Population", "Skalierbare Relevanz und interpretierbare Account-Bewegung"),
        ("1:few ABM", "Kleiner Account-Cluster", "Eine gemeinsame Veränderungs- und Value Hypothesis voranbringen"),
        ("1:1 Strategic ABM", "Ein strategischer Account", "Ein individuelles Account Growth System orchestrieren"),
        ("Customer Expansion", "Kunde, Business Unit, Region oder White Space", "Adoption, Retention, Expansion und Advocacy entwickeln"),
    ]
    data = [[P("Growth Motion", "TableHead"), P("Unit of Management", "TableHead"), P("Strategischer Job", "TableHead")]]
    data += [[P(a, "TableBodyBold"), P(b, "TableBody"), P(c, "TableBody")] for a, b, c in rows]
    tbl = Table(data, colWidths=[40 * mm, 52 * mm, 58 * mm], repeatRows=1)
    tbl.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), NAVY),
        ("GRID", (0, 0), (-1, -1), 0.35, LIGHT),
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
        ("ROWBACKGROUNDS", (0, 1), (-1, -1), [WHITE, HexColor("#F7F9FB")]),
        ("LEFTPADDING", (0, 0), (-1, -1), 3 * mm),
        ("RIGHTPADDING", (0, 0), (-1, -1), 3 * mm),
        ("TOPPADDING", (0, 0), (-1, -1), 2.5 * mm),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 2.5 * mm),
    ]))
    return tbl


def north_star_table():
    labels = ["RIGHT\nMARKETS", "RIGHT\nACCOUNTS", "RIGHT\nRELATIONSHIPS", "RIGHT\nMOMENTS", "COORDINATED\nACTION"]
    cells = []
    for i, label in enumerate(labels):
        bg = BLUE if i == 1 else (CYAN if i == 3 else NAVY)
        txt = label.replace("\n", "<br/>")
        cells.append(Table([[P(txt, "TableHead")]], colWidths=[28 * mm], rowHeights=[18 * mm], style=[
            ("BACKGROUND", (0, 0), (-1, -1), bg),
            ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
            ("ALIGN", (0, 0), (-1, -1), "CENTER"),
        ]))
    operators = [P("x", "Callout")] * 4
    row = []
    for i, cell in enumerate(cells):
        row.append(cell)
        if i < 4:
            row.append(operators[i])
    tbl = Table([row], colWidths=[28 * mm, 4.5 * mm, 28 * mm, 4.5 * mm, 28 * mm, 4.5 * mm, 28 * mm, 4.5 * mm, 28 * mm])
    tbl.setStyle(TableStyle([
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
        ("ALIGN", (0, 0), (-1, -1), "CENTER"),
        ("LEFTPADDING", (0, 0), (-1, -1), 0),
        ("RIGHTPADDING", (0, 0), (-1, -1), 0),
    ]))
    return tbl


def draw_page(canvas, doc):
    canvas.saveState()
    if doc.page > 1:
        canvas.setStrokeColor(LIGHT)
        canvas.setLineWidth(0.4)
        canvas.line(MARGIN_X, PAGE_H - 13 * mm, PAGE_W - MARGIN_X, PAGE_H - 13 * mm)
        canvas.setFont("UISans", 7.5)
        canvas.setFillColor(MID)
        canvas.drawString(MARGIN_X, PAGE_H - 10 * mm, "SPEER STATT NETZ? - EINORDNUNG IM ENTERPRISE GROWTH SYSTEM")
    canvas.setFont("UISans", 7.5)
    canvas.setFillColor(MID)
    canvas.drawString(MARGIN_X, 9 * mm, "Private Ausarbeitung - 16. August 2026")
    canvas.drawRightString(PAGE_W - MARGIN_X, 9 * mm, str(doc.page))
    canvas.restoreState()


doc = BaseDocTemplate(
    str(OUTPUT),
    pagesize=A4,
    leftMargin=MARGIN_X,
    rightMargin=MARGIN_X,
    topMargin=MARGIN_TOP,
    bottomMargin=MARGIN_BOTTOM,
    title="Speer statt Netz? Eine Einordnung der klassischen ABM-Analogie",
    author="Codex, auf Basis des Enterprise Growth System",
    subject="Account-Based Marketing und Enterprise Growth System",
)
frame = Frame(MARGIN_X, MARGIN_BOTTOM, PAGE_W - 2 * MARGIN_X, PAGE_H - MARGIN_TOP - MARGIN_BOTTOM, id="main")
doc.addPageTemplates([PageTemplate(id="main", frames=[frame], onPage=draw_page)])

story = []

# Cover
story += [
    Spacer(1, 24 * mm),
    P("ACCOUNT-BASED GROWTH", "Eyebrow"),
    P("Speer statt Netz?", "TitleCustom"),
    P("Eine Einordnung der klassischen ABM-Analogie im Enterprise Growth System", "Subtitle"),
    Spacer(1, 3 * mm),
    callout("Die Analogie erklärt, warum Unternehmen ihre Aufmerksamkeit auf ausgewählte Accounts konzentrieren. Sie erklärt jedoch nicht, wie ein belastbares Account-Based Growth System entscheidet, orchestriert und lernt."),
    Spacer(1, 12 * mm),
    P("Ausgangspunkt", "H2Custom"),
    P("Der marconomy-Beitrag <i>Speer statt Netz - gezielter Kundenfang mit Account Based Marketing</i> stellt klassisches Lead Management und gezielte Account-Bearbeitung gegenüber. Diese Ausarbeitung würdigt den Nutzen der Metapher, ordnet ihre Grenzen ein und übersetzt sie in die Architektur des Enterprise Growth System."),
    Spacer(1, 9 * mm),
    P("Für die private Weitergabe", "BodySmall"),
    P("Die Ausarbeitung ist eine konzeptionelle Einordnung. Sie behauptet nicht, dass es in Praxis oder Forschung nur eine zulässige ABM-Definition gibt. Das Enterprise Growth System ist ein interner, noch nicht live validierter Arbeits-Blueprint für komplexes B2B-Wachstum.", "BodySmall"),
    PageBreak(),
]

# Executive summary
story += [
    section_bar("01", "Kurzurteil"),
    P("Die Speer-Metapher ist als Einstieg hilfreich, aber als ABM-Modell zu klein. Sie kontrastiert zwei Arten, Aufmerksamkeit zu verteilen: breite Lead-Erzeugung und bewusste Konzentration auf ausgewählte Accounts. Im Enterprise Growth System ist das lediglich eine frühe Entscheidung über <b>Unit of Management</b> und <b>Investment Intensity</b>."),
    P("ABM beginnt nicht schon deshalb, weil ein Unternehmen einen großen Account auswählt, personalisierte Werbung ausspielt oder ein Intent-Signal erkennt. Eine tiefere Account Motion entsteht erst, wenn ein konkreter kommerzieller Job, eine prüfbare Growth Hypothesis, relevante Buying-Group- und Relationship Intelligence, gemeinsame Ownership, reale Kapazität sowie ein klarer Lern- und Entscheidungsrhythmus zusammenkommen."),
    Spacer(1, 2 * mm),
    callout("Die präziseste Kurzform: Der Speer erklärt die Auswahl. Der Blueprint erklärt die Führung des Wachstums.", PALE_CYAN, CYAN),
    Spacer(1, 7 * mm),
    P("Was die Metapher richtig sichtbar macht", "H2Custom"),
    bullet("Nicht jeder potenzielle Käufer verdient dieselbe Aufmerksamkeit und denselben Ressourceneinsatz."),
    bullet("Marketing kann Zielaccounts bewusst vor einer individuellen Lead-Konversion auswählen."),
    bullet("Account-Recherche, Relevanz und die Zusammenarbeit von Marketing und Sales sind wichtiger als reine Reichweite."),
    bullet("First-, Second- und Third-Party-Signale können helfen, Beobachtungen über einen Account zu verdichten."),
    P("Was sie nicht leisten kann", "H2Custom"),
    bullet("Sie unterscheidet nicht zwischen Market Demand, Account-based Demand, 1:few ABM, 1:1 Strategic ABM und Customer Expansion."),
    bullet("Sie verwechselt einen attraktiven Zielaccount leicht mit einem für tiefe ABM-Arbeit bereiten Account."),
    bullet("Sie enthält kein Modell für Buying Groups, Beziehungen, Orchestrierung, Progression, Governance oder Lernen."),
    bullet("Sie behandelt breite Nachfragearbeit als Abfall oder Streuverlust, obwohl Market Demand im Blueprint eine legitime eigene Growth Motion ist."),
    PageBreak(),
]

# Article assessment
story += [
    section_bar("02", "Was der Artikel tatsächlich sagt"),
    P("Der Artikel ist substanzieller als seine plakative Überschrift. Prof. Dr. Markus Besenbeck verwendet das Netz als Bild für klassisches Lead Management: Zunächst werden viele Kontakte eingefangen, anschließend werden die vermeintlich wertvollen herausgefiltert. Der Speer steht dagegen für die bewusste Jagd auf bekannte, wirtschaftlich attraktive Accounts mit individueller Ansprache und möglichst wenig Streuverlust."),
    P("Darüber hinaus benennt das Interview mehrere Elemente, die auch im Blueprint wichtig sind:"),
    bullet("Marketing und Vertrieb sollen eng zusammenarbeiten und ein gemeinsames Verständnis entwickeln."),
    bullet("Unternehmen sollen klein anfangen und müssen nicht sofort die Komplexität großer Technologieanbieter kopieren."),
    bullet("First-, Second- und Third-Party-Intent-Daten werden als unterschiedliche, unterschiedlich präzise Informationsquellen behandelt."),
    bullet("Marketing soll Sales mit Analyse, Daten und Account-Reaktionen unterstützen, statt nur abgeschlossene Kampagnen zu übergeben."),
    P("Das macht den Beitrag zu einem brauchbaren Einsteigerstück. Seine Grenzen entstehen weniger durch einzelne falsche Aussagen als durch das verkürzte Gesamtbild: Fokus und Personalisierung erscheinen fast schon als hinreichende Merkmale von ABM."),
    Spacer(1, 3 * mm),
    P("Die eigentliche Kategorie der Analogie", "H2Custom"),
    P("Im Enterprise Growth System ist Netz versus Speer eine <b>Targeting- und Ressourcenallokationsmetapher</b>. Sie liegt am Eingang der Motion-Entscheidung. Sie ist weder eine Definition des Gesamtsystems noch ein Operating Model, eine Lifecycle-Architektur oder ein Messmodell."),
    Spacer(1, 3 * mm),
    mapping_table([
        ("Netz", "Breite Markt- oder Audience-Bearbeitung; gegebenenfalls Lead Capture", "Kann zu Market Demand passen. Ist nicht automatisch unpräzise oder minderwertig."),
        ("Speer", "Auswahl bestimmter Accounts und konzentrierter Ressourceneinsatz", "Erfasst vor allem den Faktor right accounts, aber noch keine vollständige Account Motion."),
        ("Großer Fisch", "ICP-Fit, potenzieller Account-Wert oder strategische Attraktivität", "Ist ein Portfolio-Input. Wert allein öffnet weder 1:few noch 1:1 Strategic ABM."),
        ("Individuelle Ansprache", "Teil von Content & Experience", "Personalisierung kann nützlich sein, ersetzt aber keine Growth Hypothesis oder Buyer Value."),
        ("Intent", "Input für Intelligence & Hypothesis", "Ein Signal zur Prüfung, kein Beweis für Kaufbereitschaft und kein automatisches Sales-Mandat."),
        ("Weniger Streuverlust", "Investitionseffizienz", "Ist ein Effizienzziel, aber kein ausreichendes Progressions- oder Wirkungskriterium."),
    ]),
    PageBreak(),
]

# Blueprint model
story += [
    section_bar("03", "Der Referenzrahmen des Enterprise Growth System"),
    P("Das Enterprise Growth System soll ein adaptives kommerzielles System über Markt-, Account- und Kundenentwicklung hinweg führen, ohne diese unterschiedlichen Jobs in einen einzigen Funnel oder ein einziges Kampagnenmodell zu pressen. Seine North Star lautet:"),
    Spacer(1, 4 * mm),
    north_star_table(),
    Spacer(1, 5 * mm),
    P("Die Speer-Metapher deckt davon nur einen Teil belastbar ab:", "H2Custom"),
    bullet("<b>Right accounts:</b> relativ stark - bestimmte Accounts werden bewusst ausgewählt."),
    bullet("<b>Right moments:</b> schwach - Intent-Daten deuten Timing an, ohne es sicher festzustellen."),
    bullet("<b>Right markets:</b> kaum - Markt- und Nachfrageentwicklung werden zum unscharfen Gegenbild des Netzes."),
    bullet("<b>Right relationships:</b> praktisch nicht - Buying-Group-Abdeckung, Champion, Executive Access und Multithreading fehlen."),
    bullet("<b>Coordinated action:</b> als Marketing-Sales-Alignment erwähnt, aber nicht als Entscheidungs- und Operating Contract ausgearbeitet."),
    P("Die fünf Growth Motions", "H2Custom"),
    P("Der Blueprint fragt nicht nur, ob gezielt oder breit gearbeitet wird. Er fragt, welcher kommerzielle Betriebsmodus zur aktuellen Einheit, Situation, Evidenz und Reife passt."),
    motion_table(),
    Spacer(1, 4 * mm),
    callout("Die Motions sind Investitionszustände, keine zwingenden Funnel-Stufen. Ein Account kann vertieft, gehalten, seitlich geroutet, demotiert oder verlassen werden.", PALE_GOLD, GOLD),
    PageBreak(),
]

# Routing
story += [
    section_bar("04", "Warum ein großer Zielaccount noch kein 1:1 ABM ist"),
    P("Die gefährlichste Fehlinterpretation der Speer-Metapher lautet: großer Account plus gezielte Ansprache gleich strategisches ABM. Im Blueprint wird dagegen zwischen <b>Tier</b>, <b>Motion</b> und <b>Status</b> unterschieden."),
    P("Ein Tier beschreibt die wirtschaftliche oder strategische Bedeutung und gegebenenfalls den vorgesehenen Servicelevel. Die Motion beschreibt den aktuellen kommerziellen Job und die dafür nötige Betriebsform. Der Status beschreibt die gegenwärtige Lage, Evidenz und Priorität. Diese drei Dinge dürfen nicht zu einer statischen Liste verschmolzen werden."),
    P("Beispielhafte Routing-Entscheidungen", "H2Custom"),
    mapping_table([
        ("Hoher Fit, schwache Readiness", "Account-based Demand", "Der Account wird relevant bearbeitet, beobachtet und besser verstanden. Es wird keine künstliche 1:1-Arbeit erfunden."),
        ("Gemeinsame Situation mehrerer Accounts", "1:few ABM", "Die Accounts teilen eine konkrete Veränderung, Buying Situation und Value Hypothesis. Sales co-leads die Motion."),
        ("Ein strategischer, bereiter Account", "1:1 Strategic ABM", "Growth Thesis, Zugangspfad, Buying Group, Relationship Capital, Account Leadership, Delivery Readiness und Kapazität tragen die Intensität."),
        ("Bestehender Kunde", "Customer Expansion", "Adoption, Health, realisierter Wert, Renewal oder White Space bestimmen die Motion. Schwache Health wird vor Expansion geroutet."),
        ("Noch keine Account-Entscheidung", "Market Demand", "Die Aufgabe ist Markt-, Kategorie- oder Audience-Entwicklung. Breite Nachfragearbeit ist hier richtig, nicht verschwenderisch."),
    ]),
    Spacer(1, 5 * mm),
    P("Readiness vor Intensität", "H2Custom"),
    P("Für eine tiefe Motion braucht es mehr als eine attraktive Firmenliste. Der Blueprint prüft mindestens strategischen Fit, realistischen Wert, Delivery Economics, einen konkreten Trigger oder eine Growth Thesis, Buying-Group-Evidenz, einen plausiblen Beziehungspfad, Account-Team-Commitment, verfügbare Experten- und Executive-Kapazität sowie klare Ownership für Follow-through."),
    P("Fehlen diese Voraussetzungen, ist weniger Intensität häufig die bessere Managemententscheidung. Mehr Personalisierung kompensiert keine schwache Hypothese, fehlenden Zugang oder mangelnde Lieferfähigkeit."),
    PageBreak(),
]

# Execution loop
story += [
    section_bar("05", "Wo ABM nach dem Targeting erst beginnt"),
    P("Nach der Motion-Entscheidung führt der Growth Execution Loop jede materielle Initiative von der Priorität bis zur Lernentscheidung. Erst hier wird aus selektiver Aufmerksamkeit ein steuerbares Account-Based Growth System."),
    mapping_table([
        ("Commercial Priority", "Welcher Zustand soll sich für wen verändern - und warum ist die Investition gerechtfertigt?", "Nicht nur: Welchen großen Fisch wollen wir?"),
        ("Intelligence & Hypothesis", "Was ist Fakt, Interpretation, Hypothese, unbekannt oder widerlegt?", "Intent und Engagement werden kontextualisiert, nicht als Wahrheit behandelt."),
        ("Orchestrate", "Welche Rollen, Beziehungen, Fähigkeiten, Rechte und Zeitpunkte müssen koordiniert werden?", "Alignment wird zu Commitment, Capacity und Decision Rights."),
        ("Content & Experience", "Welche Perspektive oder Erfahrung hilft der Buying Group wirklich weiter?", "Relevanz ersetzt kosmetische Personalisierung."),
        ("Execute & Optimize", "Welche Reaktion führt zu Fortsetzung, Anpassung, Skalierung oder Stop?", "Eine Kampagne ist eine Initiative innerhalb der Motion."),
        ("Measure & Learn", "Was hat sich verändert, was nicht - und welche Entscheidung folgt?", "Account Progression und Evidenzqualität ersetzen reine Aktivitätsberichte."),
    ]),
    Spacer(1, 5 * mm),
    P("Buying Groups statt einzelner Fische", "H2Custom"),
    P("Ein Account kauft nicht als abstrakte juristische Einheit. Menschen in unterschiedlichen Rollen verhandeln ein gemeinsames Problem, Risiko und gewünschtes Ergebnis. Deshalb benötigt der Blueprint opportunity-spezifische Buying Groups: Entscheider, Nutzer, Influencer, Ratifier, Champion und mögliche Blocker können je nach Initiative anders zusammengesetzt sein."),
    P("Die Speer-Metapher fokussiert auf den getroffenen Account. Der Blueprint fokussiert auf die Veränderung, die eine Buying Group gemeinsam bewältigen muss, und auf die Beziehungen, durch die glaubwürdige Zusammenarbeit möglich wird."),
    PageBreak(),
]

# Signals and personalization
story += [
    section_bar("06", "Intent, Personalisierung und Streuverlust richtig behandeln"),
    P("Intent-Daten", "H2Custom"),
    P("Der Artikel unterscheidet sinnvoll zwischen First-, Second- und Third-Party-Daten. Im Blueprint bleiben solche Beobachtungen jedoch Signale mit Quelle, Zeitstempel, Rollenbezug, Konfidenz und Unsicherheit. Ein Website-Besuch, ein Themenanstieg oder Content Engagement kann eine Recherchefrage auslösen. Daraus folgt noch keine bewiesene Kaufabsicht und kein automatischer Pitch."),
    callout("Ein Signal löst Context Review aus - nicht automatisch Outreach.", PALE_CYAN, CYAN),
    Spacer(1, 5 * mm),
    P("Personalisierung", "H2Custom"),
    P("Das Einfügen von Firmenname, Branche oder Logo macht eine Aktivierung nicht strategisch. Der Blueprint verlangt einen relevanten <b>Context Delta</b>: Was verändert die belegte Situation dieses Accounts tatsächlich an Problem, Wert, Beweis, Einwand, Entscheidung oder Experience? Wenn sich nichts Wesentliches ändert, ist ein wiederverwendbares Modul oft glaubwürdiger und wirtschaftlicher als künstliche Individualisierung."),
    P("Streuverlust", "H2Custom"),
    P("Effizienter Ressourceneinsatz ist wichtig, doch nicht jede breite Aktivität ist Verschwendung. Market Demand kann Kategorieverständnis, mentale Verfügbarkeit, Vertrauen und spätere Account-Relevanz aufbauen. Umgekehrt kann ein extrem personalisiertes 1:1-Programm Ressourcen verschwenden, wenn der Account keine Readiness, keinen Zugang oder keine plausible Growth Thesis besitzt."),
    P("Die bessere Managementfrage lautet daher nicht: Netz oder Speer? Sondern: Welche Motion erzeugt in dieser Situation den höchsten erwartbaren Kunden- und Geschäftswert bei vertretbarer Kapazität und Beziehungsgefahr?"),
    Spacer(1, 5 * mm),
    P("Messung", "H2Custom"),
    P("Der Blueprint trennt Aktivität, Reaktion, Progression, kommerzielles Ergebnis und Customer Value. Ein Klick oder eine Kampagnenreaktion ist Aktivität. Breitere Buying-Group-Abdeckung oder ein belastbarer nächster gemeinsamer Schritt kann Progression sein. Pipeline und Umsatz sind kommerzielle Ergebnisse. Adoption, Retention und realisierter Wert gehören insbesondere in Customer Expansion. Keine einzelne Kennzahl beweist automatisch Kausalität."),
    PageBreak(),
]

# Better mental model and direct reply
story += [
    section_bar("07", "Ein besseres mentales Modell"),
    P("Die Speer-Metapher muss nicht verboten werden. Sie sollte nur sichtbar begrenzt werden:"),
    callout("Netz versus Speer erklärt, wie Aufmerksamkeit verteilt wird. Das Enterprise Growth System erklärt, welcher kommerzielle Job vorliegt, wie tief investiert werden darf und wie mehrere Funktionen gemeinsam Fortschritt erzeugen und überprüfen."),
    Spacer(1, 6 * mm),
    P("Für die praktische Einführung sind drei Bilder nacheinander hilfreicher als ein einziges:", "H2Custom"),
    bullet("<b>Targeting-Linse:</b> Von unselektierter Lead-Menge zu bewusst gewählten Märkten, Account Populationen, Clustern oder Einzelaccounts."),
    bullet("<b>Dynamisches Portfolio:</b> Accounts erhalten keine ewige ABM-Etikette. Investment, Motion und Status verändern sich mit Evidenz, Readiness, Kundenwert und Kapazität."),
    bullet("<b>Orchestriertes Betriebssystem:</b> Marketing, Sales, Customer Success, Product, Experten und Executives leisten unterschiedliche Beiträge zu einer gemeinsamen kommerziellen Veränderung."),
    Spacer(1, 4 * mm),
    KeepTogether([
        P("Eine mögliche Antwort an einen Einsteiger", "H2Custom"),
        tbl := Table([[P("Die Analogie ist ein guter Einstieg, wenn man verstehen will, warum ABM nicht erst bei einzelnen Leads beginnt. Statt möglichst viele Kontakte einzusammeln und anschließend zu filtern, werden attraktive Accounts bewusst ausgewählt und relevanter bearbeitet.<br/><br/>Sie beschreibt aber nur die Auswahl- und Fokuslogik. Ein großer Account ist noch kein strategisches ABM. Dafür braucht es eine konkrete Growth Hypothesis, ein Verständnis der Buying Group und Beziehungen, gemeinsame Ownership, ausreichende Kapazität und einen Lernrhythmus, der Vertiefung, Anpassung oder Stop erlaubt.<br/><br/>Im Enterprise Growth System ist breite Market Demand deshalb nicht das schlechte Netz und 1:1 ABM nicht automatisch der gute Speer. Es sind unterschiedliche Growth Motions für unterschiedliche kommerzielle Jobs. Die richtige Frage lautet nicht, welche Methode moderner klingt, sondern welche Bearbeitungstiefe die aktuelle Situation, Evidenz und Wirtschaftlichkeit tatsächlich rechtfertigen.", "Quote")]], colWidths=[PAGE_W - 2 * MARGIN_X]),
    ]),
]
tbl.setStyle(TableStyle([
    ("BACKGROUND", (0, 0), (-1, -1), PALE_BLUE),
    ("BOX", (0, 0), (-1, -1), 0.8, BLUE),
    ("LEFTPADDING", (0, 0), (-1, -1), 7 * mm),
    ("RIGHTPADDING", (0, 0), (-1, -1), 7 * mm),
    ("TOPPADDING", (0, 0), (-1, -1), 6 * mm),
    ("BOTTOMPADDING", (0, 0), (-1, -1), 6 * mm),
]))
story += [
    Spacer(1, 6 * mm),
    callout("Der Kernsatz: Der Speer erklärt die Konzentration auf einen Account. ABM erklärt die gemeinsame Arbeit an einer relevanten Veränderung im Account.", PALE_CYAN, CYAN),
    PageBreak(),
]

# Sources
story += [
    section_bar("08", "Quellen und Einordnungsgrenzen"),
    P("Primäre Diskussionsgrundlage", "H2Custom"),
    P("1. Isabel Schätzle / Markus Besenbeck: <i>Speer statt Netz - gezielter Kundenfang mit Account Based Marketing</i>, marconomy, 4. September 2023.<br/><link href='https://www.marconomy.de/speer-statt-netz-gezielter-kundenfang-mit-account-based-marketing-a-58c80a510a7cb5072cf929ddb4adf6db/' color='#1F5A94'>marconomy.de/speer-statt-netz-gezielter-kundenfang-mit-account-based-marketing</link>", "Source"),
    P("Blueprint-Grundlage", "H2Custom"),
    P("2. <i>Enterprise Growth System</i>, Version 0.1.0, interner Arbeits-Blueprint, 2026. Das Modell verbindet fünf Growth Motions, einen sechsstufigen Growth Execution Loop und gemeinsame Management Capabilities. Der Status bleibt draft; das System ist gegen Quellen und synthetische Fälle geprüft, aber noch nicht durch eine live Account-Portfolio-Anwendung validiert.", "Source"),
    P("Ergänzende externe Einordnung", "H2Custom"),
    P("3. Salesforce: <i>What is Account-Based Marketing?</i> Der Guide beschreibt ABM als strategischen Ansatz, betont die Zusammenarbeit über Marketing hinaus und grenzt fortlaufende Account-Beziehungen von one-and-done campaigns ab.<br/><link href='https://www.salesforce.com/marketing/account-based-marketing-guide/' color='#1F5A94'>salesforce.com/marketing/account-based-marketing-guide</link>", "Source"),
    P("4. Nora Conklin, Forrester: <i>ABM Won, But It's Not Done Changing The Game</i>, 30. Mai 2024. Der Beitrag erweitert ABM über Akquisition hinaus auf Retention, Adoption, Expansion, Advocacy und die Orchestrierung rund um Buying-Group-Insights.<br/><link href='https://www.forrester.com/blogs/abm-won-but-its-not-done-changing-the-game/' color='#1F5A94'>forrester.com/blogs/abm-won-but-its-not-done-changing-the-game</link>", "Source"),
    P("5. Simone Severini, Harri Terho, Joel Mero und Silvio Cardinali: <i>Unpacking account-based marketing: Conceptualization, key activities, and performance outcomes</i>, Industrial Marketing Management 133, 2026, S. 148-161. Die qualitative Studie mit ABM-Verantwortlichen aus 22 Unternehmen zeigt zugleich, dass die akademische Konzeptualisierung noch jung und die Abgrenzung des Begriffs nicht vollständig vereinheitlicht ist.<br/><link href='https://doi.org/10.1016/j.indmarman.2026.02.006' color='#1F5A94'>doi.org/10.1016/j.indmarman.2026.02.006</link>", "Source"),
    Spacer(1, 5 * mm),
    P("Einordnungsgrenze", "H2Custom"),
    P("Diese Ausarbeitung bewertet die Analogie aus Sicht des Enterprise Growth System. Sie erhebt keinen Anspruch darauf, alle ABM-Schulen auf eine einzige Definition zu reduzieren. Praxisliteratur verwendet ABM teils als Strategie, Programm, Methode, Motion, Disziplin oder Kampagnenlabel. Gerade deshalb ist die Trennung von Targeting-Metapher, Growth Motion und Execution Initiative für klare Entscheidungen hilfreich."),
    Spacer(1, 8 * mm),
    callout("Abschließende Orientierung: Nutze die Speer-Metapher, um Fokus zu erklären. Nutze sie nicht, um Readiness, Motion, Buying Group, Beziehung, Orchestrierung oder Erfolg zu entscheiden.", PALE_CYAN, CYAN),
]

doc.build(story)
print(OUTPUT)
