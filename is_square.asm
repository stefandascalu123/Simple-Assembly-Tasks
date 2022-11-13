%include "../include/io.mac"

section .data
    aux: db 0

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov ecx, [ebp + 12]     ; nr
    mov eax, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    sub eax, 4 ;; se decrementeaza eax cu 4
top:

    mov edx, [ebx] ;; se salveaza distanta

    mov edi, 0 ;; for(edi = 0; edi < edx; edi++)

check_square:

    cmp edi, edx ;; stop condition
    je stop_check_not

    mov [aux], edi ;; ne folosim de variabila aux pt salvarea valorii edi

    imul edi, edi ;; ridicam la patrat edi
    cmp edi, edx ;; daca edi^2 == edx sare la stop_check
    je stop_check

    mov edi, [aux] ;; daca nu edi se intoarce la normal
    inc edi ;; incrementam edi cu 1
    jmp check_square ;; ne intoarcem la inceput

stop_check:
    mov edx, 1 ;; edx devine 1 daca este patrat pefect
    jmp add_to ;; sare la adaugare

stop_check_not:
    cmp edx, 1 ;; daca edx este 1 sarim la stop_check
    je stop_check

    cmp edx, 0 ;; daca edx este 0 sarim la stop_check
    je stop_check
    
    mov edx, 0 ;; edx devine 0 daca nu este patrat perfect

add_to:

    mov [eax + 4], edx ;; adaugan 1/0 in eax + 4
    add eax, 4 ;; incrementam eax cu 4

loop_top:
    add ebx, 4 ;; incrementam ebx cu 4
    loop top ;; see executa de len ori

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY