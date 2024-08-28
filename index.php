<?php
global $db;
require "settings/init.php";
?>
<!DOCTYPE html>
<html lang="da">
<head>
    <meta charset="utf-8">
    
    <title>Sports events</title>
    
    <meta name="robots" content="All">
    <meta name="author" content="Udgiver">
    <meta name="copyright" content="Information om copyright">
    
    <link href="css/styles.css" rel="stylesheet" type="text/css">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <div class="container">
        <div class="row g-4 mt-2">
            <?php
            $sportEvents = $db->sql("SELECT * FROM events ORDER BY evenDateTime ASC");
            foreach($sportEvents as $sportEvent) {
                ?>
                <div class="col-12 col-md-6">
                    <div class="card w-100">
                        <div class="card-header bg-primary text-light">
                            <?php
                            echo $sportEvent->evenName . " / " . $sportEvent->evenLocation;
                            ?>
                        </div>
                        <div class="card-body">
                            <?php
                            echo $sportEvent->evenDescription;
                            
                            echo "<div class='mt-2'><div class='badge bg-secondary fw-light py-2 px-3 text-dark' style='font-size: 14px;'>".date('\d. d-m-Y \k\l. H:i', strtotime($sportEvent->evenDateTime)) . "</div></div>";
                            ?>
                        </div>
                        <div class="card-footer text-muted text-center">
                            <a class="btn btn-primary text-light stretched-link" href="event.php?eventId=<?php echo $sportEvent->evenId; ?>" role="button">Læs mere</a>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>
        </div>
    </div>
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
