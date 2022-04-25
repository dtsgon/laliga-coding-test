<?php

namespace App\Class\Transporter;

use App\Class\Transporter;

class WhatsappTransporter extends Transporter
{
    const TRANSPORTER = 3;

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