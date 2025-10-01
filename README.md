# Bucks Gamedev Club - Demo Game

*Some demo art assets*\
![enemy](Assets/exported/Sprites/enemy.png)
![hover dude](Assets/exported/Sprites/player_move.png)
![swans](Assets/exported/Sprites/swan.png)


## Getting Started
> [!NOTE]
> This documentation is a work in progress. It may incomplete, incorrect, or both.

We use **GitHub**, **Git LFS**, and **Godot**. Day-to-day work happens on the develop branch; main is the 'stable/always working' branch.

### Repository layout

- `/project.godot`
- `/Assets/`
  -   `/raw/`                 Source art — LFS + locking[^1].\
  -  `/exported/`               Game-ready assets Godot references (PNG/WEBP/GLB/OGG, etc)\
      - `/BackgroundTiles/ /Pickups/ /Platforms/ /Sprites/ /TileSets/ /Unused/`
- `/Scenes/`                 .tscn levels/scenes (text, mergeable)\
- `/Scripts/`                .gd (and .gd.uid) scripts\
- `/docs/`                   guidelines, notes, etc.\

>[!WARNING]
>Move/rename assets inside Godot (not in Explorer or Folders) so references update automatically

###Branching Model

[^1]: Not yet but I'll get it


2. and do some stuff
<img width="512" height="212" alt="Godot_logo" src="https://github.com/user-attachments/assets/6d97182c-558e-4b6d-8b53-a8202f4a375e" />
