' Test driver for the mergesort.bm module

Option _Explicit
Randomize Timer

Dim a(1 To 20)
Dim s$, i As Integer

' random array
s$ = ""
For i = 1 To 20
    a(i) = Int(Rnd * 100)
    s$ = s$ + Str$(a(i)) + ","
Next
Print "Random array " + s$
Call mergeSort(a())
Call checkIfSorted(a())
Print

' sorted array
s$ = ""
For i = 1 To 20
    a(i) = i
Next
Print "Sorted array " + s$
Call mergeSort(a())
Call checkIfSorted(a())
Print

' reversed array
s$ = ""
For i = 1 To 20
    a(i) = 50 - i
Next
Print "Reversed array " + s$
Call mergeSort(a())
Call checkIfSorted(a())

End

Sub checkIfSorted (vals())
    Dim s$, sorted, i
    s$ = ""
    sorted = 1
    For i = 1 To 20
        s$ = s$ + Str$(vals(i)) + ","
        If i > 1 Then
            If vals(i - 1) > vals(i) Then
                sorted = 0
            End If
        End If
    Next

    Print s$

    If sorted = 0 Then
        Print "NOT sorted"
    Else
        Print "Sorted"
    End If
End Sub

'$INCLUDE:'mergesort.bm'
