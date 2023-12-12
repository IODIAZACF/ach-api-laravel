<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\MFormularios;
use App\Models\MKoboFormularios;
use App\Http\Controllers\helper;
use Illuminate\Http\Response;

//ini_set('internal_encoding', 'utf-8');

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/formularios_master', function (Request $request) {

    $body = [
        "NOMBRES",

        'ID_M_FORMULARIOS',
        //'email',
        //'password',
        "FECHA",
        "FECHA_REGISTRO",
        "ACCION",
        "UNICO",
        "BARCODE",
        "ID",
        "ID_EMPRESA",
        "CAMPO1",
        "CAMPO2",
        "CAMPO3",
        "CAMPO4",
        "CAMPO5",
        "ESTATUS",
        "VIA",
        "TIPO",
        "UID",
        "URL_DATA",
        "URL_CAMPOS",
        /* 
        */
        "COMENTARIOS",
        "GRUPO", 
        //relacionales
        "ID_M_CLIENTES",
        "ID_M_USUARIOS",
        "ID_M_AREAS",
    ];

    try {
        $results = [];
    
        $results = MFormularios::select($body)
        /*
        ->where(['ID_M_FORMULARIOS'=> '0012'])
         ->foreach($form=>{

        }) */
        ->get();
    
        //$results = helper::convert_from_latin1_to_utf8_recursively($results);
        return $results;
        //return $results[0];//mb_convert_encoding($results[0]['NOMBRES'], 'UTF-8', 'UTF-8');
        //return response(["message" => "Model status successfully updated!", "data" =>  json_encode($results->toArray())], 200);
    }catch(\Throwable $exception){
        return response()->json(['Error' => $exception->getMessage()]);
    }

});

Route::get('/formularios_kobo_master', function (Request $request) {

    $formulario = MKoboFormularios::with(
        ['localidad', 'usuario', 'area', 'master_f']
    );

    return $formulario->get();
});

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
