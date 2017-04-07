# eZ80 CMake
All right, so let's say you happened to be this guy going about your business compiling them CE programs, whose name happened to be Mateo, when suddenly you see the word **CMake**. You don't really know what it means and you are scratching your head, confused as to how exactly this is better than good ol' makefiles. They work, they're well established, and you've already put all your energy onto it. Well, Mateo, there's just one small problem with makefiles: they don't work so well on Windows.

Now you show me your makefiles and you say, "Well clearly if makefiles didn't work on Windows, then why does my makefile work on Windows *and* Mac?? Ha, checkmate!" But what if you didn't want to do super-hacky things to get your makefile to run on Windows? Oh, yeah, also in the corner of your eye, you see a disgruntled @oldmud0 jumping around yelling, "NINJA! NINJA! NINJA!"

---

Enter CMake. The entire point of CMake is "no fuss," from compiling dependencies to installation. There should be no need to pull out VBScript-fu, or define the different commands for building and copying and removing things in Windows *and* \*nix in every. single. makefile. That's just not how life should be lived.

How do I know there's a need for this? If you take a closer look at KnightOS's repositories, you should take notice that projects that are built for standard platforms already used CMake, but projects specifically targeting Z80/eZ80 just use Makefile, because there is no CMake script that defines the eZ80 toolchain. Until now.

So sit back and relax, and watch how this project fails horribly and Mateo kills me AAHHHH
