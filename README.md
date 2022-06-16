# DanielOlivaFootagePDAM

Repositorio para la aplicación de "Footage"

## Introducción

Se trata de una aplicación de compra y venta de productos futbolísticos. En ella existen usuarios "admin", que se encargan de la administración de la app en la parte web, y de usuarios "user", que son aquellos compradores o vendedores de la app móvil.

Esta app está implementada con Java en Spring Boot en el backend, con Flutter para la parte móvil del frontend y con Angular para la parte web del mismo.

## Puesta en funcionamiento

* ### Backend:

    Esta parte ya está en funcionamienta, ya que está desplegada en la plataforma Heroku. La URL es la siguiente:
    
    ```cmd
    https://api-footage.herokuapp.com/
    ```
    
    Así que si quisieras entrar en la documentación sería tan sencillo como pegar este enlace en su navegador favorito:
    
    ```cmd
    https://api-footage.herokuapp.com/swagger-ui/index.html
    ```
    
* ### Backend:

    * ### WEB:
    
        Para el funcionamiento de esta parte son necesarias varias intalaciones, que son las siguientes:
        
        * Un IDE que permita el uso de su lenguaje, por ejemplo Visual Studio Code.
        * Node.js, preferentemente la última versión.
        * Angular CLI, que se realiza escribiendo npm install -g @angular/cli en el terminal (después de realizar el paso anterior).
        
        Después de tener estas tres cosas instaladas, sería tan sencillo como escribir en el terminal, en la ruta del proyecto Angular, lo siguiente:
        
        ```cmd
        ng serve -o
        ```
        
    * ### MOBILE:
        
        Para el funcionamiento de esta parte son necesarias varias intalaciones, que son las siguientes:
        
        * Un IDE que permita el uso de su lenguaje, por ejemplo Visual Studio Code.
        * Los plugins Flutter, Flutter Widget Snippets, Awesome Flutter Snippets, Dart y dart-import.
        * SDK de Flutter, que se deberá descomprimir y colocar la carpeta de su interior llamada "flutter" en una carpeta src en la ruta de C:
        
        Una vez realizado esto habrá que indicarle al IDE cual es la ruta del SDK y ya se podría compilar ejecutando el archivo main.dart situado en la carpeta lib del         proyecto.
        
## Realizado por:

* ### Daniel Oliva
