
# RPi_Vid_Core #

The binary egg provided on the downloads-page can be installed using easy_install (part of setuptools / distribute packages). Alternatively, you can simply add the egg to your PYTHONPATH / sys.path and import from it.

Most of the examples use pyximport to build the cython code on-the-fly. Pyximport is part of Cython. If you want to run these using an egg, you should comment out the lines like:

    import pyximport
    pyximport.install()

I've included a Cython binary egg for the latest release in the downloads section, as building Cython takes ages on the Pi.

Progress so far (stuff that works in 0.1.1 release):

    Path creation and manipulation
    Images created to/from string-data (from PIL or numpy)
    Text-rendering (see example for a class which uses vg.Font and freetype to render text)
    Paints 

Stuff which hasn't been tested yet or doesn't work:

    Mask / clip-regions
    Image filters
    Writing direct to/from screen using buffer data 

OpenVG is almost entirely wrapped. The only bits missing are the image filters. These should follow soon enough. I've not started on OpenGL-ES yet; this seems less important since ctypes based wrappers are already available.

If anyone want to ask about this, drop me an email for bryancole.cam at geemail dot com. Or post a question on the RPi Forum.
ToDos

    Wrap image filters
    Write doc-strings
    Create a vg_context_params extension-class to access parameters as properties
    Add properties to all handle-based objects (Paths, Images, MaskLayers, Fonts etc.)
    Add numpy-integration for Paths and Images
    Add convenience methods to paths (line_to, move_to etc. similar to cairo)
    Give objects a better repr
    Make some sphinx-based documentation

Updated 2012-06-26 