' Test driver for vector.bi and vector.bm

Option _Explicit

'$INCLUDE:'vector.bi'


Dim v As Vector
Dim x&, s&

Call vector_make(v, 0)

Print "Test push"

For x& = 1 To 20
    Call vector_push(v, x&)
Next
s& = 0
For x& = 0 To 19
    'Print Str$(vector_get(v, x&))
    s& = s& + vector_get(v, x&)
Next
Print "vector size " + Str$(v.size)
Print "Sum " + Str$(s&)

' ----------------

Print "Test init size and index range"

Call vector_make(v, 5)
Dim index&
On Error GoTo 1
s& = 0
For index& = 0 To 4
    s& = s& + vector_get(v, index&)
Next
Print "vector size " + Str$(v.size)
Print "Sum " + Str$(s&)

Call vector_free(v)

End

1
Print "Index " + Str$(index&) + " out of range"
Resume Next

'$INCLUDE:'vector.bm'

