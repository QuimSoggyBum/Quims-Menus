<p align="center">
   <img width="100" height="100" alt="image" src="https://github.com/user-attachments/assets/45bce047-3be0-44b1-a45b-93fb1a7e1578" />
</p>

# Quims-Menus
MCretor Plugin to add some Vanilla GUI bindings to custom blocks like Crafting Tables, it also adds some useful block and item related functions.


Hello and welcome to my first ever little plugin, I have seen a few people asking how to open
the vanilla crafting table or other menus, well I was able to get this to work on mod I took
ownership of so I have converted it to a plugin, and added a few useful functions down the line.

## Current Version
 - 0.0.0.7

## How to use:

 - Download the zip and place it in your plugin folder for mcreator
 - open/create a procedure
 - find Quims Menus and play with the functions included, enjoy. 

<img width="190" height="171" alt="image" src="https://github.com/user-attachments/assets/aff7ec3c-2a4d-4326-bee9-517af9f00886" />
<img width="187" height="107" alt="image" src="https://github.com/user-attachments/assets/c845dc64-74b3-4404-8a15-b3d08e099d51" />

### Block Actions:
<p align="center">
    <img width="810" height="356" alt="image" src="https://github.com/user-attachments/assets/02558cac-54a2-4256-9b82-361a67a3c0fa" />
</p>

### Item Data:
<p align="center">
    <img width="893" height="355" alt="image" src="https://github.com/user-attachments/assets/6134bc62-343c-49d5-912b-de8e1490ff1b" />
</p>

### Vanilla GUI's:
<p align="center">
   <img width="781" height="622" alt="image" src="https://github.com/user-attachments/assets/395f3c9a-f9ce-400c-9cdb-1e3558c70a6b" />
</p>

### Exambles:
<p align="center">
    <img width="1125" height="409" alt="image" src="https://github.com/user-attachments/assets/bf0db733-15ca-4e9b-b3ec-b2c5dbbdce81" />
</p>

<p align="center">
    <img width="450" height="394" alt="image" src="https://github.com/user-attachments/assets/77ecf780-9a21-4e20-a369-94f75ffaa8ef" />
</p>

<p align="center">
   <img width="1604" height="866" alt="image" src="https://github.com/user-attachments/assets/388f467d-3224-4aa8-b686-511fccfa584c" />
</p>

### Supported Tables

 - Crafting Table
 - Enchantment Table
 - Anvil
 - Ender Chest
 - Grindstone
 - Smithing Table
 - Loom
 - Cartography Table
 - Hopper
 - Stonecutter

### Item Data fucntions
- Return a random item, exclude **{ITEM_LIST}** (Use commas to split items), exlude admin items? {Boolean}

- **{ITEM_LIST}**: this is just a simple list with a comma to split them up EG: minecraaft:apple,*_ore would explude apples and all ores but we added no namespace on the ore so it would disabled all ore include other mods to be returned.

### Block Action functions
 - Pull items from block inventory connected **{Direction}** of xyz
 - Push items from block at xzy to block inverntory connected at **{Direction}**
 - Void items of block inventory at xyz as **{deleted_type}**

 - - **{Direction}**: UP, DOWN, NORTH, EAST, WEST, SOUTH
 - - **{deleted_type}** Single, will delete slowly 1 item at a time, Slot, will delete at a slot at a time, Inventory, deleteds the full blocks inventory at the definded xyz

### Tested MCreator Versions

 - 2025.2
 - 2025.3
 - 2026.1
 - 2026.2
 

### Tested Minecraft Versions

 - [Unsupported] 1.20.1     |     - Forge

 - [Supported] 1.21.1       |     - NeoForge

 - [Supported] 1.21.4       |     - NeoForge

 - [Supported] 1.21.8       |     - NeoForge

 - [Supported] 26.1.2       |     - NeoForge
 
 - [Untested] 1.21.8        |     - Fabric 
 
 - [Unsupported] 26.1.2     |     - Fabric 
 
<br>
<br>
<br>

### Notes
  Newer versions of MCretor and Minecraft will be tested when I am able to, 
  I have a life, I am disabled and I am also learning this stuff as I go so some 
  updates might be slow.
    
  I will add custom note here when I have extra information and add it to the 
  versions above
 

 - [Unsupported]          - I wont be testing any more then basic does it boot and open a quick test.

 - [Supported]            - Will try bug fix asap

 - [Untested]             - Added it but unable to test it for some reason

 

I will be adding more in the future and will support different versions, I tested this with the MCreator version that I am using and the Minecraft I am using at this moment, I made this for myself first and wanted to share this with everyone else.
