# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Current State

This repository contains only starter assets — there is no Xcode project, source code, or build tooling yet. iFruit is intended to be a SwiftUI fruit-encyclopedia app (the `watchicon.png` asset suggests a watchOS companion). The first development step is creating the Xcode project and importing these resources; build/test commands should be added here once the project exists.

## Resources

- `Resources/Fruits/` — 13 fruit PNG images (apple, blueberry, cherry, gooseberry, grapefruit, lemon, lime, mango, pear, plum, pomegranate, strawberry, watermelon). Image names match the `image:` field in the seed data.
- `Resources/Colors/` — Xcode `.colorset` bundles for asset-catalog import, named `Color<Fruit>Light` / `Color<Fruit>Dark`. These are the gradient color pairs referenced by the seed data. **Note:** `ColorBlueberryLight`/`ColorBlueberryDark` colorsets are missing even though the blueberry entry references them — they must be created when setting up the asset catalog.
- `Resources/AppIcon/watchicon.png` — watchOS app icon.
- `Resources/Data/FruitsData.txt` — Swift source snippets (not JSON): 13 `Fruit(...)` initializer calls meant to be pasted into a Swift data file. Each entry implies the `Fruit` model shape:
  - `title: String`, `headline: String`, `image: String` (asset name)
  - `gradientColors: [Color]` (light/dark colorset pair)
  - `description: String` (multi-line)
  - `nutrition: [String]` — 6 fixed positions: energy, sugar, fat, protein, vitamins, minerals
