<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Db\Pagination;
use App\Entidy\Ocorrencia;
use App\Entidy\Producao;
use App\Session\Login;

define('TITLE','Produção');
define('BRAND','Produção');

Login::requireLogin();

$usuariologado = Login:: getUsuarioLogado();

$usuario = $usuariologado['id'];

$buscar = filter_input(INPUT_GET, 'buscar', FILTER_UNSAFE_RAW);

$condicoes = [
    strlen($buscar) ? 'g.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%" 
    or 
    rt.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%"
    or 
    c.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%"
    or 
    e.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%"
    or 
    rg.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Producao:: getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 2000);

$listar = Producao::getList('
p.id AS id,
p.status AS status,
p.entregadores_id AS entregadores_id,
p.receber_id AS receber_id,
p.data AS data,
p.data_inicio AS data_inicio,
p.data_fim AS data_fim,
c.nome AS clientes,
e.apelido AS entregadores,
p.qtd AS qtd,
g.nome AS rota',
'producao AS p
INNER JOIN
receber AS r ON (p.receber_id = r.id)
INNER JOIN
gaiolas AS g ON (r.gaiolas_id = g.id)
INNER JOIN
entregadores AS e ON (p.entregadores_id = e.id)
INNER JOIN
clientes AS c ON (r.clientes_id = c.id) ','p.status = 1 AND p.usuarios_id='.$usuario, 'p.id DESC',$pagination->getLimit());

$ocorrencias = Ocorrencia :: getList('*','ocorrencias',null,'nome ASC');

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/producao/producao-form-list.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script>
$(document).ready(function(){
    $('.editbtn').on('click', function(){
        $('#editmodal').modal('show');

        $tr = $(this).closest('tr');

        var data = $tr.children("td").map(function(){
            return $(this).text();
        }).get();

        $('#id').val(data[0]);
        $('#entregadores_id').val(data[1]);
        $('#receber_id').val(data[2]);
        $('#data').val(data[3]);
        $('#data_inicio').val(data[4]);
        $('#data_fim').val(data[5]);
        $('#qtd').val(data[6]);
        $('#rota').val(data[7]);
        $('#regiao').val(data[8]);
        $('#clientes').val(data[9]);
        $('#entregadores').val(data[10]);
        $('#gaiolas').val(data[11]);
      
    ;
      
    });
});
</script>

<script>
$(document).ready(function(){
    $('.editbtn2').on('click', function(){
        $('#editmodal2').modal('show');

        $tr = $(this).closest('tr');

        var data = $tr.children("td").map(function(){
            return $(this).text();
        }).get();

        $('#id2').val(data[0]);
        $('#entregadores2_id').val(data[1]);
        $('#receber2_id').val(data[2]);
        $('#data').val(data[3]);
        $('#data_inicio').val(data[4]);
        $('#data_fim').val(data[5]);
        $('#qtd2').val(data[6]);
        $('#rota2').val(data[7]);
        $('#regiao2').val(data[8]);
        $('#clientes2').val(data[9]);
        $('#entregadores2').val(data[10]);
        $('#gaiolas2').val(data[11]);
    ;
    });
});
</script>

