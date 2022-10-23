## Bring Your Own Password Manager
BYOPM is a portable Password Manager implementation based on [BitWarden](https://bitwarden.com/) and a Raspberry PI Zero. It's a self hosted solution, with full functionality, which is activated by just plugging the device on your computer. Bitwarden's Official browser addons and extensions are also supported, and the device has been tested both on Windows (10 and 11) and Linux (Debian Based).
<p align="center">
  <img src="/images/byopm.jpg">
</p>

## How it works

Plug BYOPM to your computer using a micro usb cable, after about a minute a new network device will be automatically created and appear as connected. BYOPM hosts a Bitwarden instance which is required for managing your passwords and also emulates an ethernet network interface card in order to be accessible from your computer without any configuration. Bitwarden is accessbible using your browser at https://byopm.local.
## Bill of Materials

1) Raspberry Pi Zero (Any version will be OK, but if you want to print the official BYOPM case avoid the H versions which include the 2.54mm pin header)
2) Tactile Push Button 6 * 6 * 6 mm ([amazon.com](https://www.amazon.com/MakerSpot-Momentary-Tactile-Breadboard-Friendly/dp/B06XT3FLVM))
3) Raspberry PI Case [optional] ([thingiverse](https://www.thingiverse.com/thing:5581692))
4) 3 * M2 * 6 mm screws [optional]
5) 3 * 3 mm transparent acrylic rod (if you plan to print the custom case) [amazon.com] (https://www.amazon.com/Weststone-acrylic-Transparent-Standard-Tolerance/dp/B07YMSQXKG)

<p align="center">
  <img src="/images/bom.jpg">
</p>


<a href="https://novamostra.com/2022/10/23/byopm/">Read more at novamostra.com</a>
