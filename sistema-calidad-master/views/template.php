<?php require "views/modules/header/header.php" ?>
        <?php if (isset($_GET['action'])) {
            if ($_GET['action'] !== 'ingreso' and $_GET['action'] !== 'robot') {
                require "views/modules/header/menu.php";
            }
        }?>
            <div class="container-fluid">
            <?php
                $mvc = new MvcController();
                $mvc->enlacesPaginasController();
            ?>
            </div>
        <?php if (isset($_GET['action'])) {
            if ($_GET['action'] !== 'ingreso' and $_GET['action'] !== 'robot') {
            require "views/modules/header/footer.php";
            }
        }?>

        <script src="views/bootstrap/js/app.js"></script>
        <script src="views/bootstrap/js/validarUsuario.js"></script>
        <script src="views/bootstrap/js/claseMenu.js"></script>
        <script>
            $(document).ready(function(){
                $("#form-validate").submit(function(){
                    return $(this).validate();
                });
            })
        </script>
    </body>
</html>

