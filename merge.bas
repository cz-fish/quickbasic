Option _Explicit
Randomize Timer

Dim a(1 To 20)
Dim s$, i As Integer

' random array
s$ = ""
For i = 1 To 20
    a(i) = Int(Rnd * 100)
    s$ = s$ + Str$(a(i)) + ", "
Next
Print "Random array " + s$
Call mergeSort(a())
Call checkIfSorted(a())

' sorted array
s$ = ""
For i = 1 To 20
    a(i) = i
Next
Print "Sorted array " + s$
Call mergeSort(a())
Call checkIfSorted(a())

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
        s$ = s$ + Str$(vals(i)) + ", "
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

Sub merge (vals(), min&, mid&, max&)
    'Print "Merge between " + Str$(min&) + ", " + Str$(mid&) + ", " + Str$(max&)
    Dim extra(0 To max& - min& - 1)
    Dim i&, j&, k&
    i& = min&
    j& = mid&
    k& = 0
    While i& < mid& And j& < max&
        If vals(i&) <= vals(j&) Then
            extra(k&) = vals(i&)
            i& = i& + 1
        Else
            extra(k&) = vals(j&)
            j& = j& + 1
        End If
        k& = k& + 1
    Wend
    While i& < mid&
        extra(k&) = vals(i&)
        i& = i& + 1
        k& = k& + 1
    Wend
    ' We should also copy whatever's left between j& and max& to extra,
    ' but because we'll then be copying back from extra to vals, those
    ' values are already in the right place, so we skip that
    For i& = 0 To k& - 1
        vals(min& + i&) = extra(i&)
    Next i&
End Sub

Sub mergeSort (vals())
    Dim min(1 To 20) As Long
    Dim max(1 To 20) As Long
    Dim flags(1 To 20) As Integer
    Dim mid As Long
    Dim level As Integer
    Dim interval As Long
    min(1) = LBound(vals)
    max(1) = UBound(vals) + 1
    level = 1
    While level > 0
        interval = max(level) - min(level)
        If interval = 1 Then
            '1 value is always sorted
            level = level - 1
        ElseIf interval = 2 Then
            '2 values may or may not be swapped
            If vals(min(level)) > vals(min(level) + 1) Then
                Swap vals(min(level)), vals(min(level) + 1)
            End If
            level = level - 1
        Else
            'more values need to be split, sorted and merged
            mid = (min(level) + max(level)) / 2

            If flags(level) = 1 Then
                'split has already been done, we need to merge
                If vals(mid) > vals(mid - 1) Then
                    ' it's already fine, the left half is smaller than the right one
                Else
                    Call merge(vals(), min(level), mid, max(level))
                End If
                level = level - 1
            Else
                'didn't split yet, do that first, and mark flag for merging next time
                flags(level) = 1
                min(level + 1) = min(level)
                max(level + 1) = mid
                flags(level + 1) = 0
                min(level + 2) = mid
                max(level + 2) = max(level)
                flags(level + 2) = 0
                level = level + 2
            End If
        End If
    Wend
End Sub



