%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

top:

    mov al, byte[esi] ;; se muta prima litera din plain in al
    inc esi ;; se incrementeaza plain si se pregateste pt urm litera
    cmp al, 0 ;; se verifica daca litera preluata este terminatorul de sir
    jz done ;; daca este terminatorul de sir se iese din program
    
    add al, dl ;; se creste litera cu step-ul

    cmp al, 0x5A ;; se compara rezultatul cu 'Z'
    jng add_enc ;; daca  nu este mai mare sare la add_enc
    sub al, 0x1A ;; daca  este se scade litera cu 26 (nr de litere din alfabet)

add_enc:

    mov [edi],al ;; se muta litera in enc_string
    inc edi ;; se pregateste enc_string pt adaugarea literii urmatoare

    jmp top ;; se intoarce la top
done:


    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
