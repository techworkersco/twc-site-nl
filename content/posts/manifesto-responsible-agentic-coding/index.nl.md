---
title: "Een Manifest voor Verantwoord Agentisch Programmeren"
summary: "Moet je generatieve AI boycotten? Maar wat als je opgehypete baas je onder druk zet? Geen zorgen, er is een middenweg. Een techwerker deelt diens manifest voor verantwoord agentisch programmeren."
showSummary: true
author:
date: 2026-08-25T07:00:00+02:00
tags: ["opinion"]
cover: feature.png
coverCaption: "Afbeelding: Een persoon die de gele robotarm van een machine aanraakt op een conferentie, door enchantedtools"
---

Ergens tussen gedachteloos toegeven aan de hype van techreuzen en het volledig boycotten van generatieve AI (artificiële intelligentie), ligt een middenweg die ontwikkelaars in staat stelt om deze nieuwe gereedschappen goed te gebruiken zonder op softwarekwaliteit in te leveren of hun vakbekwaamheid op te geven.

## De basis

Wij geloven dat de principes en fundamenten die door generaties  software-engineers zijn vastgesteld niet alleen *nog steeds* relevant zijn, maar ze in het tijdperk van goedkoop code-genereren zelfs *belangrijker* zijn dan ooit.

Gebruikers en klanten verdienen het om erop te kunnen **vertrouwen** dat de software die ze gebruiken is **beoordeeld en begrepen** door mensen die hier **geïnformeerd verantwoordelijkheid** voor kunnen nemen. Dat is cruciaal voor elk duurzaam product – mensen die daadwerkelijk verantwoordelijkheid nemen voor het werk. Zoiets is simpelweg niet mogelijk met puur uit de losse pols *vibe*-programmeren.

Werkers verdienen het om broncode en producten te creëren waar ze **trots op zijn**; om te werken aan codebases die **begrijpelijk en onderhoudbaar** zijn – niet aan slordige spaghetti-code.

Het is belangrijk om **transparant te zijn** over de mate waarin LLM's (*Large Language Models*, grote taalmodellen) zijn gebruikt in het ontwikkelingsproces – hoeveel menskracht is gebruikt om het eindresultaat te creëren?

Minder code is over het algemeen beter – want **elke regel code is een risico** dat vanaf nu onderhouden moet worden – terwijl de echte waarde van een product ligt in de functionaliteit die aansluit bij de behoeften van gebruikers en in een gedeeld **mentaal model** van de codebasis binnen het team dat wendbare en duurzame ontwikkeling mogelijk maakt.

In plaats van zo snel mogelijk nieuwe functionaliteiten te produceren, zouden we ons moeten richten op **kwaliteit**, het leveren van **waarde** aan gebruikers en op **risicovermindering** – helemaal wanneer je werkt met niet-deterministische uitkomsten zoals kenmerkend is voor LLM's.

LLM's zijn een **gereedschap** en moeten als zodanig behandeld worden – maak er geen afhankelijkheid, verplichting of stoorzender van.

Het is belangrijk om de **negatieve impact** van LLM's op het milieu, gemeenschappen en individuen te **minimaliseren**.

## Kwaliteit van productiecode

**Elke regel productiecode moet door een mens gelezen en begrepen zijn.** Ingenieurs moeten kunnen uitleggen wat de broncode doet, deze van spreekwoordelijke kevers kunnen ontdoen, en kunnen aanpassen – zelfs als Claude even niet beschikbaar is.

Generatieve AI kan worden gebruikt als hulpmiddel om snel prototypes, concepten, of interne gereedschappen produceren, voor het valideren van ideeën zonder veel moeite te steken in een implementatie die je volgende week misschien alweer weggooit, misschien zelfs om productiecode te testen – maar het is *cruciaal* dat de productiecode zelf grondig door mensen wordt begrepen.

Er is een *enorm* verschil tussen "Ik heb deze goedkoop en snel gegenereerde code overgenomen en geprobeerd die te begrijpen en aan te passen tot iets dat lijkt op wat ik zelf zou hebben geschreven" en "de computer heeft dit opgehoest, ik heb niet eens de moeite genomen om het te begrijpen".

## Korte, herhaalbare cycli

Hoe verleidelijk het ook is om een ​​grote taak te definiëren die een agent 's nachts moet uitvoeren, en vervolgens het groene licht van de testen en een geslaagde CI (continue integratie) als voldoende te beschouwen om de wijzigingen maar direct naar productie door te voeren – dat druist regelrecht tegen alle basisprincipes in.

**Houdt herhaalbare cycli kort** – evalueer regelmatig wat de LLM produceert en stuur vroegtijdig bij – dat helpt het mentale bereik klein te houden, de cognitieve schuld van het team terug te brengen, herwerk te verminderen, kevers effectiever op te sporen en de kosten per eenheid (*token*) te optimaliseren.

Hetzelfde geldt voor code beoordelen: niemand wordt graag gevraagd om een binnenhaalverzoek (*pull request*) van duizenden regels te beoordelen. Het is een goede gewoonte om grotere functionaliteiten op te splitsen in meerdere binnenhaalverzoeken om de mentale toeslag beperkt te houden. Als dit werkt voor code die door mensen geschreven is, des te meer reden om hetzelfde beleid toe te passen op code die door machines wordt gegenereerd.

## Houd het simpel

Generatieve AI heeft de neiging om omslachtige en overgecompliceerde code te creëren, die vaak inconsistent is met de rest van de codebase; het vindt het heerlijk om lange opmerkingen toe te voegen die niemand leest en die de neiging hebben om snel te verouderen, waardoor ze eerder verwarrend zijn dan nuttig. **Wees kritisch** op wat het uitspuwt en **zoek naar manieren om het te vereenvoudigen**.

LLM's zijn patroon-herkennende machines – dus blinken ze uit in taken zoals refactoren en het wegwerken van technische schuld. Als je het één of twee goede voorbeelden geeft en het vraagt ​​om dit werk te herhalen in tientallen andere bestanden, zal het waarschijnlijk goed werk leveren. **Gebruik AI om technische schuld te verminderen – niet om deze gedachteloos te vergroten. Automatiseer saaie taken – geniet van de leuke.**

In plaats van AI als een soort magische, onfeilbare programmeur te behandelen die alles kan (dat kan het niet), behandel het als de niet-deterministische machine die het is; de beste analogie met een mens zou een junior-ontwikkelaar zijn met een beperkte focus, maar een enorm talent om saaie, herhaalde taken razendsnel af te ronden, of een senior-ontwikkelaar met wie je ideeën kunt brainstormen, maar waarbij je uiteindelijk op basis van je eigen oordeel en ervaring besluit wat je gaat doen.

## Code beoordelen

Het doel van een code-beoordeling is niet alleen om de *correctheid* van de wijziging te bevestigen. Het is ook een **essentieel hulpmiddel voor kennisdelen** tussen teamleden en om op één lijn te blijven wat betreft architectuurkeuzes. Het delegeren van code-beoordeling aan machines brengt onzichtbare kosten met zich mee voor de toekomstige houdbaarheid van het project.

Agenten kunnen een wijziging **vooraf beoordelen** om alvast wat miniscule details op te ruimen, en de auteur doet er goed aan die aanbevelingen op te volgen alvorens een teamlid om een beoordeling te vragen ​​– maar uiteindelijk is het nog steeds net zo waardevol als altijd om twee paar (menselijke) ogen naar elke broncodewijziging te laten kijken.

## Transparantie

Jouw **gebruikers verdienen het om te weten** of ze een kwaliteitsproduct kopen of dat ze geslobber voorgeschoteld krijgen waarvan niemand de moeite heeft genomen om het te lezen. Ze verdienen het om te weten of hun persoonlijke gegevens en bedrijfsgeheimen ooit jouw servers verlaten, alsof 'agentische werkwijzen' dat op de één of andere magische manier okee zouden maken.

Jouw **werkers of teamgenoten verdienen duidelijkheid** en gedegen training omtrent welke gereedschappen, gedragingen, patronen en werkwijzen acceptabel zijn en van hen worden verwacht; ze verdienen het recht om buitensporige AI-mandaten te weigeren.

**Je moet een AI-beleid hebben.**

## Gevoelige gegevens

LLM's mogen nooit toegang krijgen tot persoonsgegevens, bedrijfsgeheimen of inloggegevens. Gebruik nepgegevens voor lokaal ontwikkelen. Zet omgevingen op de juiste manier in een afgesloten zandbak. Geef agenten geen toegang tot productiesystemen.

## Klantenservice en besluitvorming

De beste manier om mensen te helpen is door ze met mensen te laten praten. Het automatiseren van de klantenservice lijkt misschien een goed idee om kosten te besparen, maar [keer op keer](https://www.reddit.com/r/customerexperience/comments/1r0z0su/when_does_automating_customer_support_actually/) [blijkt](https://medium.com/@ashutosh_veriprajna/klarna-replaced-700-people-with-ai-0ff99fe4ada7) [dat](https://www.forbes.com/sites/sharonedelson/2026/08/05/why-consumers-are--frustrated-with-ai-and-what-retailers-can-do-about-it/) de klanttevredenheid en loyaliteit juist te verminderen. Als het probleem van de gebruiker eenvoudig was en kon worden opgelost door de veelgestelde vragen te raadplegen, zouden de meeste gebruikers liever zelf die veelgestelde vragen lezen dan dat een bot die voor hen verkeerd citeert. Als iemand de tijd neemt om te chatten of te bellen, heeft deze waarschijnlijk een probleem dat complexer en persoonlijker is dan wat een bot kan afhandelen. Eventueel kun je kunt de eerste triage  aan een bot overlaten, mocht het echt nodig zijn – maar houd die interactie minimaal, maak duidelijk dat de antwoorden door een machine worden gegenereerd in plaats van ze als menselijk af te schilderen, en geef de gebruiker een *makkelijke* manier om met een mens in contact te komen.

Moderatie en beslissingen die van invloed zijn op mensen hun levens (zoals bijvoorbeeld mensen aannemen, of het huren van een woning) moet altijd door mensen worden gedaan die **verantwoordelijkheid voor de beslissingen** kunnen nemen. Gebruik een bot voor de eerste triage, als het echt nodig is, maar laat het daadwerkelijke besluit aan mensen over.

## Bewuste keuze van modellen en gebruiksscenario's

Verschillende modellen hebben verschillende kosten – niet alleen financieel, maar ook ecologisch, sociaal en zelfs geopolitiek. Neem, in plaats van je over te geven aan de laatste hype, weloverwogen beslissingen over welk model je wilt gebruiken en – nog belangrijker – of je er überhaupt een wilt gebruiken. Beschouw AI als een hulpmiddel – maak er geen afhankelijkheid, verplichting of stoorzender van.