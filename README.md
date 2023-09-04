# EuroPanelMaker

![GitHub Releases](https://img.shields.io/github/release/benjiaomodular/EuroPanelMaker?sort=date)

Eurorack panel generator for OpenSCAD by [@benjiaomodular](https://www.instagram.com/benjiaomodular/).

## Sample Usage 
```
import <EuroPanelMaker/panel.scad>

hp = 4;              # width of module in horizontal pitch
title = "VCA"        # a title to display on top
pots = [];
jacks = [];

generatePanel();
```

![Template preview](preview.png)

I talked about how and why I developed this library on my Youtube channel. Sponsored by [PCBWay](https://pcbway.com)!

[![Watch the video](https://img.youtube.com/vi/8PgxXPMlfh4/0.jpg)](https://youtu.be/8PgxXPMlfh4)

## Installation

Download the [latest release](https://github.com/benjiaomodular/EuroPanelMaker/releases/latest) and copy the `EuroPanelMaker` folder into your project directory.

![Project dir](projectdir.png)

## Parameters

### Mandatory variables

```
hp = 4;
title = "VCA";
```

### Optional parameters
A number of variables can be altered. Instert any of these configurations before the list of components. Here is a list with their default values:

```
margin = 0;
text_depth = 1.4;
title_font_size = 4.5;
title_font = "Liberation Sans:style=bold";
label_font = "Liberation Sans:style=bold";
label_font_size = 3;
pot_label_distance = 12;
pot_label_font_size = 3;
jack_label_distance = 8;
jack_label_font_size = 3;
toggle_label_distance = 12;
toggle_label_font_size = 3;
key_label_distance = 14;
key_label_font_size = 3;
```

Additionally, extra labels can be added to the panel.
```
labels = [
    [x (in HP column), y (mm), label, rotation (degrees)]
];
```

Each component also has an alternative form where the x-coordinate can be defined by millimeters as opposed to HP. This can be accomplished by adding `_mm` to the end of the component name.


## Components

Components are defined by arrays.


### Buttons (Cherry-style)

#### Variable: `keys`

#### Parameters
- `x` - number of horizontal units from the left
- `y` - number of vertical units from the bottom
- `label` - text placed below the button


#### Examples
Basic
```
hp = 4;
keys = [
    [2, 70, "KEYS"],
];
```

Row
```
hp = 8;
keys = [
    [2, 70, "A"],
    [6, 70, "B"],
];
```


### Jacks

#### Variable: `jacks`

#### Parameters
- `x` - Number of horizontal units from the left. Default is in HP (2.54mm).
- `y` - Number of vertical units from the bottom. Default is in milimeters.
- `label` - Text placed below the button
- `size` - The type of jack. (Options: `35mm` for 3.5mm jacks or `14in` for 1/4" jacks). Default: `35mm`.
- `rotation` - Rotate the jack around the center of the hole.


#### Examples
Basic
```
jacks = [
    [x (in HP column), y (mm), label, size, rotation (degrees)]
];

```
### Hex Spacers
Compatible with 2mm, 2.5mm, 3mm, 4mm, 5mm, 6mm

```
spacers = [
    [x, y, size (2, 2.5, 3, 4, 5, 6)]
];
```

### LEDs
```
leds = [
    [x (in HP column), y (mm), diameter (mm)]
];
```

### Potentiometers (RV16)
```
pots = [
    [x (in HP column), y (mm), label, rotation (degrees)]
];
```

### Potentiometers (RD901F, RV06)
```
pots_rd901f = [
    [x (in HP column), y (mm), label, rotation (degrees)]
];
```

### Switches (MTS)
Compatible with MTS-10x, MTS-20x, MTS-30x

```
switches = [
    [x (in HP column), y (mm), label above, label below, rotation (degrees)]
];
```

### Rectangular Holes

```
rectangular_holes = [
    [x, y, inner_width (mm), inner_height (mm), outer_width (mm), outer_height (mm)]
];
```

Add as many components as necessary in each array. Some notes:

- The rotation parameter on any component can be omitted for no rotation
- The options for jack size is `"35mm"` (for 3.5mm) or `"14in"` (for 1/4 inch) - if omitted, then it will be 3.5mm
- The label below parameter for a switch can be omitted for no label below the switch

Finally, generate the panel.
```
generatePanel();
```
The panel can also be flipped to be exported for printing.
```
panel_flipped = true;
```

## Examples
You can use `template.scad` as a starting point for your project.

I have included my own panels under `examples/benjiaomodular` for reference. Feel free to add a folder and submit a pull request if you'd like to include your own panels. 

### benjiaomodular
| Name   |      SCAD file      | Preview |
|----------|:-------------:|:------:|
| bong0 | [bong0.scad](examples/benjiaomodular/bong0.scad) | ![Bong0 Preview](examples/benjiaomodular/bong0.png) |
| ce2lfo | [ce2lfo.scad](examples/benjiaomodular/ce2lfo.scad) | ![CE2LFO Preview](examples/benjiaomodular/ce2lfo.png) |
| gate2trig | [gate2trig.scad](examples/benjiaomodular/gate2trig.scad) | ![Gate2Trig Preview](examples/benjiaomodular/gate2trig.png)|
| oras | [oras.scad](examples/benjiaomodular/oras.scad) | ![Oras Preview](examples/benjiaomodular/oras.png)|
| squares | [squares.scad](examples/benjiaomodular/squares.scad) | ![Squares Preview](examples/benjiaomodular/squares.png)|
| vca | [vca.scad](examples/benjiaomodular/vca.scad) | ![VCA Preview](examples/benjiaomodular/vca.png)|
| wavefolder | [wavefolder.scad](examples/benjiaomodular/wavefolder.scad) | ![Wavefolder Preview](examples/benjiaomodular/wavefolder.png)|

## Contributing

Some helpful tips for contributing to the EuroPanelMaker library. 

TODO: Add guidelines.

### Visual Tests
A script is available to verify that features of the library are functional. Running `./tests.sh` will generate a set of example panels which will be displayed for visual inspection (tested only on Linux).

A similar image will be displayed:

![docs/example-out.png](docs/example-out.png)

Look out for misaligned or suspicious renderings. Individual SCAD files are available under `tests/` for further investigation.

NOTE: This will probably be a temporary solution until a more automate testing process is available.
