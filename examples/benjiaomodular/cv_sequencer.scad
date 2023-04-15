include <../../EuroPanelMaker/panel.scad>

hp = 20;
title = "BABY-8";
text_depth = 1.2;
title_font_size = 3.8;
margin = 3;

pots = [
    [2, 100, "TIME"],
    [6, 100, "1"],
    [6, 75, "2"],
    [6, 50, "3"],
    [6, 25, "4"],
    [10, 100, "5"],
    [10, 75, "6"],
    [10, 50, "7"],
    [10, 25, "8"]];

leds = [
    [19, 105, 5],
    [19, 95, 5],
    [19, 85, 5],
    [19, 75, 5],
    [19, 65, 5],
    [19, 55, 5],
    [19, 45, 5],
    [19, 35, 5],
    [19, 15, 5],
];

jacks = [
    [2, 75, "CLK OUT"],
    [2, 50, "RESET"],
    [2, 25, "CLK IN"],
    [17, 105, "", -90],
    [17, 95, "", -90],
    [17, 85, "", -90],
    [17, 75, "", -90],
    [17, 65, "", -90],
    [17, 55, "", -90],
    [17, 45, "", -90],
    [17, 35, "", -90],
    [14, 15, "CV"],
    [17, 15, "Gate"]
];

toggle_switches = [
    [14, 105, "", 90],
    [14, 95, "", 90],
    [14, 85, "", 90],
    [14, 75, "", 90],
    [14, 65, "", 90],
    [14, 55, "", 90],
    [14, 45, "", 90],
    [14, 35, "", 90],
];

panel_flipped = true;
generatePanel();
