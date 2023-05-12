Nuova repository Github

all'interno vi è solo la cartella modules così è più veloce fare gli aggiornamenti

Per settare è necessario compiere i seguenti step:
1- scaricare una versione di default di Witch e inserirla nella stessa cartella in cui c'è ECC-Project2
2- eliminare la cartella modules e data_witch17
3- aprire modules.gms e  sostituire la riga 6 con:
$set mp '../ECC-Project2/modules'
4- aprire run_witch17 e alla riga 27 sostituire con
$setglobal datapath '../ECC-Project2/data_%datapathext%/'

