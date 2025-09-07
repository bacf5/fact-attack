<h2 align="center">
  ✨ Fact Attack!🐾 ✨
</h2>

<p align="center"><img width="300" alt="image" src="Assets.xcassets/AppIcon.appiconset/appIcon2.png"></p>

## Table of Contents

- [Description](#description)
- [Motivation](#motivation)
- [Built with](#built-with)
- [Concepts Used](#concepts-used)
- [Showcase](#showcase)
- [To-do](#to-do)

## Description

Fact Attack! is a lightweight app that delivers random images and facts about cats, dogs, and ducks, with the tap of a button. Using multiple APIs, instantly fetches a fresh picture and an interesting "facto" for the selected animal. Navigation is handled through simple TabViews, letting you switch seamlessly between your favorite animal.

## Motivation

So i made Fact Attack! because obviusly i love these animals, but also, combine that with my journey in learning SwiftUI development. This project was the opportunity to practice asynchronous API calls, explore the MVVM architecture, work with URLSession for networking, and use JSONDecoder() to handle data parsing to name a few.

## Built with

- SwiftUI
- Xcode 16.4

## Concepts explored

TabView • .sensoryFeedback() • JSONDecoder() • Async API Calls • Async Image Loading • task() • do-catch • Access Control • MVVM • @Observable • @MainActor • Privacy • get/set • Separation of Concern etc

## Preview

![](SampleData/factattack-preview.webp)

## To-do

- [x] ~~Fix Duck icon 🦆 in TabView (dark mode appears too dark).~~
- [ ] Replace default ProgressView with a custom loader or something else.
- [x] ~~Add animation and improved styling to the main button.~~
- [ ] Add an “Info” viewSheet with Wikipedia Info and links for each animal. Maybe?
- [x] ~~Create a custom REST API for duck facts (none currently available that i could find).~~ [duck API](https://github.com/bacf5/ducks-api)
- [x] ~~Add images and GIFs to the README to showcase the app~~
- [ ] Include a disclaimer that facts are not verified lol
- [x] ~~Add sound feedback when you tap the button~~
- [x] ~~Make the img tapable to enlarge - probably.~~
- [ ] Add a form to POST a new duck fact into my API.
- [ ] GET a new duck fact from my API.
- [ ] Add a custom launch screen. <- NOPE // tbh i did it but was super ugly.
- [x] ~~Added sensory feedback when you tap the button~~
- [x] ~~Added facts for ducks view~~



> [!NOTE]
> The app icon and the background images are made with Gemini AI.

-----

I know my code doesn't respect much about DRY principle and stuff. I was mainly experimenting to become more familiar with SwiftUI and Xcode

Ciao.
