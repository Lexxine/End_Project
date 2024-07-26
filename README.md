# Projekt: Aplikacja Dietetyczna do organizowania i wyszukiwania przepisów

## Opis projektu
Aplikacja dietetyczna z wykorzystaniem API Spoonacular, umożliwiająca użytkownikom przeglądanie, wyszukiwanie oraz filtrowanie przepisów kulinarnych, dostosowanych do różnych preferencji dietetycznych. Użytkownicy mogą także dodawać przepisy do ulubionych oraz tworzyć tablice i dodawać do nich przepisy znalezione w internecie.

**Cel projektu:** Ułatwienie użytkownikom codziennego planowania posiłków, organizowania znalezionych przepisów oraz promowanie zdrowego stylu życia.

## Funkcjonalności aplikacji

### Rejestracja i logowanie
- **Rejestracja użytkowników:** Umożliwia nowym użytkownikom założenie konta.
- **Logowanie użytkownika:** Umożliwia zalogowanie się na istniejące konto.

### Przeglądanie przepisów
- **Wyświetlanie losowych przepisów:** Aplikacja wyświetla użytkownikom losowe przepisy kulinarne z API Spoonacular na stronie głównej po zalogowaniu.
- **Zmienianie stron z przepisami:** Umożliwia przeglądanie kolejnych stron z przepisami.
- **Wyświetlanie wartości odżywczych:** Po najechaniu na dowolny przepis wyświetlane są wartości odżywcze na porcję.
- **Szczegóły przepisu:** Po kliknięciu na dowolny przepis użytkownik zostaje przekierowany do strony przepisu, gdzie może przeglądać szczegółowe informacje o wybranym przepisie, takie jak instrukcje przygotowania, składniki itp.

### Ulubione przepisy
- **Dodawanie do ulubionych:** Po najechaniu na przepis użytkownikowi wyświetla się ikona serca, po której kliknięciu wyświetla się modal wyboru tablicy, do której użytkownik chce zapisać przepis.

### Filtrowanie przepisów
- **Według rodzaju posiłku:** Umożliwia filtrowanie przepisów według rodzaju posiłku (śniadanie, obiad, kolacja, zupy, sałatki, przekąski).
- **Według typu diety:** Umożliwia filtrowanie przepisów według typu diety (wegetariańska, wegańska).
- **Wykluczanie alergenów:** Użytkownik może wykluczyć przepisy zawierające alergeny (nabiał, soja, orzechy ziemne, gluten itp.).

### Organizacja przepisów
- **Tworzenie tablic:** Użytkownik może tworzyć własne tablice, które będą ułatwiały organizację zapisanych przepisów.
- **Wyświetlanie tablic:** Na górze strony głównej są wyświetlane tablice dodane przez użytkownika.
- **Edycja tablic:** Umożliwia edycję nazw i opisów tablic.
- **Usuwanie tablic:** Umożliwia usuwanie stworzonych tablic.

### Zarządzanie przepisami w tablicach
- **Wyświetlanie przepisów:** Wyświetla zapisane z API przepisy w tablicach.
- **Edycja przepisów:** Umożliwia edycję zapisanych przepisów z API.
- **Usuwanie przepisów:** Umożliwia usuwanie zapisanych przepisów z API.

### Dodawanie własnych przepisów
- **Dodawanie przepisów:** Użytkownicy mogą dodawać linki z przepisami z YouTube’a, Instagrama itp. do tablic, aby łatwo móc je odnaleźć w przyszłości.
- **Wyświetlanie własnych przepisów:** Wyświetla własne przepisy w tablicach.
- **Edycja własnych przepisów:** Umożliwia edycję dodanych przez siebie przepisów.
- **Usuwanie własnych przepisów:** Umożliwia usuwanie dodanych przez siebie przepisów.

### Obsługa błędów
- **Specjalny widok dla błędów:** Wyświetla specjalny widok dla błędów z możliwością przekierowania do strony logowania.

### Wylogowanie
- **Wylogowanie:** Umożliwia wylogowanie się z aplikacji.
