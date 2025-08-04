1. /*Afficher la liste des noms des focaccias par ordre alphabétique croissant*/

SELECT nom FROM focaccia ORDER BY nom ASC; 



2. /*Afficher le nombre total d'ingrédient*/

SELECT COUNT(*) FROM Ingredient



3./* Afficher le prix moyen des focaccias*/

SELECT AVG(prix) AS AveragePrice FROM focaccia; 



4. /*Afficher la liste des boissons avec leur marque, triée par nom de boisson*/

SELECT boisson.nom, marque.nom FROM boisson 
JOIN marque ON (boisson.Id_marque = marque.Id_marque)
ORDER BY boisson.nom ASC;



5. /*Afficher la liste des ingrédients pour une Raclaccia*/

SELECT ingrédient.nom FROM focaccia
JOIN comprend ON focaccia.Id_focaccia = comprend.Id_focaccia
JOIN ingrédient ON comprend.Id_Ingrédient = ingrédient.Id_Ingrédient
WHERE focaccia.nom = 'Raclaccia';



6. /*Afficher le nom et le nombre d'ingrédients pour chaque foccacia*/

SELECT focaccia.nom, COUNT(comprend.Id_Ingrédient) FROM focaccia 
JOIN comprend ON focaccia.Id_focaccia = comprend.Id_focaccia
GROUP BY focaccia.Id_focaccia, focaccia.nom;



8. /*Afficher la liste des focaccia qui contiennent de l'ail*/

SELECT focaccia.nom FROM focaccia 
JOIN comprend ON focaccia.Id_focaccia = comprend.Id_focaccia
JOIN ingrédient ON comprend.Id_Ingrédient = ingrédient.Id_Ingrédient
WHERE ingrédient.nom = 'Ail';



/*SCRIPS 7, 9 ET 10 NON REUSSIS ET LAISSE EN ATTENTE POUR UNE POTENTIEL EXPLICATION APRES CORRECTION*/