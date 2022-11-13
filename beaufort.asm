%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    
    mov ebx, 0 ;; resetam ebx ca sa ne folosim de el
complete_key:
    mov al, byte[edx + ebx] ;; luam litera din cheie de pe pozitia ebx
    inc ebx ;; marim ebx cu 1
    mov [edx + ecx], al ;; mutam litera de la pozitia ebx la finalul key-ului
    add ecx, 1 ;; marim lungimea key-ului
    mov eax, [ebp + 8] ;; luam lugimea plai-ului
    cmp ecx, eax ;; comparam lungimea key-ului cu lungimea plain-ului
    jne complete_key ;; daca nu sunt egale continuam completarea

    mov al, 0 ;; putem terminatorul de sir la finalul key-ului
    mov [edx + ecx], al

    mov eax, [ebp + 8] ;; salvam lugimea plain-ului
    mov ebx, [ebp + 12] ;; reinitializam plai-ul

start_enc:

    mov al, byte[ebx] ;; luam litera din plain
    inc ebx ;; pregatim plai-ul pt urm litera

    cmp al, 0 ;; daca litera este terminatorul finalizam programul
    jz done

    mov ah, byte[edx] ;; luam litera din key
    inc edx ;; pregatim key-ul pt urm litera

    movzx ecx, al ; PLAIN

    movzx eax, ah ; KEY

    cmp eax, ecx ;; daca codul lui PLAIN este mai mare decat a lui KEY
    jnl diff ;; sare la diff
    xchg eax, ecx ;; daca nu se schimba valorile
    sub eax, ecx ;; se scade KEY din PLAIN pt a fi rez pozitiv
    mov ecx, eax ;; se schimba iar KEY si PLAIN pt diferenta
    mov eax, 26 ;; eax devine 26 

diff:
    sub eax, ecx ;; se scade KEY din PLAIN

    mov cl, 'A' ;; se adauga la codul lui 'A' rezultatul
    add cl, al


    mov [esi], cl ;; rezultatul este trecut in enc_string
    inc esi ;; se pregateste enc_string pt urm litera

    jmp start_enc ;; se intoarce la inceput

done:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
