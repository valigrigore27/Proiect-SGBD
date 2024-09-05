### [Video Link](https://drive.google.com/file/d/15VsYgPmpS-ywD_1R2Dup1qUTD56qOmuB/view?usp=drive_link)


### Proiectul: Gestionarea Mașinilor și Utilizatorilor

#### Descriere Generală:
Acest proiect este o aplicație pentru gestionarea unui sistem de închiriere mașini, în care utilizatorii pot închiria mașini, iar sistemul monitorizează detalii precum mașina închiriată, datele de închiriere, suma de plată, și orașul utilizatorilor. Aplicația implementează funcționalități de administrare a utilizatorilor și a mașinilor, utilizând baze de date și trigger-e pentru automatizarea anumitor operațiuni.

#### Baza de Date:
1. **Tabelul `useri`**:
   - Conține informații despre utilizatori, inclusiv un ID unic, numele de utilizator, parola, numele complet, e-mailul, orașul de reședință, ID-ul mașinii închiriate, data închirierii și suma de plată.

   **Structura tabelei:**
   - `id_user`: ID unic al utilizatorului.
   - `username`: Numele de utilizator.
   - `password`: Parola.
   - `name`: Numele complet.
   - `email`: E-mailul utilizatorului.
   - `city`: Orașul utilizatorului.
   - `id_car`: ID-ul mașinii închiriate.
   - `date_rented`: Data închirierii.
   - `to_pay`: Suma totală de plată.

2. **Tabelul `cars`**:
   - Conține detalii despre mașini, cum ar fi ID-ul, numele mașinii, anul fabricației, tipul de combustibil, transmisia, culoarea și taxele de poluare.

   **Structura tabelei:**
   - `id_car`: ID unic al mașinii.
   - `name`: Numele mașinii.
   - `year`: Anul fabricației.
   - `combustion`: Tipul de combustibil.
   - `transmission`: Tipul de transmisie.
   - `color`: Culoarea mașinii.
   - `pollution_taxes`: Taxele de poluare.

#### Proceduri Stocate:
1. **Procedura `car_discount`**:
   - Această procedură aplică un discount de 50 de unități la suma de plată (`to_pay`) pentru utilizatorii care au închiriat mașina cu ID-ul 3.
   
2. **Procedura `change_city`**:
   - Permite schimbarea orașului pentru un anumit utilizator, pe baza ID-ului său.

3. **Procedura `pollution_taxes_increase`**:
   - Această procedură crește taxele de poluare pentru toate mașinile fabricate înainte de 2010 cu 100 de unități.

4. **Procedura `delete_car`**:
   - Permite ștergerea unei mașini din baza de date, pe baza unui ID dat.

#### Trigger-e:
1. **Trigger-ul `trigger_username`**:
   - Se execută înainte de inserarea unui utilizator nou în tabelul `useri` și verifică dacă există deja un utilizator cu același nume de utilizator (`username`). Dacă există, aruncă o eroare și nu permite inserarea.

2. **Trigger-ul `trigger_delete_car`**:
   - Se execută înainte de ștergerea unei mașini din tabelul `cars`. Verifică dacă există mai multe instanțe ale acelei mașini (`id_car`); dacă există doar una, nu permite ștergerea și aruncă o eroare.

#### Funcționalități cheie:
1. **Inserarea și ștergerea utilizatorilor și mașinilor**.
2. **Actualizarea detaliilor utilizatorilor (de exemplu, orașul)**.
3. **Aplicarea de reduceri pentru utilizatorii care au închiriat anumite mașini**.
4. **Creșterea automată a taxelor de poluare pentru mașinile vechi**.
5. **Validarea numelui de utilizator înainte de adăugarea unui nou utilizator**.
6. **Restricționarea ștergerii mașinilor în anumite condiții**.


Acest proiect combină mai multe aspecte importante ale unei aplicații de gestionare a datelor, cum ar fi integrarea bazei de date, utilizarea trigger-elor și procedurilor stocate pentru automatizarea sarcinilor.
