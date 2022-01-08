' Failed attempt, this doesn't compile as is because of casting void* to int

Declare Library
    ' stdlib.h memory functions
    Function malloc& (ByVal size~&)
    Sub free (ByVal ptr As _Offset)
    Function realloc& (ByVal ptr As _Offset, Byval new_size~&)
End Declare

Option _Explicit

Dim arr&, char~%%, c%

arr& = malloc&(10)

c% = 0
For char~%% = 48 To 57
    Poke arr& + c%, char~%%
    c% = c% + 1
    '_memput
Next char~%%

arr& = realloc&(arr&, 20)

For c% = 0 To 19
    char~%% = Peek(arr& + c%)
    Print Str$(c%) + ": " + Str$(char~%%)
Next c%

