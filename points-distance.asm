%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here


    xor eax, eax ;; se reseteaza registrii eax, ecx si edx
    xor ecx, ecx
    xor edx, edx

    mov ax, word [ebx] ;; se preia x1, y1, x2, y2
    mov dx, word [ebx + 2]
    mov cx, word [ebx + 4]
    mov bx, word [ebx + 6]


    cmp ax, cx ;; se verifica daca x1 si x2 sunt egali
    je x_equal ;; daca da sare la x_equal

    cmp dx, bx ;; se verifica daca y1 si y2 sunt egali
    je y_equal ;; daca da se sare la y_equal

x_equal:

    cmp dx, bx ;; se compara y1 si y2
    jg first_big_y ;; daca y1 > y2 sare la first_big_y

    xchg edx, ebx ;; daca nu y1 devine y2 si invers

first_big_y:

    sub dx, bx ;; se scade y2 din y1
    mov ax, dx ;; se muta valoarea in ax
    jmp done ;; sare la done

y_equal:

    cmp ax, cx ;; se compara x1 si x2
    jg first_big_x ;; daca x1 > x2 sare la first_big_x

    xchg eax, ecx ;; daca nu x1 devine x2 si invers

first_big_x:

    sub ax, cx ;; se scade x2 din x1
    jmp done ;; sare la done

done:
   
    mov edx, eax ;; se salveaza rezultatul in edx
    xor eax, eax ;; se reseteaza eax
    mov eax, [ebp + 12] ;; se ia de pe stiva destinatia
    mov [eax], edx ;; se muta rezultatul in destinatie

    xor ebx, ebx ;; se resereaza restul registrilor
    mov ebx, [ebp + 8]
    xor ecx, ecx
    xor edx, edx
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY