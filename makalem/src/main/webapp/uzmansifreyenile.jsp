<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>
<body>

<h2>SIFRE YENILEME</h2>

<form action="sifreuzmanview.jsp" method="post">
  <div class="imgcontainer">
    <img src="https://icons-for-free.com/iconfiles/png/512/green+lock+privacy+safe+secure+security+icon-1320196713520107078.png" height="200" width="200" alt="Avatar">
  </div>

  <div class="container">
    <label for="uname"><b>KULLANICI ADI:</b></label>
    <input type="text" placeholder="Kullanici Adiniz..." name="kullanici" required>

    <label for="psw"><b>YENI SIFRE</b></label>
    <input type="password" placeholder="Yeni Sifrenizi Giriniz..." name="sifre" required>
        
    <button type="submit">KAYDET</button>
  </div>

  <div class="container" style="background-color:#f1f1f1">
  </div>
</form>

</body>
</html>
