[Download Continuum](downloads/gm_continuum_v1_0_0.yymps)

Continuum is released under the MIT License. See [LICENSE.md](LICENSE.md) for details. In short, Continuum is free to use and modify, including commercially.

## Overview
Continuum is an interpolation library for GameMaker Studio 2.3 and later. It uses animation curves and custom-built functions to process interpolation with more options and less issues than the engine's inbuilt options.

## Compatibility
Continuum requires **GameMaker Studio 2.3 or later**, as it relies on:
- Animation curve assets (`Asset.GMAnimCurve`)
- Structs and dynamic property access (`{}` and `$`)
- Default function arguments and first-class functions

## Description


## Curves
The library includes a number of prema
### Standard Methods
- linear
- sine
- quint
- quad
- quint
- expo
- elastic
- cubic
- circ
- back
- bounce
- back
### Custom Methods
- bounce return
- tri pulse
- tri pulse partial
- quint pulse
- quint pulse partial
- ease out
### Linear Variations
These curves only begin interpolating once reaching a certian percentage of the total duration.
- delayed (10%)
- delayed (20%)
- delayed (25%)
- delayed (33%)
- delayed (50%)
- delayed (66%)
- delayed (75%)
- delayed (80%)
- delayed (90%)
