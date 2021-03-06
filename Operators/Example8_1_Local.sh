#!/bin/bash
# gcd.sh: greatest common divisor
#         Uses Euclid's algorithm

#  The "greatest common divisor" (gcd) of two integers
#+ is the largeset integer that will divide both, leaving no remainder.

# Euclid's algorithm uses successive division.
#   In each pass,
#+      dividend <--- divisor
#+      divisor  <--- remainder
#+  until remainder = 0.
#  The gcd = dividend, on the final pass.
#
#  For an excellent discussions of Euclid's algorithm, see
#+ Jim Loy's site, http://www.jimloy.com/number/euclids.htm.


# -------------------------------------------------------------
# Argument check
ARGS=2
E_BADARGS=85

if [ $# -ne "$ARGS" ]
then
    echo
    echo "Usage: `basename $0` first-number second-number"
    exit $E_BADARGS
fi

# -------------------------------------------------------------
# Whole number check
if  [[ ! $1  =~ ^-?[0-9]+$ || ! $2 =~ ^-?[0-9]+$ ]]
then
    echo
    echo "Usage: `basename $0` Arguments must be integers."
    exit $E_BADARGS
fi
# -------------------------------------------------------------

gcd()
{
    dividend=$1         #  Arbitrary assignment.
    local divisor=$2          #! It doesn't matter which of the two is larger
                        #  Why not? Do both ways with 24 and 9 :)

    local remainder=1         #  If an uninitialized variable is used inside
                        #+ test brackets, an error message results.

    until [ "$remainder" -eq 0 ]
    do    #  ^^^^^^^^^^  Must be previously initialized!
        let "remainder = $dividend % divisor"
        dividend=$divisor    # Now repeat with 2 smallest numbers
        divisor=$remainder
    done                    # Euclid's algorithm

}                           # Last $ dividend is the gcd

gcd $1 $2

echo; echo "GCD of $1 and $2 = $dividend"; echo

# Exercises :
# ---------
#  1) Check command-line arguments to make sure they are integers,
#+ and exit the script with an appropriate error message if not.
#  2) Rewrite the gcd () function to use local variables.

exit 0
