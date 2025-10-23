<template>
  <nav>
    <ul>
      <li>
        <a href="https://t.me/DEU_UCV">
          <img src="..\assets\img\telegrama.png" alt="Telegram Icon" />
          <span>Telegram</span>
        </a>
      </li>
      <li>
        <a href="https://direcciondeextensionuniversitaria.blogspot.com/">
          <img src="..\assets\img\blogger.png" alt="Twitter Icon" />
          <span>Blog</span>
        </a>
      </li>
      <li>
        <a
          href="https://www.instagram.com/deuucv?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw=="
        >
          <img src="..\assets\img\instagram.png" alt="Instagram Icon" />
          <span>Instagram</span>
        </a>
      </li>
    </ul>
  </nav>
</template>

<style scoped>
* {
  margin: 0;
  padding: 0;
  list-style: none;
  text-align: none;
  box-sizing: border-box;
}
nav {
  position: fixed;
  width: 70px;
  margin-top: 150px;
  box-shadow: 2px 2px 8px 0 rgba(0, 0, 0.4);
}
nav li {
  height: 60px;
  position: relative;
}
nav li a {
  color: white;
  display: block;
  width: 100%;
  height: 100%;
  line-height: 60px;
  padding-left: 25%;
  border-bottom: 1px solid rgba(0, 0, 0.4);
  transition: all 0.3s linear;
}
nav li:nth-child(1) a {
  background: #33aade;
}
nav li:nth-child(2) a {
  background: #ff5722;
}
nav li:nth-child(3) a {
  background: #e1306c;
}
nav li a img {
  position: absolute;
  top: 16.5px;
  left: 20px;
  width: 27px;
  height: 27px;
}
nav li a span {
  font-weight: bold;
  letter-spacing: 1px;
  text-transform: uppercase;
  display: none;
}
a:hover {
  z-index: 1;
  width: 200px;
  border-bottom: 1px solid rgba(0, 0, 0.5);
  box-shadow: 0 0 1px 1px rgba(0, 0, 0.3);
}
ul li a:hover span {
  display: block;
  padding-left: 30%;
}
/* 🔹 Ajustes para dispositivos móviles */
@media (max-width: 700px) {
  nav {
    width: 50px; /* Más pequeña en móviles */
  }
  nav li {
    height: 40px; /* Elementos más compactos */
  }
  nav li a {
    padding-left: 15%;
    line-height: 40px; /* Ajusta la alineación del texto */
  }
  nav li a img {
    width: 20px; /* Íconos más pequeños */
    height: 20px;
    top: 10px;
    left: 15px;
  }

  nav:hover li a span {
    padding-left: 30px;
  }
}
</style>
