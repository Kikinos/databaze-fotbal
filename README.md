# Návrh relační databáze fotbalového informačního systému
Dobrý den,

jmenuji se Petr Ševčík a potřebuji navrhnout databázi pro jednoduchý fotbalový informační systém. V současnosti eviduji informace o klubech, hráčích a zápasech v několika tabulkách a poznámkách. Data si zapisuji ručně, často opakuji stejné údaje a začínám se v nich ztrácet. Rád bych měl vše uložené v jedné databázi, která mi pomůže udržet pořádek a připraví podklad pro případné napojení na aplikaci.

Chci mít možnost:

    -mít přehled o tom, jaké kluby existují a v jakých městech sídlí,

    -evidovat stadiony a jejich adresy tak, aby se neopakovaly v různých záznamech,

    -sledovat hráče v jednotlivých klubech a jejich rozdělení do kategorií,

    -ukládat různé typy soutěží,

    -zaznamenávat jednotlivé fotbalové zápasy včetně data, času, stadionu, zúčastněných klubů a výsledku.

V současném způsobu zapisování často vznikají duplicity. Například v každém zápase uvádím znovu název stadionu nebo města. Když chci něco upravit, musím to měnit na několika místech. Totéž platí i u hráčů a týmů. Navíc nemám žádný vztah mezi kategoriemi a soutěžemi, takže nevím, v jaké soutěži který tým hraje.

Rád bych proto, aby databáze byla navržena tak, aby:

    -byla normalizovaná a bez opakování údajů,

    -data byla rozdělená do samostatných tabulek,

    -informace bylo možné jednoduše propojovat pomocí cizích klíčů,

    -byla přehledná, snadno rozšiřitelná a připravená pro budoucí práci s aplikací.

Co potřebuji evidovat:

    -Města: seznam měst, ve kterých se nacházejí kluby a stadiony.

    -Adresy: ulice, čísla, PSČ a vazbu na konkrétní město.

    -Stadiony: propojené s adresami.

    -Fotbalové kluby: s vazbou na města.

    -Kategorie: rozdělení klubů a hráčů podle věku nebo výkonnosti.

    -Hráče: včetně jejich zařazení do klubů a kategorií.

    -Soutěže: typ soutěže a vazbu na kategorii.

    -Zápasy: kdo proti komu hrál, kdy a kde, a jaký byl výsledek.

Cílem je vytvořit databázi, která mi umožní přehlednou správu všech dat, odstraní opakování údajů a umožní další rozvoj systému.

Děkuji.

<img width="1722" height="918" alt="image" src="https://github.com/user-attachments/assets/d0f4cfd0-6056-4bce-9ce7-55623cec28f1" />

Odkaz na dbdiagram: https://dbdiagram.io/d/fotbal-69031dce6735e11170721dd7
