                TEMA 2 IOCLA
            Dascalu Stefan-Teodor
                    314CC

-----------------------------------------------------------
                    TASK 1
                    
Timp de implementare: 2 ore

Programul preia pe rand literele din plain, incrementeaza adresa
pt a utiliza litera urmatoare. O mareste cu valoarea step-ului
daca rezultarul depaseste codul lui 'Z' (90), se scade valoarea
cu 26 (nr de literea de la A - Z), iar rezultatul este salvat
in enc_string.

-----------------------------------------------------------
                    TASK 2

2.1

Timp de implementare: 1 ora

Programul salveaza coordonatele punctelor (x1, y1, x2, y2) si apoi
verifica daca x, respectiv y sunt egali. Se efectueaza operatia
de scadere intre coordonata mai mare si cea mai mica (coordonatele
care nu sunt egale) si se returneaza rezultatul.

2.2

Timp de implementare: 3 ore

Programul salveaza in registul edi lungimea vectorului, se scade cu 1
acesta si se scade adresa lui ebx cu 4. Cat timp edi este mai mare decat
0 programul salveaza coordonatle x1/x2 sau y1/y2 (coordonatele care nu
sunt egale), analog 2.1 se calculeaza distanta dintre cele doua puncte,
se verifica daca este prima iterantie, daca este distanta este salvata
in prima adresa a lui ebx daca nu se va salva peste 4 bytes. 

2.3

Timp de implementare: 1 ora

Se decrementeaza vectorul de 1/0 cu 4. si se executa pt fiecare valoare
din vector algoritmul urmator. Fie edi(edi=0;edi < edx; edi ++), daca edi^2
este egal cu edx, atunci se salveaza in vectorul rezultat 1, daca nu 0.
Pt cazurile in care edx este 1 sau 0 se va salva 1 in vector.

-----------------------------------------------------------
                    TASK 3

Timp de implementare: 2 ore

In primul rand, programul completeaza key-ul (len de KEY == len de PLAIN), 
cat timp  lungimile sunt diferite se completeaza cu litere in ordine. Pt 
criptarea PLAIN-ului se utilizeaza urmtoarele relatii. Fie P (litera din PLAIN) si
K (litera din KEY) si E (litera criptata): daca K > P atunci E = K - P - 'A', daca
K < P, atunci E = 'Z' - (P - K).