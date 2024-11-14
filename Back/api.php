<?php
header("Content-Type: application/json");

$dsn = 'mysql:host=db;dbname=mydb;charset=utf8';
$username = 'root';
$password = 'root';

try {
    $conn = new PDO($dsn, $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($_SERVER['REQUEST_METHOD'] === 'GET') {
        // Obtener todos los productos
        $stmt = $conn->query("SELECT * FROM kebab");
        $productos = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($productos);
    } elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Crear un nuevo producto
        $input = json_decode(file_get_contents('php://input'), true);
        $stmt = $conn->prepare("INSERT INTO productos (idkebab, nombre, precio) VALUES (:idkebab, :nombre, :precio)");
        $stmt->bindParam(':idkebab', $input['idkebab']);
        $stmt->bindParam(':nombre', $input['nombre']);
        $stmt->bindParam(':nombre', $input['nombre']);
    $stmt->execute();
        echo json_encode(['status' => 'kebab creado']);
    }
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}

?>  