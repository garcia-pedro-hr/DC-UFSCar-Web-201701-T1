


$(document).ready(function () {
    var $clone = $('#venda-form-0');
    var counter = 0;

    $('#add-venda').click(function() {
        // increase counter
        counter = counter + 1

        // clone form and assign the new ID (i.e: from num 4 to ID "klon4")
        var $form = $clone.clone().prop('id', 'venda-form-' + counter);

        // append it before the add button
        $form.insertBefore($('#button-row'));

        // initialize it's materializecss select fields with some of the famous brazillian gambiarra
        var $select = $('#venda-form-' + counter + ' #produto-field .select-wrapper select').clone().removeClass('initialized');
        $('#venda-form-' + counter + ' #produto-field .select-wrapper').remove();
        $('#venda-form-' + counter + ' #produto-field').append($select);
        $('#venda-form-' + counter + ' #produto-field select').material_select();

        $select = $('#venda-form-' + counter + ' #funcionario-field .select-wrapper select').clone().removeClass('initialized');
        $('#venda-form-' + counter + ' #funcionario-field .select-wrapper').remove();
        $('#venda-form-' + counter + ' #funcionario-field').append($select);
        $('#venda-form-' + counter + ' #funcionario-field select').material_select();

        // reset the form
        $('#venda-form-' + counter + ' #produto').val(1);
        $('#venda-form-' + counter + ' #quantidade').val(0);
    });

    $('#submit-all').click(function() {
        // get starting index (in case of any deleted forms)
        var $first = $('div[id^="venda-form-"]:first');
        var $last = $('div[id^="venda-form-"]:last');
        var start = parseInt($first.prop('id').match(/\d+/g), 10);
        var end = parseInt($last.prop('id').match(/\d+/g), 10);

        // save values of every form to database
        for (var i = start; i < end + 1; i++) {
            if (!$('#venda-form-' + i).length) continue

            var user = $('#venda-form-' + i + ' #funcionario').val();
            var produto = $('#venda-form-' + i + ' #produto').val();
            var quantidade = $('#venda-form-' + i + ' #quantidade').val();

            // call controller
            $.ajax({
                type: 'POST',
                url: '/venda/saveOne',
                async: false,
                data: {
                    user : user,
                    produto: produto,
                    quantidade: quantidade
                },
                success: function (response) {
                    switch (response) {
                        case 'OK':
                            $('#venda-form-' + i).remove();
                            break;
                        case 'INDISPONIVEL':
                            var nomeProduto = $('#venda-form-' + i + ' #produto option:selected').text();
                            Materialize.toast(nomeProduto + ' indisponível', 10000);
                            break;
                        case 'INVALIDO':
                            var nomeProduto = $('#venda-form-' + i + ' #produto option:selected').text();
                            Materialize.toast('Quantidade indisponível de ' + nomeProduto, 10000);
                            break;
                        default:
                            break;
                    }
                },
                error: function (request, status, error) {
                    console.log(error);
                }
            });
        }
    });
});