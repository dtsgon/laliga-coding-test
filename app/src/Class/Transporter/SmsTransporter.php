<?php

namespace App\Class\Transporter;

use App\Class\Transporter;

class SmsTransporter extends Transporter
{
    const TRANSPORTER = 2;

    public function __construct ( )
    {  
        $this->metodo = self::TRANSPORTER;
    }
    
    // esta función delega en la del padre
    // no necesita existir
    // public function send()
    // {
    // }
}