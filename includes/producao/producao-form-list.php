<?php

$list = '';

$resultados = '';

$dia = '';
$cor = '';
$total = 0;
foreach ($listar as $item) {

    $total += $item->qtd;

    switch ($item->qtd) {
        case '10':
            $cor2 = "badge-warning";
            $qtd = "10";
            $msn = "Itens Pendentes";
            $disabled = "";
            break;

        case '9':
            $cor2 = "badge-warning";
            $qtd = "9 ";
            $msn = "Itens Pendentes";
            $disabled = "";
            break;

        case '8':
            $cor2 = "badge-warning";
            $qtd = "8";
            $msn = "Itens Pendentes";
            $disabled = "";
            break;


        case '7':
            $cor2 = "badge-warning";
            $qtd = "7";
            $msn = "Itens Pendentes";
            $disabled = "";
            break;


        case '6':
            $cor2 = "badge-warning";
            $qtd = "6";

            $msn = "Itens Pendentes";
            $disabled = "";
            break;


        case '5':
            $cor2 = "badge-danger";
            $qtd = "5";
            $msn = "Itens Pendentes";
            $disabled = "";
            break;
        case '4':
            $cor2 = "badge-danger";
            $qtd = "4";
            $msn = "Itens Pendentes";
            $disabled = "";
            break;

        case '3':
            $cor2 = "badge-danger";
            $qtd = "3";
            $msn = "Itens Pendentes";
            $disabled = "";
            break;

        case '2':
            $cor2 = "badge-danger";
            $qtd = "2";
            $msn = "Pendentes";
            $disabled = "";
            break;

        case '1':
            $cor2 = "badge-danger";
            $qtd = "1";
            $msn = "Item Pendente";
            $disabled = "";
            break;

        case '0':
            $cor2 = "badge-success";
            $qtd = "";
            $msn = "Entrega Concluida";
            $disabled = "disabled";
            break;

        default:
            $cor2 = "badge-light";
            $qtd = $item->qtd;
            $msn = "Itens p/ entregar";
            $disabled = "";
            break;
    }


    date_default_timezone_set('America/Sao_Paulo');

    $dat1 = date('Y-m-d');
    $data_formatada  = date('d/m/Y', strtotime($dat1));
    $dat2 = $item->data_fim;

    $data1 = strtotime($dat1);
    $data2 = strtotime($dat2);

    $data_final = ($data2 - $data1) / 86400;

    if ($data_final < 0) {
        $data_vencimento = $data_final * -1;
    }

    switch ($data_final) {

        case '-5':
            $cor = "badge-danger";
            $dia = "J?? se passaram 5 dias do vencimento...";
            break;
        case '-4':
            $cor = "badge-danger";
            $dia = "J?? se passaram 4 dias do vencimento...";
            break;
        case '-3':
            $cor = "badge-danger";
            $dia = "J?? se passaram 3 dias do vencimento...";
            break;

        case '-2':
            $cor = "badge-danger";
            $dia = "J?? se passaram 2 dias do vencimento...";
            break;

        case '-1':
            $cor = "badge-danger";
            $dia = "J?? se passou 1 dia do prazo de vencimento...";
            break;

        case '0':
            $cor = "badge-success";
            $dia = "Dia do vencimento...";
            break;

        case '1':
            $cor = "badge-danger";
            $dia = "Falta apenas 1 dia para o vencimento...";
            break;

        case '2':
            $cor = "badge-primary";
            $dia = "Faltam apenas 2 dias para o vencimento...";
            break;

        case '3':
            $cor = "badge-secondary";
            $dia = "Faltam apenas 3 dias para o vencimento...";
            break;

        case '4':
            $cor = "badge-info";
            $dia = "Faltam apenas 4 dias para o vencimento...";
            break;

        case '5':
            $cor = "badge-primary";
            $dia = "Faltam apenas 5 dias para o vencimento...";
            break;

        default:
            $cor = "badge-light";
            $dia = "" . date('d/m/Y ', strtotime($dat2)) . "";
            break;
    }


    $resultados .= '<tr>
                      <td style="display:none">' . $item->id . '</td>
                      <td style="display:none">' . $item->entregadores_id . '</td>
                      <td style="display:none">' . $item->receber_id . '</td>
                      <td style="display:none">' . $item->data . '</td>
                      <td style="display:none">' . $item->data_inicio . '</td>
                      <td style="display:none">' . $item->data_fim . '</td>
                      <td style="display:none">' . $item->qtd . '</td>
                      <td style="display:none">' . $item->rota . '</td>
                      <td style="display:none">' . $item->clientes . '</td>
                      <td style="display:none">' . $item->entregadores . '</td>
                      <td style="display:none">' . $item->receber_id . '</td>
                      
                      <td style="text-transform:uppercase">' . date('d/m/Y  ??\S  H:i:s', strtotime($item->data)) . '</td>
                      <td>
                      <h4>
                      <small class="badge badge-pill ' . $cor . '"><i class="far fa-clock"></i> &nbsp; &nbsp;' . $dia . '</small>
                      </h4>
                      </td>
                      <td style="text-transform:uppercase">' . $item->clientes . '</td>
                      <td style="text-transform:uppercase">' . $item->rota  . '</td>
                      <td style="text-transform:uppercase">' . $item->setores  . '</td>
                      <td style="text-transform:uppercase">' . $item->servicos  . '</td>
            
                      <td style="text-transform:uppercase"> <h5><span class="badge badge-pill badge-light"> <i class="fa fa-motorcycle" aria-hidden="true"></i> &nbsp;' . $item->entregadores . '</span></h5> </td>
                      <td style="text-align:center">
                      <h4>
                      <small class="badge badge-pill ' . $cor2 . ' ">' . $qtd . '&nbsp;' . $msn . '</small>
                      </h4>
                      </td>
                    
                      <td style="text-align: center;">
                        
                      <button type="submit" class="btn btn-primary editbtn" ' . $disabled . '> <i class="fa fa-arrow-left" aria-hidden="true"></i>
                      &nbsp; ENTREGAS </button>
                      &nbsp;
                      <button type="submit" class="btn btn-danger editbtn2" ' . $disabled . ' > <i class="fa fa-arrow-right" aria-hidden="true"></i> &nbsp; DEVOLU????ES </button>
                      
                      </td>
                      </tr>

                      ';
}

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="9" class="text-center" > Nenhuma produ????o at?? o momento !!!!! </td>
                                                     </tr>';


unset($_GET['status']);
unset($_GET['pagina']);
$gets = http_build_query($_GET);

//PAGINA????O

$paginacao = '';
$paginas = $pagination->getPages();

foreach ($paginas as $key => $pagina) {
    $class = $pagina['atual'] ? 'btn-primary' : 'btn-secondary';
    $paginacao .= '<a href="?pagina=' . $pagina['pagina'] . '&' . $gets . '">

                  <button type="button" class="btn ' . $class . '">' . $pagina['pagina'] . '</button>
                  </a>';
}

?>

<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card card-purple">
                    <div class="card-header">

                        <form method="get">
                            <div class="row ">
                                <div class="col-4">

                                    <label>Buscar </label>
                                    <input type="text" class="form-control" name="buscar" value="<?= $buscar ?>">

                                </div>


                                <div class="col d-flex align-items-end">
                                    <button type="submit" class="btn btn-warning" name="">
                                        <i class="fas fa-search"></i>

                                        Pesquisar

                                    </button>

                                </div>


                            </div>

                        </form>
                    </div>

                    <div class="table-responsive">

                        <table class="table table-bordered table-dark table-bordered table-hover table-striped">
                            <thead>

                                <tr>

                                    <th> DATA </th>
                                    <th style="text-align: center;"> PRAZO DE ENTREGA </th>
                                    <th> CLIENTES </th>
                                    <th> ROTAS </th>
                                    <th> SETORES </th>
                                    <th> SERVI??OS </th>
                                    <th> ENTREGADORES </th>
                                    <th style="text-align: center;"> QTD ITENS </th>

                                    <th style="text-align: center;"> A????O </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?= $resultados ?>
                            </tbody>
                            <tr>
                                <td class="direita qtd-40" colspan="7">
                                    <span>TOTAL DE ITENS PENDENTES PARA ENTREGA &nbsp;</span>
                                </td>
                                <td class="centro qtd-40 " colspan="1">
                                    <span style="color:#ffeb00"><?= $total ?></span>
                                </td>
                                <td colspan="2">

                                </td>
                            </tr>

                        </table>

                    </div>


                </div>

            </div>

        </div>

    </div>

</section>

<?= $paginacao ?>



<!-- EDITAR -->

<div class="modal fade" id="editmodal">
    <div class="modal-dialog modal-lg">
        <form action="../entrega/entrega-insert.php" method="POST">
            <div class="modal-content bg-light">
                <div class="modal-header">
                    <h4 class="modal-title">Entregas</h4>
                    <input type="hidden" name="producao_id" id="id">
                    <input type="hidden" name="entregadores_id" id="entregadores_id">
                    <input type="hidden" name="receber_id" id="receber_id">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">

                        <div class="col-6">

                            <div class="form-group">
                                <label>Data de entrega</label>
                                <input value="<?php
                                                date_default_timezone_set('America/Sao_Paulo');
                                                echo date('Y-m-d\TH:i:s', time()); ?>" type="datetime-local"
                                    class="form-control" name="data" required>
                            </div>

                        </div>

                        <div class="col-6">

                            <div class="form-group">
                                <label>Quantidade entregue</label>
                                <input style="text-transform: uppercase;" type="text" class="form-control" name="qtd"
                                    required autofocus>
                            </div>

                        </div>


                    </div>

                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary">Entregar
                    </button>
                </div>
            </div>
        </form>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<div class="modal fade" id="editmodal2">
    <div class="modal-dialog modal-lg">
        <form action="../devolucao/devolucao-insert.php" method="POST">
            <div class="modal-content bg-light">
                <div class="modal-header">
                    <h4 class="modal-title">Devolu????es</h4>
                    <input type="hidden" name="id2" id="id2">
                    <input type="hidden" name="entregadores2_id" id="entregadores2_id">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="row">

                        <div class="col-6">

                            <div class="form-group">
                                <label>Data da devolu????o</label>
                                <input value="<?php
                                                date_default_timezone_set('America/Sao_Paulo');
                                                echo date('Y-m-d\TH:i:s', time()); ?>" type="datetime-local"
                                    class="form-control" name="data" required>
                            </div>

                        </div>

                        <div class="col-6">

                            <div class="form-group">
                                <label>Quantidade devolvida</label>
                                <input style="text-transform: uppercase;" type="text" class="form-control" name="qtd"
                                    required>
                            </div>

                        </div>

                        <div class="col-12">

                            <div class="form-group">
                                <label>Ocorr??ncias</label>
                                <select class="form-control select" style="width: 100%;" name="ocorrencias_id" required>
                                    <option value=""> Selecione um ocorr??ncia</option>
                                    <?php

                                    foreach ($ocorrencias as $item) {
                                        echo '<option style="text-transform: uppercase;" value="' . $item->id . '">' . $item->nome . '</option>';
                                    }
                                    ?>

                                </select>

                            </div>

                        </div>


                    </div>

                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary">Devolver
                    </button>
                </div>
            </div>
        </form>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>