<?php

namespace App\Helper;

use App\Class\Messenger;
use App\Class\Transporter;


class MessengerHelper
{
    public static function sendWelcomeMessage (  )
    { 
        $transporter = new Transporter;
        
        // envío por email
        $transporter->method ( 1 );
        $messenger = new Messenger ( $transporter ) ;

        // cosas de la bienvenida
        // cosas de la bienvenida
        // cosas de la bienvenida

        $messenger->setMessage ( "template BIENVENIDA y bla bla bla" );

        // idealmente este send lo añade a una cola RabbitMQ
        $messenger->send(); 
    }


    public static function sendGoodbyeMessage (  )
    {
        $transporter = new Transporter;

        // envío por SMS
        $transporter->method ( 2 ); 
        $messenger = new Messenger ( $transporter ) ;

        // cosas de la bienvenida
        // cosas de la bienvenida
        // cosas de la bienvenida

        $messenger->setMessage ( "template de GOODBYE" );

        // idealmente este send lo añade a una cola RabbitMQ
        $messenger->send(); 
    }
}