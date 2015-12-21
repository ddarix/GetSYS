# GetSYS
Windows System Privileges Tool

Questo tool automatizza l'escalation dei privilegi su una macchina windows partendo da Administrator per diventare System.
Sfrutta vari servizi che vengono eseguiti con diritti di System e li sostituisce con un cmd.exe.

I servizi sfruttati sono:
Narrator.exe
Sethc.exe
Utilman.exe

In più utilizza delle modifiche al registro.

Queste opzioni sopra elencate saranno attive, una volta selzionate, eseguendo la disconnessione della sessione e vengono triggerate in modalità differenti:

Narrator per attivarlo cliccare sull'icona del servizio associato nella scheramta di login di windows
Utilman come sopra
Sethc per attivarlo nella schermata di login premere 5 volte shift

Poi ci sono le opzioni in tempo reale, attive sa subito che sfruttano psexec ed altre tecniche,

Infine lo script determina la versione di sistema operativo ed abilita o disabilita alcune opzioni in base al sistema rilevato
