Option _Explicit

' Kind of function pointer passing

' We set the on error to the label of the function that we want fn to call.
' fn then raises an error, jumping to the specified label. This way, we can
' make fn call different functions by setting the ON ERROR label before the call.

On Error GoTo 20
Call fn
On Error GoTo 10
Call fn
Print ("Done")
End

10
Print (10)
Resume Next


20
Print (20)
Resume Next

Sub fn ()
    Error 0
End Sub

