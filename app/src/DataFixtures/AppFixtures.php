<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // Nada aquí...
        // He preferido usar migraciones para la carga de datos


        // $product = new Product();
        // $manager->persist($product);

        $manager->flush();
    }
}
