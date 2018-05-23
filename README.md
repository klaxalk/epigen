# Epigen

vim wrapper for file epigenetics

## Description

Epigen is a bash script for automation of commenting and uncommenting of sections in Linux configuration files.
If the file syntax allows one-line comments (as most do), Epigen can handle that.
By adding special comments containing a keyword, Epigen can **comment** or **uncomment** lines or blocks of code/text.

## Premise

This piece of software allows to create profiles in linux _dotfiles_.
The profiles can be maintained within a single branch on git, which streamlines the proces of sharing configuration between various devices and even users, both of which might need minor customizations in othewise mostly universal set of files.
The authors personal experience suggests that maintaining minor customizations in git branches often leads to difficult rebasing, which generally slows down the process of pushing new changes from any devices to any other device, resulting in fractured setup.
Thus appeared the idea to contain each version of the configuration within the file.
The section will be activated by uncommenting it only on the device (or by a user) which it is meant for.
This repository provides the basic building block for such utility, the commenting and uncommenting.
The full functionality of the described profile switching is provided by a wrapper utility [dotprofiler](https://github.com/klaxalk/dotprofiler).

## Dependencies

Epigen depends on
1. **bash**,
2. **vim** (7.0 or higher).
No special configuration is needed for either of those.

# Usage

The program is delivered as a bash function **epigen**, which is contained within the **epigen.sh**.

```
usage: epigen [arguments]
  Arguments:
  -m [mode]               Mode (addition/deletion)
    Modes:
      addition            Addition (used to uncomment blocks which are commented by default)
      deletion            Reduction (used to comment blocks which are uncommented by default)
  -s                      Set (uncomments in addition and comments in deletion)
  -u                      Unset (comments in addition and uncomments in deletion)
  -A                      Reverses to default for all (comments all in addition and uncomments all un deletion)
  -g [name]               Block name 
  -f [path]               File path
  -c [format string]      Custom formatting rule for the file

  'addition' and 'deletion' modes are mutually exclusive.
  'set', 'unset' and 'all' operations are mutually exclusive.
```

## Syntax

All operations are marked with a keyword commentary within the target file.
The commentary is constructed as
```
EPIGEN_{ADD,DELETE}_{LINE,BLOCK}_[NAME]
```
where **ADD** stands for adding (uncommenting) lines, **DEL** for removing (commenting out), **LINE** for one-liners and **BLOCK** for multiple lines.
**NAME** is the user-defined identifier, which should be constructed preferably out of alphanumeric characters. 
Epigen is case sensitive.
In the case of blocks, the commentary will appear on a separate line both before and after the targeted block of text, always commented using the file's one-liner commentary.
Curly brackets mark the opening and closing line.

Here is the example of one-liner commentary:
```
# this one-liner will become uncommented # EPIGEN_ADD_LINE_EXAMPLE
```
and here of block commentary:
```
# EPIGEN_ADD_BLOCK_EXAMPLE {

# this line will become uncommented
 
# EPIGEN_ADD_BLOCK_EXAMPLE }
```

When the block has been modified by Epige, it is market as **ACTIVE**:
```
this one-liner will become uncommented # EPIGEN_ADD_LINE_EXAMPLE
 
# EPIGEN_ADD_BLOCK_EXAMPLE ACTIVE {

this line will become uncommented
 
# EPIGEN_ADD_BLOCK_EXAMPLE }
```

## Defining the one-liner commenting style

## Examples

**Uncommenting blocks and lines of code:**
```
# this one-liner will become uncommented # EPIGEN_ADD_LINE_EXAMPLE

# EPIGEN_ADD_BLOCK_EXAMPLE {

# this line will become uncommented
 
# EPIGEN_ADD_BLOCK_EXAMPLE }
```
will become
```
this one-liner will become uncommented # EPIGEN_ADD_LINE_EXAMPLE ACTIVE

# EPIGEN_ADD_BLOCK_EXAMPLE ACTIVE {

this line will become uncommented
 
# EPIGEN_ADD_BLOCK_EXAMPLE }
```
by issuing the command:
```bash
epigen -m addition -s -f file.txt -g EXAMPLE -c '\#\ %s'
```
To undo this specific operation, one can issue:
```bash
epigen -m addition -u -f file.txt -g EXAMPLE -c '\#\ %s'
```
or
```bash
epigen -m addition -A -f file.txt -c '\#\ %s'
```
which unsets all _addition_ changes for all _names_.

**Commenting out blocks and lines of code:**
```
this one-liner will become commented # EPIGEN_DEL_LINE_EXAMPLE

# EPIGEN_DEL_BLOCK_EXAMPLE {

this line will become uncommented
 
# EPIGEN_DEL_BLOCK_EXAMPLE }
```
will become
```
# this one-liner will become commented # EPIGEN_DEL_LINE_EXAMPLE ACTIVE

# EPIGEN_DEL_BLOCK_EXAMPLE ACTIVE {

# this line will become uncommented
 
# EPIGEN_DEL_BLOCK_EXAMPLE }
```
by issuing the command:
```bash
epigen -m deletion -s -f file.txt -g EXAMPLE -c '\#\ %s'
```
or
```bash
epigen -m deletion -A -f file.txt -c '\#\ %s'
```
which unsets all _deletion_ changes for all _names_.
