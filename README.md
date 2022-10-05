# radasm

<?php
$entity_ids = \Drupal::entityQuery('type_pizza')
  ->condition('uuid', '3c351ced-7d6f-497d-a09c-e2a75ca19012', '=')
  ->execute();

$node_storage = \Drupal::entityTypeManager()->getStorage('type_pizza')->loadMultiple($entity_ids);
foreach ($node_storage as $node){
   $field_merchant_id = $node->get('title')->value;
print($field_merchant_id);
}

?>






<?php

$types = null;

    $entity_ids = \Drupal::entityQuery('type_pizza')
      ->execute();

    $node_storage = \Drupal::entityTypeManager()->getStorage('type_pizza')->loadMultiple($entity_ids);
    foreach ($node_storage as $node){

      $uuid= $node->get('uuid')->value;

      $title = $node->get('title')->value;
      $title = $node->get('title')->value;
      $about = $node->get('about')->value;
      $price = $node->get('price')->value;

      $types[$uuid]["title"] = $title;
      $types[$uuid]["about"] = $about;
      $types[$uuid]["price"] = $price;

    }

print($types["3c351ced-7d6f-497d-a09c-e2a75ca19012"]["title"] );

foreach ($types as $key) {
print($key["title"]);
  }
