<?php 

require __DIR__.'../../../vendor/autoload.php';

use App\Entidy\Gaiola;
use App\Entidy\Receber;
use App\Session\Login;

Login::requireLogin();

$usuariologado = Login:: getUsuarioLogado();

$usuario = $usuariologado['id'];


$contador = 0;
$soma = 0;

if(isset($_POST['rotas'])){

    foreach ($_POST['rotas'] as $contar) {
    
        $contador +=1;
        
    }

   foreach ($_POST['rotas'] as $key) {

    $soma = $_POST['qtd'] / $contador;

    $value = Gaiola:: getID('*','gaiolas',$key,null,null);

        $qtd  = $value->qtd;

        $calculado = ($qtd + $soma);

        $value->qtd = $calculado;

        $value->atualizar();


        $item = new Receber;
        $item->data            = $_POST['data'];
        $item->disponivel      = $soma;
        $item->qtd             = $soma;
        $item->clientes_id     = $_POST['clientes_id'];
        $item->setores_id      = $_POST['setores'];
        $item->servicos_id     = $_POST['servicos'];
        $item->usuarios_id     = $usuario;
        $item->gaiolas_id      = $key;
        $item->cadastar();
   }

   header('location: receber-list.php?status=success');
   exit;

}
   
   