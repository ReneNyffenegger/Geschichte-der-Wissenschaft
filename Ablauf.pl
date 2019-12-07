#!/usr/bin/perl
#
#   http://renenyffenegger.ch/Wissenschaft/Geschichte/
#
use warnings;
use strict;
use utf8;

use GraphViz::Graph;

my $graph = GraphViz::Graph->new('Ablauf');

 #_{ Antike
my $j_Pythagoras = node('<b>Pythagoras</b> (570-510)');

my $j_demokrit = node('Demokrit (ca. 460-371): <b>Atommodell</b>');

my $j_Platon = node('<b>Platon</b> (428-347)', 'Schüler von Sokrates');

my $j_Eudoxos = node('<b>Eudoxos</b> (405-355)', 'Über Geschwindigkeiten', '<b>Homozentr. Modell</b>:', '1. geom.-kinem. Planetenmodell');

my $j_Kallppos = node('<b>Kallippos</b>', 'Erweiterung des Planetenmodells', 'um 7 weitere Sphären');

my $j_Aristoteles = node('<b>Aristoteles</b> (384-322)');

my $j_antike_lichtstrahlen = $graph->node(); 
   $j_antike_lichtstrahlen->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">Antike, <b>Lichtstrahlen</b></td></tr>
       <tr><td align="left">Vom Auge ausgehend, tasten Welt ab</td></tr>
       </table>'});

   $graph->same_rank($j_Aristoteles, $j_antike_lichtstrahlen);

my $j_apollonios_epizykel = node('Apollonios (265-190): <b>Epizykeltheorie</b>');


my $j_hipparchos_exzenter = node('Hipparchos (190-120): <b>Exzenter</b>');

my $j_Aristarch = node('Aristarch (310-230) formuliert', 'erstes <b>heliozentr.</b> Welbild');

   $graph->edge($j_Aristoteles, $j_Aristarch);

   my $j_Almagest = node('Ptolemäus (ca 100-160):', '<b>Almagest</b> und <b>Äquant</b>');

my @chain = edge_chain($j_Eudoxos, $j_Kallppos, $j_Aristoteles, $j_apollonios_epizykel, $j_hipparchos_exzenter, $j_Almagest);
same_attributes('color', '#abcdef', @chain); # Planetenmodell
   
my $j_archimedes_sandrechnung = node('Archimedes (287-212):', '<b>Sandrechnung</b> zitert', 'Aristarch');
   $graph->edge($j_Aristarch, $j_archimedes_sandrechnung);
 #_}

my $j_1080_Toledaner_Tafeln = $graph->node(); 
   $j_1080_Toledaner_Tafeln->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1080 <b>Toledaner Tafeln</b></td></tr>
       </table>'});

 # _{ 12xx
my $j_1230_tractatus_sphaera = node('Sacrobosco (1230):', '<b>Tractatus de Sphaera</b>');

my $j_1270_Alfonsinische_Tafeln = $graph->node(); 
   $j_1270_Alfonsinische_Tafeln->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1270 <b>Alfonsinische Tafeln</b></td></tr>
       </table>'});
 #_}

 # _{ 14xx
my $j_cusanus = node('Cusanus (1401-1464)', 'Bruch mit geoz. Weltbild');

my $j_1472_neue_planetentheorie = node('1472 Peuerbach:', '<b>Theoricae novae Planetarum</b>');

my $j_1492_Kolumbus = $graph->node(); 
   $j_1492_Kolumbus->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1492, <b>Kolumbus</b> entdeckt(?) Amerika</td></tr>
       </table>'});
 #_}

 # _{ 15xx
 #_{ 1510 -
my $j_1510_Commentariolus = $graph->node(); 
   $j_1510_Commentariolus->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1510, Kopernikus: <b>Commentariolus</b></td></tr>
       </table>'});

my $j_1513_Middelburg = $graph->node(); 
   $j_1513_Middelburg->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1513, Anfrage von Middleburg<br align="left"/>an Kopernikus zur<br align="left"/>Kalenderreform.<br align="left"/></td></tr>
       </table>'});
   
my $j_1517_Reformation = $graph->node(); 
   $j_1517_Reformation->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1517, <b>Reformation</b></td></tr>
       </table>'});

 #_}
 #_{ 1530 -
my $j_1539_luther = $graph->node(); 
   $j_1539_luther->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1539, Luthers <b>Tischrede</b></td></tr>
       </table>'});

my $j_1543_De_Revolutionibus = $graph->node(); 
   $j_1543_De_Revolutionibus->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1543, <b>De Revolutionibus</b></td></tr>
       </table>'});

   $graph->edge($j_1472_neue_planetentheorie, $j_1543_De_Revolutionibus);
   $graph->edge($j_Almagest, $j_1543_De_Revolutionibus);
   $graph->edge($j_Aristarch, $j_1543_De_Revolutionibus);
   $graph->edge($j_1513_Middelburg, $j_1543_De_Revolutionibus);
   $graph->edge($j_1510_Commentariolus, $j_1543_De_Revolutionibus);

my $j_1550_Peucer = $graph->node(); 
   $j_1550_Peucer->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1550, Peucer <b>Bibl. Einwände gegen Koopernikus</b></td></tr>
       </table>'});

   $graph->edge($j_1543_De_Revolutionibus, $j_1550_Peucer);

my $j_1551_Prutenische_Tafeln = node('1551 <b>Prutenische Tafeln</b>', 'Verbreitung d. kopern. Systems');
#my $j_1551_Prutenische_Tafeln = $graph->node(); 
#   $j_1551_Prutenische_Tafeln->label({html=>'
#       <table border="1" cellborder="0">
#       <tr><td align="left">1551, <b>Prutenische Tafeln</b></td></tr>
#       </table>'});
   $graph->edge($j_1543_De_Revolutionibus, $j_1551_Prutenische_Tafeln);

my $j_1554_Benedetti = $graph->node(); 
   $j_1554_Benedetti->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1554, <b>Giovanni B. Benedetti</b></td></tr>
       <tr><td align="left">Widerlegung von Aristoteles »Fallgeschwindigkeit«</td></tr>
       </table>'});

my $j_giordano_bruno = node('Giordano Bruno');
   $graph->edge($j_cusanus, $j_giordano_bruno);

my $j_1563_tafeln_falsch=node('1563: Brahe findet:', 'Alfons. u. prut. Tafeln falsch');
   $graph->edge($j_1551_Prutenische_Tafeln, $j_1563_tafeln_falsch);

 # _{ 1572

my $j_1572_Brahe = node('1572: Brahe beobachtet <b>Supernova</b>', {notes => 'Wissenschaft/Geozentrik/Personen/Tycho-Brahe#brahe-supernova-1572'});


my $j_1577_Brahe = node('1577, Brahe: Bei <b>Komet</b> keine\nParallaxe gemessen. Kometen durch-\ndringen angebl. Sphären'); 

 # _}
    #_}
 #_{ 1580 -
my $j_1582_Kalenderreform = $graph->node(); 
   $j_1582_Kalenderreform->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1582, <b>Kalenderreform</b></td></tr>
       </table>'});
   $graph->edge($j_1551_Prutenische_Tafeln, $j_1582_Kalenderreform);

my $j_1587_Reimers = $graph->node(); 
   $j_1587_Reimers->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1587, Reimers übersetzt</td></tr>
       <tr><td align="left"><b>De Revolutionibus</b> ins Deutsche</td></tr>
       </table>'});
   $graph->edge($j_1543_De_Revolutionibus, $j_1587_Reimers);

my $j_1588_Tycho_De_mundi = $graph->node(); 
   $j_1588_Tycho_De_mundi->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1588, Tycho: <b>De mundi atherei…</b></td></tr>
       <tr><td align="left">Tychonisches Weltmodell.<br align="left"/>Komet: ätherisch, nicht atmosphärich<br align="left"/></td></tr>
       </table>'});

my $j_1592_De_Motu = $graph->node(); 
   $j_1592_De_Motu->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1592, <b>Galileo Galilei</b></td></tr>
       <tr><td align="left">De Motu Antiquiora<br align="left"/>(Veröff. 1687)</td></tr>
       </table>'});

my $j_1596_Mysterium_Cosmographicum = $graph->node(); 
   $j_1596_Mysterium_Cosmographicum->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1596, Kepler, <b>Mysterium Cosmographicum</b></td></tr>
       </table>'});
 #_}
 # _}

 # _{ 16xx

 # _{ 1600-1619
my $j_1604_Kepler = $graph->node(); 
   $j_1604_Kepler->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1604, <b>Johannes Kepler</b></td></tr>
       <tr><td align="left">Beobachtung Supernova<br align="left"/>Bestätigung Tycho</td></tr>
       </table>'});
   $graph->edge($j_1572_Brahe , $j_1604_Kepler);

my $j_1609_Astronomia_nova = $graph->node(); 
   $j_1609_Astronomia_nova->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1609, Kepler, <b>Astronomia nova</b></td></tr>
       </table>'});
   $graph->edge($j_1596_Mysterium_Cosmographicum , $j_1609_Astronomia_nova);

my $j_1609_david_fabricius = node('David Fabricius entdeckt <b>Mira</b>');

$graph->same_rank($j_1609_Astronomia_nova, $j_1609_david_fabricius);

my $j_1610_sidereus_nuncius = node('1610 Galileo: <b>Sidereus Nuncius</b>', 'Schlag für Aristotelismus');

my $j_1612_sonnenflecken = $graph->node(); 
   $j_1612_sonnenflecken->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1612, Galileo, <b>Sonnenflecken</b></td></tr>
       </table>'});

my $j_1616_index = $graph->node(); 
   $j_1616_index->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1616, <b>Index prohibitorum librorum</b></td></tr>
       </table>'});
   $graph->edge($j_1543_De_Revolutionibus , $j_1616_index);

my $j_1618_kometen = node('1618: <b>Kometen</b>');
 # _}
 # _{ 1620-1639

  my $j_1620_Bacon_Novum_Organum = $graph->node(); 
   $j_1620_Bacon_Novum_Organum->label({html=>'
   <table border="1" cellborder="0">
     <tr><td align="left">1620, <b>Bacon</b>: Novum Organum</td></tr>
   </table>'});

my $nova = $graph->edge($j_1609_Astronomia_nova, $j_1620_Bacon_Novum_Organum);
$nova->label({text=>'Nova/nuvum'});
$nova->set_attribute('color','royalblue');
$nova->set_attribute('fontcolor','royalblue');

my $j_1627_Rudolfinische_Tafeln = node('1627, Kepler:', '<b>Rudolfinische Tafeln</b>'); 
#  $j_1627_Rudolfinische_Tafeln->label({html=>'
#      <table border="1" cellborder="0">
#      <tr><td align="left">1627, Kepler: <b>Rudolfinische Tafeln</b></td></tr>
#      </table>'});

   @chain =edge_chain($j_1080_Toledaner_Tafeln, $j_1270_Alfonsinische_Tafeln, $j_1551_Prutenische_Tafeln, $j_1627_Rudolfinische_Tafeln);
   same_attributes('color', '#33e651', @chain); # Ephemeriden

   

my $j_1632_galilei_dialogo = $graph->node(); 
   $j_1632_galilei_dialogo->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1632, Galilei <b>Dialogo</b></td></tr>
       </table>'});

my $j_1633_Inquisition = $graph->node(); 
   $j_1633_Inquisition->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1633, <b>Inquisition</b></td></tr>
       <tr><td align="left">Galileo muss abschwören</td></tr>
       </table>'});

my $j_1638_galilei_discorsi = $graph->node(); 
   $j_1638_galilei_discorsi->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1638, Galilei <b>Discorsi</b></td></tr>
       <tr><td align="left">Erstmals über Fallgesetze</td></tr>
       </table>'});

my $j_1638_johannes_hevelius = node ('1638: Joh. Hevelius:', 'Mira pulsiert');

$graph -> same_rank($j_1638_johannes_hevelius, $j_1638_galilei_discorsi);

   edge_chain($j_1610_sidereus_nuncius, $j_1632_galilei_dialogo, $j_1638_galilei_discorsi);
#  j_1610_sidereus_nuncius  -> j_1632_galilei_dialogo -> j_1638_galilei_discorsi;
   

my $j_1639_pieroni = $graph->node(); 
   $j_1639_pieroni->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1639, Pieroni meint, eine<br align="left"/><b>Parallaxe</b> entdeckt zu haben.<br align="left"/>War wohl die Aberration.<br align="left"/></td></tr>
       </table>'});

   
 # _}
 #_{ 1640 -
my $j_1643_Torricelli = $graph->node(); 
   $j_1643_Torricelli->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1643, <b>Torricelli-Experiment</b></td></tr>
       <tr><td align="left">Ergebnis beginnt neue Debatte<br align="left"/>über <i>Horror Vacui</i><br align="left"/></td></tr>
       </table>'});

my $j_1644_Descartes = $graph->node(); 
   $j_1644_Descartes->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1644, <b>Descartes</b></td></tr>
       <tr><td align="left">Principia philosophiæ</td></tr>
       </table>'});



my $j_1647_Pascal = $graph->node(); 
   $j_1647_Pascal->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1647, <b>Blaise Pascal</b></td></tr>
       <tr><td align="left">Widerlegt Horror Vacui</td></tr>
       </table>'});

my $j_1661_Viviani = $graph->node(); 
   $j_1661_Viviani->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1661, <b>Viviani</b></td></tr>
       <tr><td align="left">Pendel wie Foucault</td></tr>
       </table>'});

   # _{ 1669
my $j_1669_Hooke = $graph->node(); 
   $j_1669_Hooke->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1669, <b>Robert Hooke</b></td></tr>
       <tr><td align="left">Glaubt, Parallaxe<br align="left"/>entdeckt zu haben</td></tr>
       </table>'});

my $j_1669_Bartholin = $graph->node(); 
   $j_1669_Bartholin->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1669, <b>Bartholin</b></td></tr>
       <tr><td align="left">Beobachtet Doppelbrechung am Calcit</td></tr>
       </table>'});

my $j_1669_Newton = $graph->node(); 
   $j_1669_Newton->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1669, <b>Newton</b></td></tr>
       <tr><td align="left">Emanationstheorie</td></tr>
       </table>'});
   $graph->same_rank($j_1669_Hooke, $j_1669_Newton, $j_1669_Bartholin);
#  {rank=same j_1669_Hooke j_1669_Newton j_1669_Bartholin}
 # _}
 #_}
 #_{ 1670 -
my $j_1670_Roemer = $graph->node(); 
   $j_1670_Roemer->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1670 (1675?), <b>Rømer</b></td></tr>
       <tr><td align="left">Jupitermonde: endliche Lichtgeschwindigkeit</td></tr>
       <tr><td align="left">Stellare Aberration etc. nur möglich mit<br align="left"/>endlicher Lichtgeschwindigkeit<br align="left"/></td></tr>
       <tr><td align="left">Ätherhypothese wird wohl wahr sein müssen.</td></tr>
       </table>'});

my $j_1678_Huygens = $graph->node(); 
   $j_1678_Huygens->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1678, <b>Huygens</b></td></tr>
       <tr><td align="left">Wellentheorie</td></tr>
       </table>'});

my $j_1687_Newton = node('1687, Newton: <b>Principia Mathematica</b>', 'Gravitations- und\ndrei Bewegungsgesetze');

my $principia = $graph->edge($j_1644_Descartes, $j_1687_Newton);
   $principia->label({text=>'Prinzipien'});
   $principia->set_attribute('color','royalblue');
   $principia->set_attribute('fontcolor','royalblue');
   
my $newton_formeln = $graph->edge($j_1609_Astronomia_nova, $j_1687_Newton);
   $newton_formeln->label({text=>'Newton liefert Formeln'});
   $newton_formeln->set_attribute('lblstyle', 'above, sloped');

$graph->edge($j_1627_Rudolfinische_Tafeln, $j_1687_Newton);

my $j_1694_Flamsteed = $graph->node(); 
   $j_1694_Flamsteed->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1694, <b>Flamsteed</b></td></tr>
       <tr><td align="left">Macht am Polarstern<br align="left"/>die gleiche Beobachtung wie Hooke<br align="left"/></td></tr>
       </table>'});
 #_}
 # _}

 # _{ 17xx

my $j_1704_Newton = $graph->node(); 
   $j_1704_Newton->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1704, <b>Newton, Opticks</b></td></tr>
       <tr><td align="left">Teilchennatur des Lichtes wird etabliert. Nicht<br align="left"/>alles Licht ist gleich schnell<br align="left"/></td></tr>
       </table>'});

my $j_1705_halley = node('1705, Halley sagt <b>Kometen</b> voraus.');
   $graph->edge($j_1705_halley , $j_1618_kometen);

my $j_1717_Newton = $graph->node(); 
   $j_1717_Newton->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1717, <b>Newton, Opticks</b> (neue Ausgabe)</td></tr>
       <tr><td align="left">Ansichten über Gravitation,<br align="left"/>Äther besteht aus Teilchen<br align="left"/></td></tr>
       </table>'});

my $j_1726_Bradley = $graph->node(); 
   $j_1726_Bradley->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1726, <b>Bradley</b></td></tr>
       <tr><td align="left">Möchte Hookes Parallaxe<br align="left"/>überprüfen, entdeckt<br align="left"/>Stellare Aberration<br align="left"/></td></tr>
       <tr><td align="left">Angebl. 1. (astron.) Verifikation von Kopernikus.</td></tr>
       </table>'});
   $graph->edge($j_1639_pieroni , $j_1726_Bradley);
   

my $j_1755_kant = node ('1755 Kant: <b>Allg. Nat. Gesch.</b>', '<b>u. Theorie d. Himmels</b>');

my $j_1766_Boscovitch = $graph->node(); 
   $j_1766_Boscovitch->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1766, <b>Boscovich</b></td></tr>
       <tr><td align="left">Schlägt Experiment mit Wasser<br align="left"/>gefülltem Teleskop vor.<br align="left"/></td></tr>
       </table>'});

my $j_1784_Goodricke = node('1784: John Goodricke:', 'Perioden in Delta Cephei');

# _}

 # _{ 18xx
 # _{ 1800-

my $j_1800_Herschel = $graph->node(); 
   $j_1800_Herschel->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1800, <b>Herschel</b></td></tr>
       <tr><td align="left">entdeckt infrarotes Licht.</td></tr>
       </table>'});

my $j_1801_Ritter = $graph->node(); 
   $j_1801_Ritter->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1801, <b>Ritter</b></td></tr>
       <tr><td align="left">entdeckt ultraviolettes Licht.</td></tr>
       </table>'});

my $j_1802_Young = $graph->node(); 
   $j_1802_Young->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1802, <b>Young</b></td></tr>
       <tr><td align="left">Doppelspaltexperiment</td></tr>
       </table>'});

my $j_1804_Young = $graph->node(); 
   $j_1804_Young->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1804, <b>Young</b></td></tr>
       <tr><td align="left">Äther bewegt sich ungehindert durch Materie.</td></tr>
       </table>'});

my $j_1808_Dalton = node('1808, Dalton: Elemente bestehen aus\ngleichartigen letzten Teilchen: <b>Atomen</b>');          # 2016-Mettenheim...pdf 

 @chain = edge_chain($j_demokrit, $j_1808_Dalton);
 same_attributes('color', 'green', @chain);

my $j_1809_Malus = $graph->node(); 
   $j_1809_Malus->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1809, <b>Malus</b></td></tr>
       <tr><td align="left">findet heraus, dass bei Reflexion Licht<br align="left"/>teilweise polarisiert wird.<br align="left"/></td></tr>
       <tr><td align="left">Licht ist also eine Transversalwelle<br align="left"/>und bedarf eines <i>festen</i>, nicht<br align="left"/>flüssigen(!), Äthers.<br align="left"/></td></tr>
       </table>'});

my $j_1810_Arago = $graph->node(); 
   $j_1810_Arago->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1810, <b>Arago</b></td></tr>
       <tr><td align="left">Bewegte Glasplatte führt entweder<br align="left"/>Licht oder Äther mit.<br align="left"/></td></tr>
       </table>'});

my $j_181x_Arago = $graph->node(); 
   $j_181x_Arago->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">181x, <b>Arago</b></td></tr>
       <tr><td align="left">erklärt Versuchsergebnis: Auge sieht nur<br align="left"/>Teil des Lichtspektrums.<br align="left"/></td></tr>
       </table>'});

   @chain = edge_chain($j_1800_Herschel, $j_1801_Ritter, $j_181x_Arago);
   same_attributes('color', 'grey', @chain);


my $j_1817_Fresnel = $graph->node(); 
   $j_1817_Fresnel->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1817, <b>Fresnel</b></td></tr>
       <tr><td align="left">führt die Transversalwellentheorie des Lichts ein.</td></tr>
       </table>'});

my $j_1818_Fresnel = $graph->node(); 
   $j_1818_Fresnel->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1818, <b>Fresnel</b></td></tr>
       <tr><td align="left">Berühmter Brief an Arago:<br align="left"/>Fresnelscher Mitführungskoeffizient erklärt<br align="left"/>Ergebnis von Arago 1810<br align="left"/></td></tr>
       </table>'});
   $graph->edge($j_181x_Arago , $j_1818_Fresnel);

   # _}
 # _{ 1820-

my $j_1820_Orsted = $graph->node(); 
   $j_1820_Orsted->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1820, Ørsted: <b>magn. Wirk. d. elektr. Stromes</b></td></tr>
       </table>'});

my $j_1827_Brown = node('1827, Brown: <b>Zitterbewegung</b>');

my $j_1831_Cauchy = $graph->node(); 
   $j_1831_Cauchy->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1831, <b>Cauchy</b></td></tr>
       <tr><td align="left">Solider Äther bedeutet, dass Materie Äther mitführt.</td></tr>
       </table>'});

   $graph->edge($j_1809_Malus , $j_1831_Cauchy);

my $j_1831_Faraday = node('1831: Faraday: <b>Elektrizität</b>\n<b>und Magnetismus ineinander verwoben</b>');
$graph->same_rank($j_1831_Faraday, $j_1831_Cauchy);

my $j_1834_Faraday = $graph->node(); # 2016-Mettenheim...pdf
   $j_1834_Faraday -> label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1834, <b>Faraday</b></td></tr> 
       <tr><td align="left">Elektrolyse</td></tr> 
       </table>'});

my $j_1838_Bessel = node('1838: Bessel: erstmalige', 'Bestimmung Distanz zu Stern', 'mit <b>Parallaxe</b>');
   $graph->edge($j_1639_pieroni, $j_1838_Bessel);

my $j_1839_Arago = $graph->node(); 
   $j_1839_Arago->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1839, <b>Arago</b></td></tr>
       <tr><td align="left">Theorie: Wassergefülltes Teleksop muss<br align="left"/>nicht mehr geneigt werden.<br align="left"/></td></tr>
       </table>'});
 # _}
 # _{ 1840- 

my $j_1842_dopplerefekt = node('1842: <b>Dopplereffekt</b>');

my $j_1845_Stokes = $graph->node(); 
   $j_1845_Stokes->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1845, <b>Stokes</b></td></tr>
       <tr><td align="left">versucht stellare Aberration durch Äthermitführung<br align="left"/>in der Umgebung der Erde zu erklären.<br align="left"/></td></tr>
       </table>'});
   $graph->edge($j_1831_Cauchy , $j_1845_Stokes);
   # _}
 # _{ 1850- 
my $j_1851_Fizeau = $graph->node(); 
   $j_1851_Fizeau->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1851, <b>Fizeau</b></td></tr>
       </table>'});

my $j_1851_Foucault = $graph->node(); 
   $j_1851_Foucault->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1851, <b>Foucault</b></td></tr>
       </table>'});
   $graph->edge($j_1661_Viviani , $j_1851_Foucault);
   
   $graph->same_rank($j_1851_Fizeau, $j_1851_Foucault);

my $j_1859_Strahlungsgesetz = $graph->node(); # node('1859: <b>Kirhoffsches Strahlungsgesetz</b>');
   $j_1859_Strahlungsgesetz->label({html =>'
     <table border="1" cellborder="0">
       <tr><td align="left">1859: <b>Kirchoffsches Strahlungsgesetz</b></td></tr>
       <tr><td align="left">Offenbar keine Männchen auf Sonnen</td></tr>
       <tr><td align="left">wie von Voltaire etc. formuliert</td></tr>
      </table> '});

my $j_1864_Maxwell_Electromagnetic_Field = node('1864, Maxwell: <b>Electromagnetic Fields</b>', 'Licht is Welle; Äther existiert');

   

my $j_1868_Hoek = $graph->node(); 
   $j_1868_Hoek->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1868, <b>Hoek</b></td></tr>
       <tr><td align="left">Variation von Fizeaus Experiment</td></tr>
       <tr><td align="left">GWR, S. 492: Hoek countered Fresnel</td></tr>
       </table>'});

my $j_1868_Mendelejew = $graph->node(); #  2016-Mettenheim...pdf
   $j_1868_Mendelejew->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1868/9, <b>Mendelejew</b></td></tr> 
       <tr><td align="left">Periodensystem der Elemente</td></tr> 
       </table>'});

   $graph->edge($j_1808_Dalton , $j_1868_Mendelejew);
   
   my $j_1868_huggins = node('1868: William Huggins bestimmt', '<b>Geschwindigkeit eines Sterns</b>', 'mit dem Dopplereffekt');

   $graph->same_rank($j_1868_Mendelejew, $j_1868_Hoek, $j_1868_huggins);

my $j_1870_Maxwell = $graph->node(); 
   $j_1870_Maxwell->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">ca. 1870, <b>Maxwell</b></td></tr>
       <tr><td align="left">Lichtgeschwindigkeit = c, kein Inertialsystem im Vakuum!</td></tr>
       </table>'});

 # _}
 # _{ 1870-


my $j_1871_Airy = $graph->node(); 
   $j_1871_Airy->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1871, <b>Airy</b></td></tr>
       <tr><td align="left">Variation von Aragos 1810 Experiment<br align="left"/>Teleskop muss nicht gekippt werden<br align="left"/>Fresnelscher Mitführungskoeffizient bestätigt.<br align="left"/></td></tr>
       <tr><td align="left">GWR, S. 492 Airy countered Bradley and Fizeau</td></tr>
       </table>'});

my $j_1872_Mascart = $graph->node(); 
   $j_1872_Mascart->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1872, <b>Mascart</b></td></tr>
       </table>'});

my $j_1873_Veltmann = $graph->node(); 
   $j_1873_Veltmann->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1873, <b>Veltmann</b></td></tr>
       <tr><td align="left">zeigt, dass fresn. Mitf. Koeff. falsch ist</td></tr>
       <tr><td align="left">Vgl Mascart (1875)</td></tr>
       </table>'});
   $graph->edge($j_1818_Fresnel, $j_1873_Veltmann);

my $j_1877_Hertz = node('1877(79?): Hertz demonstriert\n<b>eletrk. Wellen</b>');

   
 # _}
 # _{ 1880-

my $j_1886_Lorentz = $graph->node(); 
   $j_1886_Lorentz->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1886, <b>Lorentz</b></td></tr>
       <tr><td align="left">Stokes Ätherhypothese widersprüchlich.</td></tr>
       <tr><td align="left">Fresnels Hypothese bevorzugt.</td></tr>
       </table>'});
   $graph->edge($j_1845_Stokes, $j_1886_Lorentz);

   

my $j_1887_MM = $graph->node(); 
   $j_1887_MM->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1887, <b>Michelson Morley</b></td></tr>
       <tr><td align="left">Fresnelscher Mitführungskoeffizient wird beerdigt.</td></tr>
       <tr><td align="left">Da Mitführungskoeffizient ungültig, ist auch<br align="left"/>1871 Airy ungültig<br align="left"/></td></tr>
       </table>'});

   $graph->edge($j_1864_Maxwell_Electromagnetic_Field , $j_1887_MM);
   


my $j_1887_Hertz_Photoeffekt = node('1887, Hertz: <b>Photo-</b>\n<b>effekt</b> und <b>Radiowellen(?)</b>', 'Keine Erklärung');
   $graph->same_rank($j_1887_Hertz_Photoeffekt, $j_1887_MM);

my $j_1889_FitzGerald = $graph->node(); 
   $j_1889_FitzGerald->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1889, <b>FitzGerald</b></td></tr>
       <tr><td align="left">Längenkontraktion als Erklärung für<br align="left"/>stationären Äther und MMX<br align="left"/></td></tr>
       </table>'});

my $j_1889_Heaviside = $graph->node(); 
   $j_1889_Heaviside->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1889, <b>Heaviside-Ellipsoid</b></td></tr>
       </table>'});
   $graph->same_rank($j_1889_Heaviside, $j_1889_FitzGerald);

   $graph->edge($j_1864_Maxwell_Electromagnetic_Field , $j_1889_Heaviside);

my $j_1893_Wiensches_Verschiebungsgesetz = node('1893: <b>Wiensches Verschiebungsgesetz</b>', {notes=>'Wissenschaft/Physik/Gesetze/Wiensches-Strahlungsgesetz'});

my  $j_1895_Lorentz = $graph->node(); #  2016-Mettenheim...pdf
    $j_1895_Lorentz->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1895, <b>Lorentz</b></td></tr> 
       <tr><td align="left">Theorie des Elektrons</td></tr> 
       </table>'});
   $graph->edge($j_1834_Faraday , $j_1895_Lorentz);

my $j_1895_roentgenstrahlung = node('1895: <b>Röntgenstrahlung</b>');
    $graph->same_rank($j_1895_roentgenstrahlung, $j_1895_Lorentz);

my $j_1896_Becquerel = $graph->node(); 
   $j_1896_Becquerel->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1896, Becquerel <b>radioakt. Zerfall</b></td></tr>
       <tr><td align="left">Keine Erklärung</td></tr>
       </table>'});

my $j_1897_elektron = node('1897: Thomson entdeckt <b>Elektron</b>', 'Atom ist teilbar');


 # _}

 # _}

 # _{ 19xx

 # _{ 1900-

my $j_1900_Planck = $graph->node(); 
   $j_1900_Planck->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1900, <b>Max Planck</b></td></tr>
       <tr><td align="left">begründet die Quantenphysik</td></tr>
       </table>'});
  
my $j_1901_Marconi = node('1901, Guglielmo Marconi\n<b>morst über den Atlantik</b>');

   @chain = edge_chain($j_1820_Orsted, $j_1831_Faraday, $j_1864_Maxwell_Electromagnetic_Field, $j_1877_Hertz, $j_1901_Marconi);
   same_attributes('color', '#5533b7', @chain);


my $j_1903_Trouton_Noble = $graph->node(); 
   $j_1903_Trouton_Noble->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1903, <b>Trouton-Noble</b></td></tr>
       </table>'});

my $j_1904_Lorentz = $graph->node(); 
   $j_1904_Lorentz->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1904, <b>Lorentz</b></td></tr>
       </table>'});

my $j_1905_Einstein_Photoeffekt = node('1905, Einstein: <b>Photoeffekt</b>\nLicht besteht aus Quanten'); 

@chain=edge_chain($j_antike_lichtstrahlen, $j_1669_Newton, $j_1678_Huygens, $j_1802_Young, $j_1864_Maxwell_Electromagnetic_Field, $j_1905_Einstein_Photoeffekt);
 same_attributes('color', "#2263b7", @chain);  # Natur des Lichts

  $graph->edge($j_1887_Hertz_Photoeffekt, $j_1905_Einstein_Photoeffekt);
    

my $j_1905_Einstein_Brown = $graph->node(); 
   $j_1905_Einstein_Brown->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1905, Einstein, <b>Brownsche Bewegung</b></td></tr>
       </table>'});


my $j_1905_Einstein_SRT = $graph->node(); 
   $j_1905_Einstein_SRT->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1905, Einstein, <b>Spez. Relativitätstheorie</b></td></tr>
       </table>'});
   @chain=edge_chain($j_1887_MM, $j_1889_Heaviside, $j_1889_FitzGerald, $j_1904_Lorentz, $j_1905_Einstein_SRT);
   same_attributes('color', "#23ab71");



    $graph->same_rank($j_1905_Einstein_Brown, $j_1905_Einstein_Photoeffekt, $j_1905_Einstein_SRT);

my $j_1907_Perrin = $graph->node(); 
   $j_1907_Perrin->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1907, Perrin best. Einstein</td></tr>
       </table>'});

    @chain = edge_chain($j_1827_Brown, $j_1905_Einstein_Brown, $j_1907_Perrin);
    same_attributes('color', '#77aa33', @chain);
#   j_1827_Brown -> j_1905_Einstein_Brown -> j_1907_Perrin [color="#77aa33"];

my $j_1908_Ritz = $graph->node(); 
   $j_1908_Ritz->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1908, Ritz: <b>Emissionstheorie</b></td></tr>
       <tr><td align="left">Variable Lichtgeschwindigkeit</td></tr>
       </table>'});

    $graph->edge($j_1887_MM , $j_1908_Ritz);
    

my $j_1908_Leavitt = node('1908 Leavitt:', '<b>1777 Variables in the Magellanic Cloud</b>');
   $graph->same_rank($j_1908_Leavitt, $j_1908_Ritz);

   


  # _}
 # _{ 1910-
 
my $j_1911_Rutherford = node('1911, Rutherford:', '<b>planetarisches Atommodell</b>');
     $graph->edge($j_1834_Faraday, $j_1911_Rutherford);

@chain = edge_chain($j_1897_elektron, $j_1911_Rutherford); # Atommodelle
same_attributes('color', "#2953ab", @chain);

my $j_1912_kosmische_Strahlung = node ('1912: Hess entdeckt\n<b>kosmische Strahlung</b>');

my $j_1913_De_Sitter = $graph->node(); 
   $j_1913_De_Sitter->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1913, De Sitter, <b>Doppelstern</b></td></tr>
       </table>'});

my $j_1915_Einstein_ART = $graph->node(); 
   $j_1915_Einstein_ART->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1915, Einstein, <b>Allg. Relativitätstheorie</b></td></tr>
       </table>'});

    $graph->edge($j_1905_Einstein_SRT, $j_1915_Einstein_ART);


my $j_1919_Sonnenfinsternis = $graph->node(); 
   $j_1919_Sonnenfinsternis->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1919, Sonnenfinsternis</td></tr>
       </table>'});

my $j_1919_n_o = node('1919, Rutherford:', '<b>N -&gt; O</b>');
$graph->same_rank($j_1919_Sonnenfinsternis, $j_1919_n_o);

my $j_1920_Shapley_Curtis   = node('1920: Shapley-Curtis Debatte');

my $j_1923_Compton          = node('1923: Comptoneffekt', {notes => 'Wissenschaft/Licht/Compton-Effekt'});

my $j_1924_Hubble_Cepheides = node('1924: Hubble bestimmt\nDistanz zu Andromeda\nmit Cepheiden', 'Grosse Debatte beendet');

edge_chain($j_1920_Shapley_Curtis, $j_1924_Hubble_Cepheides);

my $j_1927_Lemaitre = node('1927: G. Lemaître:', 'Raum expandiert (Uratom)');
my $j_1927_Rotation_Galaxie = node('1927: Lindblad/Oort:\nRotierende Galaxie');

$graph -> same_rank($j_1927_Lemaitre, $j_1927_Rotation_Galaxie);

#
#
# 
@chain = edge_chain($j_1609_david_fabricius, $j_1638_johannes_hevelius, $j_1784_Goodricke, $j_1838_Bessel, $j_1908_Leavitt, $j_1924_Hubble_Cepheides);
same_attributes('color', "#5329ab", @chain);

my $j_1925_Michelson_Gale = $graph->node(); 
   $j_1925_Michelson_Gale->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1925, <b>Michelson Gale</b></td></tr>
       </table>'});

my $j_1929_hubble = node('1929: Hubble', 'Rotl.-versch ~ Distanz');

@chain = edge_chain($j_1842_dopplerefekt, $j_1868_huggins, $j_1929_hubble); # The Astronomy Book, p. 158
same_attributes('color', '#ddabcd', @chain);

 # _}
 # _{ 1930-

my $j_1931_Hubble = $graph->node(); 
   $j_1931_Hubble->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1931, <b>Hubble</b></td></tr>
       <tr><td align="left">Veröffentlicht »Rotverschiebung«</td></tr>
       </table>'});

my $j_1932_chadwick = node('1932, Chadwick entdeckt\ndas <b>Neutron</b>');

my $j_1934_zwicky_baade = node('1934, Zwicky &amp; Baade:\n<b>Neutronensterne</b>');


my $j_jansky_radiowellen = node('1935 (1932?): Jansky entdeckt', '<b>Radiowellen aus dem Zentr.</b>', '<b>der Milchstrasse</b>');
  edge_chain($j_1887_Hertz_Photoeffekt, $j_jansky_radiowellen);

my $j_1938_Hahn_Strassmann = $graph->node(); # 2016-Mettenheim...pdf
   $j_1938_Hahn_Strassmann->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1938, <b>Hahn, Strassmann</b></td></tr> 
       <tr><td align="left">Atom nicht unteilbar</td></tr> 
       </table>'});

my $j_1948_alpher_herman = node('1948, Alpher u. Herman:\nUrknalltemp. 5° K');

my $j_1957_shmaonov = node('1957 Shmaonov: 4±3° K');

my $j_1959_Pound_Rebka = $graph->node(); 
   $j_1959_Pound_Rebka->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1959, <b>Pound-Rebka</b></td></tr>
       </table>'});

   @chain = edge_chain($j_1905_Einstein_SRT, $j_1913_De_Sitter, $j_1915_Einstein_ART, $j_1919_Sonnenfinsternis, $j_1959_Pound_Rebka);
   same_attributes('color', "#a37a33", @chain); #  Tests der Relativitätstheorie

 # _}
 # _{ 1960 -

my $j_1962_Kantor = $graph->node(); 
   $j_1962_Kantor->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1962, <b>Kantor</b></td></tr>
       </table>'});


my $j_1964_quarks = node('1964: Gell-Mann/Zweig: <b>Quarks</b>');
@chain = edge_chain($j_1827_Brown, $j_1897_elektron, $j_1932_chadwick, $j_1964_quarks); # Standardmodell / subatomare Teilchen
same_attributes('color', '#b73355', @chain);

my $j_1965_CMB_entdeckt = $graph->node(); 
   $j_1965_CMB_entdeckt->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1965, <b>CMB entdeckt</b> von Penzias und Wilson</td></tr>
       </table>'});

my $j_1970_Rotation_Andromeda_Nebel = node('1970, Rubin u. Ford:\n<b>Rotationskurve d. Andromedanebels</b>');

my $j_1972_Hafele_Keating = $graph->node(); 
   $j_1972_Hafele_Keating->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1972, <b>Hafele Keating</b></td></tr>
       </table>'});

my $j_1974_taylor_hulse = node('1974: Taylor &amp; Hulse\nentdecken 2 <b>Neutronensterne</b>');
  @chain = edge_chain($j_1932_chadwick, $j_1934_zwicky_baade, $j_1974_taylor_hulse); #  The Astronomy Book, p. 236
  same_attributes('color', "#3a7253", @chain);

my $j_1974_Marinov = $graph->node(); 
   $j_1974_Marinov->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1974, <b>Marinov</b></td></tr>
       <tr><td align="left">Auch 1984?</td></tr>
       </table>'});

$graph -> same_rank($j_1974_taylor_hulse, $j_1974_Marinov);

my $j_1983_Silvertooth = $graph->node(); 
   $j_1983_Silvertooth->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1983, <b>Silvertooth</b></td></tr>
       <tr><td align="left">Auch 1992</td></tr>
       </table>'});

my $j_1985_Allan_et_al = $graph->node(); 
   $j_1985_Allan_et_al->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1985, <b>Allen et all</b></td></tr>
       <tr><td align="left">Around the world Relativistic Sagnac Experiment</td></tr>
       </table>'});

my $j_1992_vatikan = $graph->node(); 
   $j_1992_vatikan->label({html=>'
       <table border="1" cellborder="0">
       <tr><td align="left">1992, Vatikan rehabilitiert Galileo</td></tr> 
       </table>'});

my $j_1992_cobe = node('1992: COBE bestätigt Schwarzkörper-\nkurve u. Anisotropie');

$graph->same_rank($j_1992_vatikan, $j_1992_cobe);

my $j_2010_wmap = node('2010: WMAP misst in CMB Variationen\nvon als 0.00002° K');

@chain = edge_chain($j_1927_Lemaitre, $j_1948_alpher_herman, $j_1957_shmaonov, $j_1992_cobe, $j_2010_wmap);
same_attributes('color', '#fe3982', @chain);

 # _}
 
 # _}

   @chain = edge_chain($j_Aristoteles, $j_1554_Benedetti, $j_1572_Brahe, $j_1577_Brahe, $j_1592_De_Motu, $j_1604_Kepler, $j_1609_Astronomia_nova,
   $j_1610_sidereus_nuncius, $j_1612_sonnenflecken, $j_1647_Pascal, $j_1687_Newton);
   same_attributes('color', 'red', @chain); # Widerlegungen von Aristoteles

   $graph->edge($j_1911_Rutherford , $j_1938_Hahn_Strassmann);

   edge_chain($j_1669_Hooke, $j_1694_Flamsteed, $j_1726_Bradley);

   $graph->edge($j_1726_Bradley , $j_1845_Stokes);

   my $edge_ = $graph->edge($j_1669_Hooke, $j_1838_Bessel);
   $edge_->set_attribute('color', 'grey');
   #[color=grey];

   $graph->edge($j_1810_Arago , $j_1871_Airy);
   edge_chain($j_1818_Fresnel, $j_1851_Fizeau, $j_1868_Hoek);


   edge_chain($j_1766_Boscovitch, $j_1839_Arago, $j_1871_Airy);

   $graph->edge($j_1809_Malus , $j_1817_Fresnel);

   edge_chain($j_1818_Fresnel, $j_1871_Airy, $j_1887_MM);




   @chain = edge_chain(
   $j_Pythagoras, $j_demokrit, $j_Platon, $j_Eudoxos, $j_Kallppos,
   $j_Aristoteles, $j_Aristarch, $j_archimedes_sandrechnung, $j_apollonios_epizykel, $j_hipparchos_exzenter, $j_Almagest, $j_1080_Toledaner_Tafeln, $j_1230_tractatus_sphaera,
   $j_1270_Alfonsinische_Tafeln,
   $j_cusanus, $j_1472_neue_planetentheorie,
   $j_1492_Kolumbus, $j_1510_Commentariolus, $j_1513_Middelburg, $j_1517_Reformation, $j_1539_luther, $j_1543_De_Revolutionibus, $j_1550_Peucer, $j_1551_Prutenische_Tafeln,
   $j_1554_Benedetti, $j_giordano_bruno,  $j_1563_tafeln_falsch, $j_1572_Brahe,
   $j_1577_Brahe, $j_1582_Kalenderreform, $j_1587_Reimers, $j_1588_Tycho_De_mundi,
   $j_1592_De_Motu, $j_1596_Mysterium_Cosmographicum, $j_1604_Kepler, $j_1609_david_fabricius, $j_1609_Astronomia_nova, $j_1610_sidereus_nuncius, $j_1612_sonnenflecken,
   $j_1616_index, $j_1618_kometen, $j_1620_Bacon_Novum_Organum, $j_1627_Rudolfinische_Tafeln,
   $j_1632_galilei_dialogo, $j_1633_Inquisition, $j_1638_johannes_hevelius, $j_1638_galilei_discorsi, $j_1639_pieroni, $j_1643_Torricelli, $j_1644_Descartes, $j_1647_Pascal, $j_1661_Viviani,
   $j_1669_Hooke, $j_1670_Roemer, $j_1678_Huygens, $j_1687_Newton, $j_1694_Flamsteed, $j_1704_Newton, $j_1705_halley, $j_1717_Newton, $j_1726_Bradley, $j_1755_kant,
   $j_1766_Boscovitch, $j_1784_Goodricke, $j_1800_Herschel,
   $j_1801_Ritter, $j_1802_Young, $j_1804_Young, $j_1808_Dalton, $j_1809_Malus,
   $j_1810_Arago, $j_1817_Fresnel, $j_1818_Fresnel, $j_1820_Orsted, $j_1827_Brown, $j_1831_Faraday, $j_1834_Faraday, $j_1838_Bessel, $j_1839_Arago, $j_1842_dopplerefekt,
   $j_1845_Stokes, $j_1851_Foucault, $j_1859_Strahlungsgesetz,
   $j_1864_Maxwell_Electromagnetic_Field, $j_1868_Hoek, $j_1868_Mendelejew, $j_1870_Maxwell, $j_1877_Hertz,
   $j_1871_Airy, $j_1872_Mascart, $j_1873_Veltmann, $j_1886_Lorentz, $j_1887_MM, $j_1889_FitzGerald, $j_1893_Wiensches_Verschiebungsgesetz, $j_1895_Lorentz, $j_1896_Becquerel, $j_1897_elektron, $j_1900_Planck, $j_1901_Marconi, $j_1903_Trouton_Noble, $j_1904_Lorentz, 
   $j_1905_Einstein_Photoeffekt, $j_1907_Perrin, $j_1908_Ritz, $j_1911_Rutherford, $j_1912_kosmische_Strahlung, $j_1913_De_Sitter, $j_1915_Einstein_ART, $j_1919_Sonnenfinsternis, $j_1920_Shapley_Curtis,
   $j_1923_Compton, $j_1924_Hubble_Cepheides, $j_1925_Michelson_Gale, $j_1927_Lemaitre, $j_1929_hubble,
   $j_1931_Hubble, $j_1932_chadwick, $j_1934_zwicky_baade, $j_jansky_radiowellen, $j_1938_Hahn_Strassmann, $j_1948_alpher_herman, $j_1957_shmaonov, $j_1959_Pound_Rebka, $j_1962_Kantor,
   $j_1964_quarks, $j_1965_CMB_entdeckt, $j_1970_Rotation_Andromeda_Nebel, $j_1972_Hafele_Keating, $j_1974_Marinov, $j_1983_Silvertooth, $j_1985_Allan_et_al, $j_1992_vatikan, $j_2010_wmap
 );

 if ('hide ordering edges') {
   same_attributes('style'    , 'invisible', @chain);
   same_attributes('arrowhead', 'none'     , @chain);
 }
 else {
   same_attributes('color'    , 'red'      , @chain);
 }


  
$graph->create('pdf');

sub node {

  my $trs='';

  my $url = '';
  for my $param (@_) {

    if (ref $param eq 'HASH') {

      if ($url = delete $param->{notes}) {
        $url = "http://renenyffenegger.ch/notes/$url";
      }

    }
    else {

      my $line_ = $param;
      if ($line_ =~ s!\\n!<br align="left"/>!g) {
  
        $line_ .= '<br align="left"/>';
      }
  
      $trs .= "<tr><td align='left'>$line_</td></tr>";
    }
  }

  my $nd = $graph->node();
  $nd->label({html=>"<table border='1' cellborder='0'>
      $trs
    </table>"});

  if ($url) {
    $nd -> set_attribute('URL', $url);
  }

  return $nd;

}

sub edge_chain {
  my @nodes = @_;
  my @edges = ();

  my $node_from = shift @nodes;
  for my $node_to (@nodes) {

    push @edges, $graph->edge($node_from, $node_to);

    $node_from = $node_to;
  }
  return @edges;

}
sub same_attributes {

  my $attr_name = shift;
  my $attr_val  = shift;
  my @objs = @_;
  for my $obj (@objs) {

    $obj -> set_attribute($attr_name => $attr_val);

  }

}
