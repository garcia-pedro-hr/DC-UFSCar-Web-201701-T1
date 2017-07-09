/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(   
    function () { 
     
   
    $(function () {
            var dic1 = {"nome" : "","quantidade" : "","preco" : "","tipo" : ""};
            $('#table').bootstrapTable('load', {
              undefinedText: 'n/a',
              data: [dic1]
            });

    });
    $('.createProduto').click(function () {        
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
                $('input.autocomplete').autocomplete({        
                data: new_json,          
                limit: 20, 
                onAutocomplete: function(val) {
                  // Callback function when value is autcompleted.     
                  $(function () {
                    console.log("hi")
                    var dic = [];
                    $('#table').bootstrapTable({
                      data: dic
                    });
                });
                  var nome = val;
           //       console.log(val)                   
                   $.ajax ({
                        url: getProduto,
                        data: {nomeProduto : nome},
                        success: function (resp) {
                             var dic = [resp];
                             console.log(dic)                            
                             $(function () {
                                $('#table').bootstrapTable('load', {
                                  undefinedText: 'n/a',
                                  data: dic
                                });
                            
                        });},
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
