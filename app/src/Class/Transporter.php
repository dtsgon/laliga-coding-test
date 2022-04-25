<?php

namespace App\Class;

use App\Interface\TransporterInterface;

class Transporter implements TransporterInterface
{
    public function __construct ( )
    {
        // stuff
    }

    public function send ( )
    {
        // hace algo especifico y/o común de todos
        // y
        // lo añade a una cola de RabbitMQ
    }

    public function method ( $method )
    {

    }
}