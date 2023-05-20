function createNode(element) {
    return document.createElement(element);
}

function append(parent, el) {
    return parent.appendChild(el);
}

let magasins_ul = document.getElementById("data");
const url = "http://127.0.0.1:8080/ords/hr2/MAGASIN/";


fetch(url)
    .then((resp) => resp.json())
    .then(function (data) {
        let magasins = data.items;
       magasins.map(function(magasin){
            const imageUrl = "Images/image_magasin1.jpg";
            let divConteneur = createNode("div");
            divConteneur.classList.add("magasinsInfo");
            let div = createNode("div");
            let divImage = createNode("div");
            divImage.classList.add("divleft");
            div.classList.add("divRight");
            let image = createNode("img");
            image.setAttribute("src", imageUrl);
            append(divImage, image);
            append(divConteneur,divImage);

            let pNomMagasin = createNode("p");
            pNomMagasin.textContent = `Nom du Magasin: ${magasin.nom_magasin}`;

            append(div, pNomMagasin);





            append(divConteneur, div);
            append(magasins_ul, divConteneur);
            

    
        });
    
        /*let employees = data.items;//va chercher le résultat.items
        return employees.map(function (employee) {//parcours la liste des employes
            //le traitement de ma liste
            let li = createNode("li");//creer le pico li
            span = createNode("span");
            span.innerHTML = `${employee.empno} ${employee.ename}`;
            append(li, span);//ajout  sur le li le span
            append(empl_ul, li);
        })*/
    })
    .catch((error) => {
        //convertit l'erreur sous forme JSON
        console.log(JSON.stringify(error));
    })