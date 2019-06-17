# Based on => The code is used to instantiate an object that
# inherits from “base” in 3 different ways. we want the
# ability to instantiate an object using a hash, a block
# and with no arguments at all.

# If you were to review the following code, what feedback
# would you give? Please be specific and indicate any errors
# that would occur as well as other best practices and code
# refactoring that should be done.

1) # The second End should be end, otherwise you get a syntax
# error, about the first End see 3)
2) # Change at for attributes for readability
3) # Let initialize assign the attributes directly without so
# many methods please see suggested initialize
