//////////////////////////////////////////////////////////////////////
// dwmblocks customization adjusted for Zeppe-Lin.                  //
// See dwmblocks LICENSE file for copyright and license details.    //
//                                                                  //
// Copy this file (or config.def.h from sources) to config.h and    //
// adjust conform to your needs to override this customization.     //
//////////////////////////////////////////////////////////////////////

// Hack! Increase statusbar output. Normally shouldn't be redefined.
#define CMDLENGTH 100

// Modify this file to change what commands output to your statusbar,
// and recompile using the make command.
static const Block blocks[] = {
// Icon       Command                     Update Interval  Update Signal
  {"",        "dwmblocks-battery.sh",     2,               0},
  {"",        "dwmblocks-audiovol.sh",    2,               0},
  {"\uf85a ", "dwmblocks-cpumem.sh",      2,               0},
  {"\uf7c9 ", "dwmblocks-diskfree.sh",    15,              0},
  {"\uf5ef ", "date '+%b %d (%a) %H:%M'", 5,               0},
}; // NOTE! "\ufXXX" requires ttf-font-iosevka-nerd

// Sets delimiter between status commands.
// NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;

// vim:sw=2:ts=2:sts=2:et:cc=72:tw=70
// End of file.
