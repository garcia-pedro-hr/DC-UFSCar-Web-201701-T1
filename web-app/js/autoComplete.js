/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $('.createProduto').click(function () {        
        var nome = $('#nome').val();
        
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
});


