<?php

namespace App\Class\Transporter;

use App\Class\Transporter;

class EmailTransporter extends Transporter
{
    const TRANSPORTER = 1;

    public function __construct ( )
    {  
        $this->metodo = self::TRANSPORTER;
    }

    public function send()
    {
        // hace algo especifico de Email
        // y
        // lo añade a una cola de RabbitMQ
    }
}