This project is going to be working to create functions to perform 1-rank updates, downdates and additions
to a given SVD. This is based off of work by Matthew Brand of Ohio State University. His work that we are focused on, is
using a thin decomposition of a matrix which is all that is needed for many purposes.
The main objective for creating a SVD update algorithm is to create a means to avoid the high cost of recomputing the SVD
and high memory usage involved in storing large datasets. This is greatly used to break down huge data sets into smaller,
more managable sets.

References:
http://www.merl.com/papers/docs/TR2006-059.pdf ; 
http://www.stat.osu.edu/~dmsl/thinSVDtracking.pdf

Created By:
Taylor Steiger
James Pak


Notes to self: use Sage's SVD function to determine "thinness." Utilize output u,v to determine which rows/columns to
eliminate out of a mxn matrix.





r"""
Updates to the thin SVD using NumPy.



AUTHORS:

- Taylor Steiger, James Pak (2013-06-10): initial version


EXAMPLES::

    sage: b=Mat(RDF,2,3).basis()
    sage: b[0]
    [1.0 0.0 0.0]
    [0.0 0.0 0.0]


We deal with the case of zero rows or zero columns::

    sage: m = MatrixSpace(RDF,0,3)
    sage: m.zero_matrix()
    []

TESTS::

    sage: a = matrix(RDF,2,range(4), sparse=False)
    sage: TestSuite(a).run()
    sage: a = matrix(CDF,2,range(4), sparse=False)
    sage: TestSuite(a).run()
"""

#*****************************************************************************
#       Copyright (C) 2013 Taylor Steiger <tsteiger@uw.edu>
#       Copyright (C) 2013 James Pak <jimmypak@uw.edu>
#
#  Distributed under the terms of the GNU General Public License (GPL)
#  as published by the Free Software Foundation; either version 2 of
#  the License, or (at your option) any later version.
#                  http://www.gnu.org/licenses/
#*****************************************************************************


