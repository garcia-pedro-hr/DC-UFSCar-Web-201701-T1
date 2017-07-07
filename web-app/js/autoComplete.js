/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(   
    function () { 
   
    var produto = $('.createProduto').click(function () {        
        var nome = $('#nome').val();   
        console.log()
        $.ajax ({
            url: produtoLink,
            data: {nomeProduto : nome},
            success: function (resp) {
                console.log(resp);
                $('.form').submit();
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                console.log(errorThrown);
                console.log(produtoLink);
            }
        });
    });
    
     $.ajax ({
            url: listaLink,
            data: {},
            success: function (resp) {
                json = resp;
                var new_json = {}
                for(var i=0; i<json.length; i++)
                {
                    new_json[json[i]] = null;
                }
                var s = $('input.autocomplete').autocomplete({        
                data: new_json,          
                limit: 20, 
                onAutocomplete: function(val) {
                  // Callback function when value is autcompleted.     
                  var nome = val;
                   
                   $.ajax ({
                        url: getProduto,
                        data: {nomeProduto : nome},
                        success: function (resp) {
                            console.log(resp);
                            
                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown) {
                            console.log(errorThrown);
                            console.log(getProduto);                  

                }});},
                minLength: 1, // The minimum length of the input for the autocomplete to start. Default: 1.
              });
          
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                console.log(errorThrown);
                console.log(produtoLink);
            }
    });
});
