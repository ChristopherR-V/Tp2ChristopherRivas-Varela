function createNode(element) {
    return document.createElement(element);
}

function append(parent, el) {
    return parent.appendChild(el);
}

let divContenueAM = document.getElementById("contenueAutreMarchandise");


const url = "http://127.0.0.1:8080/ords/hr2/AUTREMARCHANDISE/";

fetch(url)
    .then((resp) => resp.json())
    .then(function (data) {
        let autreMarchandises = data.items;
        debugger;
        autreMarchandises.map(function(autreMarchandise){
            const imageShoppingCartUrl = "./Images/shopping-cart.png";

            let div = createNode("div");

            let imageShoppingCart = createNode("img");
            imageShoppingCart.classList.add("iconeAutreMarchandise");
            imageShoppingCart.setAttribute("src", imageShoppingCartUrl);

            let pType = createNode("p");
            let pDate = createNode("p");
            let pNomProduit = createNode("p");
            let pPrix = createNode("p");
            let pNomMagasin = createNode("p");

            
            pType.textContent = `Type de Marchandise: ${autreMarchandise.type_marchandise}`;

            if(autreMarchandise.date_peremption == null){
                pDate.textContent = `Date: ${autreMarchandise.date_peremption}`;
            } else {
                pDate.textContent = `Date: ${autreMarchandise.date_peremption.substr(0,10)}`;
            }    

            pNomProduit.textContent = `Nom du Produit: ${autreMarchandise.nom_produit}`;
            pPrix.textContent = `Prix: ${autreMarchandise.prix}`;
            pNomMagasin.textContent = `Nom du Magasin: ${autreMarchandise.nom_magasin}`;

            append(div, imageShoppingCart);
            append(div, pType);
            append(div, pDate);
            append(div, pNomProduit);
            append(div, pPrix);
            append(div, pNomMagasin);

            append(divContenueAM, div);

        });
    
    })
    .catch((error) => {
        console.log(JSON.stringify(error));
})
