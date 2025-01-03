<?php

// Configuración de la base de datos
$host = 'db'; // Nombre del servicio del contenedor de la base de datos en docker-compose.yml
$db = 'proyectodocker';
$user = 'root';
$pass = 'root';
$charset = 'utf8mb4';

// Configurar DSN (Data Source Name)
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
//el options es opcional especifica detalles en la conexión de la bd
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

//Creo el objeto PDO
try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
}


$Request = $_SERVER['REQUEST_METHOD'];
switch ($Request){
    case 'GET':
    //metodología del GET
    //cogo el id de la petición
    $peticion = $_GET['id'];

    //ejecuto la consulta para coger los datos usando el PDO

    $stmt = $pdo->prepare('SELECT * FROM kebab WHERE idKebab = :id');
    $stmt->execute(['id' => $peticion]);
    $result = $stmt->fetch();

    //devuelvo los datos en json 
    echo json_encode($result);
    break;
}

















// /*codigo que manda la response */
// //cogemos el REQUEST_METHOD pertinente
// include '../controladores/ControlIngrediente.php';
// $request = $_SERVER['REQUEST_METHOD'];
// //Creo un objeto controlador que usare en el switch 
// $control = new controlIngrediente();

// function cogerDatos($cadena){
//     $resultado = null;
//     if(is_numeric($cadena)){
//         //es un numero
//         //cogemos la tupla de ese numero que es el id
//         $repoIngredientes = new RepoIngredientes();
//         $Ingrediente = $repoIngredientes->ingredienteCompletoPorId($cadena);
//         $resultado = $Ingrediente;

//     }elseif($cadena == 'todos'){
//         //es "todos"
//         //cogo todas las tuplas 
//         $repoIngredientes = new RepoIngredientes();
//         $Ingredientes[] = $repoIngredientes->ingredientesCompletos();
//         $resultado = $Ingredientes;

//     }
//     return $resultado;
// }

// function meterDatos($Obj){
//     //llamo al crear
//     $repo = new RepoIngredientes();
//     $datos = json_encode($Obj);
//     $arrayDatos = json_decode($datos,true);
//     // var_dump($arrayDatos);
//     $id = $arrayDatos['id'];
//     $nombre = $arrayDatos['nombre'];
//     $foto = $arrayDatos['foto'];
//     $precio = $arrayDatos['precio'];
//     $tipo = $arrayDatos['tipo'];
//     //inicializo el array alergenos 
//     $alergenos =[];
//     //meto los componenetes de $arrayDatos en $alergenos
//     $alergenos = array_merge($alergenos, $arrayDatos['alergenos']);

//     $repo->crear($id,$nombre,$foto,$precio,$tipo,$alergenos);
//     // echo"realizado satisfactoriamente";
// }

// function borrarDatos($id){
//     //llamo al repo
//     $repo = new RepoIngredientes();
//     //borramnos primero de la tabla de la rlacion y despues de la tabla de ingredientes
//     $repo->deleteIngredientes_has_alergenos($id);
//     $repo->delete($id);
//     // echo"realizado satisfactoriamente";
// }

// switch ($request) {
//     case 'GET':
//         $cadena = $_GET['id'];
//         var_dump($cadena);
//         // var_dump($cadena);
//         //Creo un objeto controlador
//         $tupla = $control->cogerDatos($cadena);
//         // var_dump($tupla);
//         // echo json_encode($tupla);
//         $jsonTupla = json_encode($tupla);
//         echo $jsonTupla;
//         break;
//     case 'POST':  
//         //me va a modificar y a crear el objeto 
//         $datos = json_decode(file_get_contents('php://input'),true);
//         //llamo al controlador para ya guardar en la base de datos 
//         json_encode($datos);
//        $control->meterDatos($datos);
       
//         break;
//     case 'DELETE':
//         //Va a borrar los datos 
//         $datos = json_decode(file_get_contents('php://input'),true);
//         $id= $datos['id'];
//         // json_encode($datos);
//         $control->borrarDatos($id);
//         break;

//     default:
//         throw new Exception("Error al procesar la Request");
        
// }

?>