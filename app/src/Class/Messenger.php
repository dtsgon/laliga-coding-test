<?php

namespace App\Class;

use App\Interface\TransporterInterface;
use App\Class\Message;


class Messenger
{
    public Message $message;

    public function __construct ( public TransporterInterface $transporter )
    {
        //
    }
    
    public function setMessage ( $message )
    {
        
    }
    
    public function addAddress ( $address )
    {
        // add address
    }
    
    public function send ( )
    {
        // lanza el send() del Transporter que
        // se haya pasado en el constructor
        $this->transporter->send ( /* $this->message */ );
    }
    
    public function someOtherFunction()
    {
        //
    }
}