%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov edi, [ebp + 12] ;; edi devine len
    sub edi, 1 ;; se scade edi cu 1
    sub ebx, 4 ;; se scade distances cu 4

top:

    cmp edi, 0 ;; daca edi este 0 se finalzieaza programul
    je done

    mov ecx, [eax] ;; se salveaza x1
    add eax, 4
    mov edx, [eax] ;; se salveaza x2
    sub eax, 4

    cmp cx, dx ;; se compara x1 si x2
    jne x_not_equal ;; daca nu sunt egale sare la x_not_equal

    xor ecx, ecx ;; se reseateaza registrii
    xor edx, edx

    mov ecx, [eax + 2] ;; se salveaza y1 si y2
    mov edx, [eax + 6]


x_not_equal:

    cmp cx, dx ;; se compara componetele diferite x1 x2 sau y1 y2
    jnl first_big ;; daca primul este mai mare sau egal decat al doilea sare la first_big

    xchg ecx, edx ;; daca nu se schimba valorile


first_big:

    sub ecx, edx ;; se scade din primul pe al doilea
    mov dx, cx ;; se salveaza shortul
    xor ecx, ecx ;; se reseteaza ecx
    movzx ecx, dx ;; se salveaza in ecx doar shortul
    

recall:



    add edi, 1 ;; edi se incrementeaza cu 1

    cmp edi, [ebp + 12] ;; daca edi == len (prima parcurgere), rezultatul se salveaza in ebx
    jne after
    mov [ebx], ecx

after:

    mov[ebx + 4], ecx ;; daca nu rezultatul se salveaza in ebx + 4
    add ebx, 4 ;; se incrementeaza ebx  cu 4

    sub edi, 1 ;; se decrementeaza edi (aducem la normal )
    xor edx, edx ;; se reseteaza registii
    xor ecx, ecx
    sub edi, 1 ;; se decrementeaza edi
    add eax, 4 ;; trecem la urmatorul punct
    jmp top ;; ne intoarcem la top

done:


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY