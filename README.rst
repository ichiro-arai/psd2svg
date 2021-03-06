PSD2SVG
=======

PSD to SVG converter based on `psd-tools2`_ and `svgwrite`_.

.. image:: https://img.shields.io/pypi/v/psd2svg.svg
   :target: https://pypi.python.org/pypi/psd2svg
   :alt: PyPI Version

.. image:: https://img.shields.io/travis/kyamagu/psd2svg/master.svg
   :alt: Build Status
   :target: https://travis-ci.org/kyamagu/psd2svg

.. _`psd-tools2`: https://github.com/kyamagu/psd-tools

.. _`svgwrite`: https://github.com/mozman/svgwrite

Install
-------

Use ``pip`` to install::

    pip install psd2svg

To use AWS S3 storage backend::

    pip install boto3

Usage
-----

The package comes with a command-line tool::

    psd2svg input.psd output.svg

When the output path is a directory, or omitted, the tool infers the output
name from the input::

    psd2svg input.psd output/  # => output/input.svg
    psd2svg input.psd          # => input.svg

When ``--export-resource`` flag is specified, all png resources are exported
to the path specified by ``--resource-prefix``::

    psd2svg input.psd output.svg --export-resource
    # => output.svg, xxx1.png, ...

    psd2svg input.psd output/ --export-resource
    # => output/input.svg, output/xxx1.png, ...

    psd2svg input.psd output/ --export-resource --resource-prefix=resources/
    # => output/input.svg, output/resources/xxx1.png, ...

    psd2svg input.psd svg/ --export-resource --resource-prefix=../png/
    # => svg/input.svg, png/xxx1.png, ...

To render text in vector stroke::

    psd2svg input.psd output/ --text-mode text

The tool can specify URL instead of file path (S3 requires ``boto3``)::

    psd2svg http://example.com/input.psd
    psd2svg s3://bucketname/path/to/input.psd s3://bucketname/path/to/output/

API
---

The package contains high-level conversion function ``psd2svg``::

    from psd2svg import psd2svg

    psd2svg('path/to/input.psd', 'path/to/output/')

Test
----

Invoke tox::

    tox

Notes
-----

* SVG 1.1 does not cover all the blending modes in Photoshop (e.g.,
  ``linear-dodge``)
* Filter effects are approximation. Some effects are not implemented.
* Most of adjustments layers are not implemented.
* Smart object filters are not implemented.
* Browser support: SVG rendering quality greatly differs depending on the
  browser. Chrome tends to be the best quality.
* APIs of this tool is NOT thread-safe.
