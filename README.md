\# Open WebUI - Script di Aggiornamento Automatico



Script Bash semplice e sicuro per aggiornare all'ultima versione \*\*Open WebUI\*\* (https://openwebui.com) mantenendo i dati persistenti e senza dover riscrivere ogni volta il comando `docker run`.



Ideale per chi usa Open WebUI in combinazione con Ollama su un server domestico (es. mini-PC, Raspberry Pi, NAS, ecc.).



\## Funzionalità



\- Ferma e rimuove il container esistente `open-webui`

\- Elimina la vecchia immagine Docker per liberare spazio

\- Scarica l'ultima versione di `ghcr.io/open-webui/open-webui:main`

\- Riavvia il container con la stessa configurazione precedente

\- Mantiene tutti i dati (modelli scaricati, chat, impostazioni) grazie al volume Docker `open-webui`



\## Prerequisiti



\- Docker installato e funzionante

\- Un'istanza di Ollama in esecuzione (nel mio caso all'indirizzo `http://192.168.178.27:11434`)

\- Porta 3000 libera sul tuo server (o cambiala nel comando se necessario)



\## Utilizzo



1\. Salva lo script con il nome che preferisci, ad esempio:



```bash

curl -o update-openwebui.sh https://raw.githubusercontent.com/tuo-utente/tuo-repo/main/update-openwebui.sh

