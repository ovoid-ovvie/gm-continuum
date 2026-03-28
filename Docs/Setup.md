# Setup

[Home](../README.md)

---

Getting Continuum running in a project takes about a minute.

## 1. Download Continuum

Go to the [Releases](../../../releases) page and download the latest `.yymps` file.

## 2. Import into GameMaker

There are two ways to import the package:

**Drag and drop** -- drag the `.yymps` file directly onto the GameMaker IDE and it will open the import window automatically.

**Tools menu** -- open your project in GameMaker, go to `Tools > Import Local Package`, and browse to the downloaded `.yymps` file.

Either way, an import window will open showing the package contents. Click `Add All` to select everything, then click `Import`.

## 3. Configure CMConfig

Open [`CMConfig`](../Continuum/CMConfig/CMConfig.gml) and check the store location. By default Continuum stores its interpolation data in `global.lerp`.

```gml
#macro CM_STORE global.lerp

CM_STORE = {};
```

If `global.lerp` conflicts with something in your project, change the name to anything you like as long as it remains a global variable.

## 4. Done

Continuum is ready to use. Call `lerp_cm()` in any Step event to start driving interpolations.

---

[Next: How It Works](How-It-Works.md)
