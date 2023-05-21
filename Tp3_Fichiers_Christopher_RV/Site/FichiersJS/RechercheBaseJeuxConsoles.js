function createNode(element) {
    return document.createElement(element);
}

function append(parent, el) {
    return parent.appendChild(el);
}

let div_JeuConsole = document.getElementById("divJeuConsole");

const urlJeu = "http://127.0.0.1:8080/ords/hr2/JEU/";

const urlConsole = "http://127.0.0.1:8080/ords/hr2/CONSOLE/";

fetch(urlJeu)
    .then((resp) => resp.json())
    .then(function (data) {

        let jeux = data.items;
        jeux.map(function(jeu){
            const imageJeuUrl = "./Images/Icone_jeu.png";

            let div = createNode("div");

            let imageJeu = createNode("img");
            imageJeu.classList.add("iconeJeuConsole");
            imageJeu.setAttribute("src", imageJeuUrl);

            let pTitreJeu = createNode("p");
            let pDateLancement = createNode("p");
            let pNomConsole = createNode("p");
            let pSerie = createNode("p");
            let pCategorieJeu = createNode("p");
            let pClassificationAge = createNode("p");
            let pPrix = createNode("p");
            let pNomMagasin = createNode ("p");

            pTitreJeu.textContent = `Titre du Jeu: ${jeu.titre_jeu}`;
            pDateLancement.textContent = `Date de Lancement: ${jeu.date_lancement.substr(0,10)}`
            pNomConsole.textContent = `Nom de la Console: ${jeu.nom_console}`;
            pSerie.textContent = `Serie: ${jeu.série}`;
            pCategorieJeu.textContent = `Catégorie de jeu: ${jeu.catégorie_jeu}`;
            pClassificationAge.textContent = `Clasification age: ${jeu.clasification_age}`;
            pPrix.textContent = `Prix: ${jeu.prix}`;
            pNomMagasin.textContent = `Nom du Magasin: ${jeu.nom_magasin}`;

            append(div,imageJeu);
            append(div,pTitreJeu);
            append(div,pDateLancement);
            append(div,pNomConsole);
            append(div,pSerie);
            append(div,pCategorieJeu);
            append(div,pClassificationAge);
            append(div,pPrix);
            append(div,pNomMagasin);

            append(div_JeuConsole,div);

        });
    
    })
    .catch((error) => {
        console.log(JSON.stringify(error));
})

fetch(urlConsole)
    .then((resp) => resp.json())
    .then(function (data) {
        let consoles = data.items;
        debugger;
        consoles.map(function(console){
            const imageConsoleUrl = "./Images/Icone_Console.png";

            let div = createNode("div");

            let imageConsole = createNode("img");
            imageConsole.classList.add("iconeJeuConsole");
            imageConsole.setAttribute("src", imageConsoleUrl);

            let pNomConsole = createNode("p");
            let pDateLancement = createNode("p");
            let pFpsMax = createNode("p");
            let pPrix = createNode("p");
            let pMarque = createNode("p");
            let pNomMagasin = createNode("p");

            pNomConsole.textContent = `Nom console: ${console.nom_console}`;
            pDateLancement.textContent = `Date de Lancement: ${console.date_lancement.substr(0,10)}`;
            pFpsMax.textContent = `Fps Max: ${console.fps_max}`;
            pPrix.textContent = `Prix: ${console.prix}`;
            pMarque.textContent = `Marque: ${console.marque}`;
            pNomMagasin.textContent = `Nom du Magasin: ${console.nom_magasin}`;

            append(div,imageConsole);
            append(div,pNomConsole);
            append(div,pDateLancement);
            append(div,pFpsMax);
            append(div,pPrix);
            append(div,pMarque);
            append(div,pNomMagasin);

            append(div_JeuConsole,div);


        });
    
    })
    .catch((error) => {
        console.log(JSON.stringify(error));
})



