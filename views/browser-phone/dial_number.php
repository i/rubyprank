<?php
header('Content-type: text/xml');
?>
<Response>
<Dial callerId="NNNNNNNNNN"><?php echo htmlspecialchars($_REQUEST["tocall"]); ?></Dial>
</Response>
