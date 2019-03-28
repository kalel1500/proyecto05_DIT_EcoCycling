$( document ).ready(function() {
    $("#usernamemail").focusout(function () {
        let inputValue = $.trim($("#usernamemail").val());
        checkInputUsrEmail();

        function checkInputUsrEmail() {

            if (inputValue == '' ) {
                printBlankError();
            }
        }

    });

    $("#passwordlog").focusout(function () {
        let inputValue = $.trim($("#passwordlog").val());
        checkInputPwdLog();

        function checkInputPwdLog() {

            if (inputValue == '' ) {
                printBlankError();
            }
        }

    });

    function printBlankError() {
        let printDiv = `
            <div id="contenedor-error-js">
            </div>
        `;
        let errorMessage = `
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Nombre de usuario y/o contraseña incorrectos.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
        `;

        if (!$("#contenedor-error-js").length) {
            $(".contenedor-registro").before(printDiv);
            $("#contenedor-error-js").append(errorMessage);
        }
    }
});