/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function soloLetras(e,txt){
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
    especiales = "8-37-39-46";

    tecla_especial = false;
    for(var i in especiales){
         if(key == especiales[i]){
             tecla_especial = true;
             break;
         }
     } 
    var res = txt.substring(1, 4);
     if((letras.indexOf(tecla)==-1 && !tecla_especial )|| (txt.substring(txt.length-2,txt.length)==tecla+tecla)
             ){
         return false;
     }
 }
  
  
function soloNumero(e,txt){
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = "0123456789";
    especiales = "8-37-39-46";

    tecla_especial = false;
    for(var i in especiales){
         if(key == especiales[i]){
             tecla_especial = true;
             break;
         }
     } 
    var res = txt.substring(1, 4);
     if((letras.indexOf(tecla)==-1 && !tecla_especial )){
         return false;
     }
 }

function caracteresCorreoValido(email, div){
    console.log(email);
    //var email = $(email).val();
    var caract = new RegExp(/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/);

  
    return caract.test(email);
     
}
  
  function listacategorias(tipo,parametro,receptor){
                $.ajax({
                    url: "lista1.htm",
                    type: 'POST',
                    data: {tipo:tipo,id:parametro},
                    success: function (data) {
                        document.getElementById(receptor).innerHTML=data;
                    }
                });
            }
 