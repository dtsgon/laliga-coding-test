<?php

namespace App\Helper;

use App\Repository\ManagerRepository;
use App\Repository\PlayerRepository;

class ClubHelper
{
    public static function calculoPresupuestoYSalarios ( $request, $managerRegistry ): array
    {
        $id                = $request->get ( "id" );
        $content           = $request->getContent();
        $decoded           = json_decode ( $content );
        $presupuesto       = $decoded->budget;
        $managerRepository = new ManagerRepository ( $managerRegistry );
        $playerRepository  = new PlayerRepository  ( $managerRegistry );
        $salariosManager   = $managerRepository->getTotalSalaries ( $id );
        $salariosPlayer    = $playerRepository->getTotalSalaries  ( $id );
        $totalSalarios     = $salariosManager + $salariosPlayer;

        return [ $presupuesto, $totalSalarios ];
    }
}