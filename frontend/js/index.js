/* ===================================== */
/* FROSTY DELIGHTS - index.js */
/* ===================================== */

document.addEventListener("DOMContentLoaded", () => {

    console.log("🍦 Frosty Delights cargado correctamente.");

    /* ========================= */
    /* MENÚ ACTIVO */
    /* ========================= */

    const enlaces = document.querySelectorAll(".nav-links a");

    enlaces.forEach(enlace => {
        enlace.addEventListener("click", function () {

            enlaces.forEach(item => item.classList.remove("activo"));
            this.classList.add("activo");

        });
    });

    /* ========================= */
    /* EFECTO EN BOTONES */
    /* ========================= */

    const botones = document.querySelectorAll("button, .btn-read");

    botones.forEach(boton => {

        boton.addEventListener("mouseenter", () => {
            boton.style.transform = "scale(1.05)";
        });

        boton.addEventListener("mouseleave", () => {
            boton.style.transform = "scale(1)";
        });

    });

    /* ========================= */
    /* EFECTO EN IMÁGENES */
    /* ========================= */

    const imagenes = document.querySelectorAll("img");

    imagenes.forEach(img => {

        img.addEventListener("mouseenter", () => {
            img.style.transition = "0.3s";
            img.style.transform = "scale(1.05)";
        });

        img.addEventListener("mouseleave", () => {
            img.style.transform = "scale(1)";
        });

    });

    /* ========================= */
    /* MENSAJE DEL FORMULARIO */
    /* ========================= */

    const formulario = document.querySelector(".contact-form");

    if (formulario) {

        formulario.addEventListener("submit", function (e) {

            e.preventDefault();

            alert("✅ Gracias por contactarnos. Tu información fue enviada correctamente.");

            formulario.reset();

        });

    }

    /* ========================= */
    /* NEWSLETTER */
    /* ========================= */

    const newsletter = document.querySelector(".footer-newsletter form");

    if (newsletter) {

        newsletter.addEventListener("submit", function (e) {

            e.preventDefault();

            const correo = this.querySelector("input[type='email']").value;

            if (correo === "") {

                alert("⚠ Debes ingresar un correo electrónico.");

                return;

            }

            alert("🎉 ¡Gracias por suscribirte a Frosty Delights!");

            this.reset();

        });

    }

});

/*=========================================
      FROSTY DELIGHTS - JAVASCRIPT
=========================================*/

document.addEventListener("DOMContentLoaded", () => {

    console.log("🍦 Frosty Delights cargado correctamente.");

    /*=========================================
            MENSAJE DE BIENVENIDA
    =========================================*/

    setTimeout(() => {
        alert("🍦 ¡Bienvenido a Frosty Delights!\nDisfruta nuestros deliciosos helados y promociones.");
    }, 800);


    /*=========================================
            SCROLL SUAVE DEL MENÚ
    =========================================*/

    document.querySelectorAll('a[href^="#"]').forEach(ancla => {

        ancla.addEventListener("click", function(e){

            e.preventDefault();

            const destino = document.querySelector(this.getAttribute("href"));

            if(destino){

                destino.scrollIntoView({
                    behavior:"smooth"
                });

            }

        });

    });


    /*=========================================
            EFECTO EN TARJETAS
    =========================================*/

    const tarjetas = document.querySelectorAll(".card, .promo-card");

    tarjetas.forEach(card=>{

        card.addEventListener("mouseenter",()=>{

            card.style.transform="translateY(-10px)";
            card.style.transition=".4s";

        });

        card.addEventListener("mouseleave",()=>{

            card.style.transform="translateY(0px)";

        });

    });


    /*=========================================
            EFECTO EN IMÁGENES
    =========================================*/

    const imagenes=document.querySelectorAll("img");

    imagenes.forEach(img=>{

        img.addEventListener("mouseover",()=>{

            img.style.transition=".3s";
            img.style.transform="scale(1.05)";

        });

        img.addEventListener("mouseout",()=>{

            img.style.transform="scale(1)";

        });

    });


    /*=========================================
            BOTONES
    =========================================*/

    const botones=document.querySelectorAll("button");

    botones.forEach(btn=>{

        btn.addEventListener("click",()=>{

            btn.style.transform="scale(.95)";

            setTimeout(()=>{

                btn.style.transform="scale(1)";

            },150);

        });

    });


    /*=========================================
            FORMULARIO DE CONTACTO
    =========================================*/

    const formulario=document.querySelector(".contact-form");

    if(formulario){

        formulario.addEventListener("submit",(e)=>{

            e.preventDefault();

            alert("✅ Gracias por contactarnos.\nMuy pronto responderemos tu mensaje.");

            formulario.reset();

        });

    }


    /*=========================================
            NEWSLETTER
    =========================================*/

    const newsletter=document.querySelector(".footer-newsletter form");

    if(newsletter){

        newsletter.addEventListener("submit",(e)=>{

            e.preventDefault();

            const email=newsletter.querySelector("input[type=email]").value;

            if(email===""){

                alert("⚠ Debes ingresar un correo.");

                return;

            }

            alert("🎉 ¡Gracias por suscribirte a Frosty Delights!");

            newsletter.reset();

        });

    }


    /*=========================================
            PROMOCIONES
    =========================================*/

    const promociones=document.querySelectorAll(".promo-card");

    promociones.forEach(promo=>{

        promo.addEventListener("click",()=>{

            alert("🍦 Promoción agregada.\nPregunta por ella en nuestra tienda.");

        });

    });


    /*=========================================
            CONTADOR DE VISITAS
    =========================================*/

    let visitas=localStorage.getItem("visitas");

    if(visitas==null){

        visitas=1;

    }else{

        visitas=parseInt(visitas)+1;

    }

    localStorage.setItem("visitas",visitas);

    console.log("Número de visitas:",visitas);


    /*=========================================
            BOTÓN VOLVER ARRIBA
    =========================================*/

    const subir=document.createElement("button");

    subir.innerHTML="⬆";

    subir.style.position="fixed";
    subir.style.bottom="20px";
    subir.style.right="20px";
    subir.style.width="50px";
    subir.style.height="50px";
    subir.style.borderRadius="50%";
    subir.style.border="none";
    subir.style.background="#ff4d6d";
    subir.style.color="white";
    subir.style.fontSize="20px";
    subir.style.cursor="pointer";
    subir.style.display="none";
    subir.style.zIndex="999";

    document.body.appendChild(subir);

    window.addEventListener("scroll",()=>{

        if(window.scrollY>300){

            subir.style.display="block";

        }else{

            subir.style.display="none";

        }

    });

    subir.addEventListener("click",()=>{

        window.scrollTo({

            top:0,
            behavior:"smooth"

        });

    });


    /*=========================================
            RELOJ
    =========================================*/

    function horaActual(){

        const fecha=new Date();

        console.log("Hora:",fecha.toLocaleTimeString());

    }

    setInterval(horaActual,1000);

});

/* ===========================================
   FROSTY DELIGHTS
   index.js
=========================================== */

document.addEventListener("DOMContentLoaded", function () {

    console.log("🍦 Frosty Delights cargado correctamente.");

    /*=========================
      MENSAJE DE BIENVENIDA
    =========================*/

    setTimeout(function () {
        alert("🍦 ¡Bienvenido a Frosty Delights!\nDisfruta nuestros deliciosos helados.");
    }, 1000);


    /*=========================
      MENÚ ACTIVO
    =========================*/

    const enlaces = document.querySelectorAll(".nav__links");

    enlaces.forEach(link => {

        link.addEventListener("click", function () {

            enlaces.forEach(item => item.classList.remove("activo"));

            this.classList.add("activo");

        });

    });


    /*=========================
      EFECTO EN TARJETAS
    =========================*/

    const tarjetas = document.querySelectorAll(".card, .promo-card, .fiesta-card");

    tarjetas.forEach(card => {

        card.addEventListener("mouseenter", () => {

            card.style.transition = ".4s";
            card.style.transform = "translateY(-10px)";

        });

        card.addEventListener("mouseleave", () => {

            card.style.transform = "translateY(0px)";

        });

    });


    /*=========================
      EFECTO EN IMÁGENES
    =========================*/

    const imagenes = document.querySelectorAll("img");

    imagenes.forEach(imagen => {

        imagen.addEventListener("mouseover", () => {

            imagen.style.transition = ".3s";
            imagen.style.transform = "scale(1.05)";

        });

        imagen.addEventListener("mouseout", () => {

            imagen.style.transform = "scale(1)";

        });

    });


    /*=========================
      BOTONES
    =========================*/

    const botones = document.querySelectorAll("button");

    botones.forEach(btn => {

        btn.addEventListener("click", () => {

            btn.style.transform = "scale(.95)";

            setTimeout(() => {

                btn.style.transform = "scale(1)";

            }, 150);

        });

    });


    /*=========================
      PROMOCIONES
    =========================*/

    const promociones = document.querySelectorAll(".promo-card");

    promociones.forEach(card => {

        card.addEventListener("click", () => {

            alert("🎉 ¡Promoción seleccionada!\nPregunta por ella en Frosty Delights.");

        });

    });


    /*=========================
      PAQUETES PARA FIESTAS
    =========================*/

    const fiestas = document.querySelectorAll(".fiesta-card");

    fiestas.forEach(card => {

        card.addEventListener("click", () => {

            alert("🎈 Gracias por tu interés.\nPronto nos comunicaremos contigo para organizar tu fiesta.");

        });

    });


    /*=========================
      FORMULARIO CONTACTO
    =========================*/

    const formulario = document.querySelector(".contact-form");

    if (formulario) {

        formulario.addEventListener("submit", function (e) {

            e.preventDefault();

            alert("✅ Gracias por contactarnos.");

            formulario.reset();

        });

    }


    /*=========================
      NEWSLETTER
    =========================*/

    const newsletter = document.querySelector(".footer__form");

    if (newsletter) {

        newsletter.addEventListener("submit", function (e) {

            e.preventDefault();

            const correo = this.querySelector(".footer__input").value;

            if (correo == "") {

                alert("⚠ Debes ingresar un correo.");

                return;

            }

            alert("🎉 Gracias por suscribirte a Frosty Delights.");

            this.reset();

        });

    }


    /*=========================
      CONTADOR DE VISITAS
    =========================*/

    let visitas = localStorage.getItem("visitas");

    if (visitas == null) {

        visitas = 1;

    } else {

        visitas++;

    }

    localStorage.setItem("visitas", visitas);

    console.log("Número de visitas:", visitas);


    /*=========================
      BOTÓN VOLVER ARRIBA
    =========================*/

    const boton = document.createElement("button");

    boton.innerHTML = "⬆";

    boton.style.position = "fixed";
    boton.style.right = "25px";
    boton.style.bottom = "25px";
    boton.style.width = "55px";
    boton.style.height = "55px";
    boton.style.border = "none";
    boton.style.borderRadius = "50%";
    boton.style.background = "#ff4d6d";
    boton.style.color = "white";
    boton.style.fontSize = "22px";
    boton.style.cursor = "pointer";
    boton.style.display = "none";
    boton.style.boxShadow = "0 5px 15px rgba(0,0,0,.3)";
    boton.style.zIndex = "999";

    document.body.appendChild(boton);

    window.addEventListener("scroll", function () {

        if (window.scrollY > 250) {

            boton.style.display = "block";

        } else {

            boton.style.display = "none";

        }

    });

    boton.addEventListener("click", function () {

        window.scrollTo({

            top: 0,
            behavior: "smooth"

        });

    });


    /*=========================
      RELOJ
    =========================*/

    function mostrarHora() {

        const ahora = new Date();

        console.log("Hora actual:", ahora.toLocaleTimeString());

    }

    setInterval(mostrarHora, 1000);

});