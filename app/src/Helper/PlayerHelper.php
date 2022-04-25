<?php

namespace App\Helper;

class PlayerHelper
{
    public static function Query_listarPorClub ( $filter, $entityManager, $class, $club_id, $itemsPerPage, $firstRestult )
    {
        $name       = $filter [ 'name' ]       ?? null;
        $salary     = $filter [ 'salary' ]     ?? null;
        $dorsal     = $filter [ 'dorsal' ]     ?? null;
        $birth_date = $filter [ 'birth_date' ] ?? null;
        $name       = $name       ? "%$name%"       : '-1';
        $salary     = $salary     ? "%$salary%"     : '-1';
        $dorsal     = $dorsal     ? "%$dorsal%"     : '-1';
        $birth_date = $birth_date ? "%$birth_date%" : '-1';
        $qb         = $entityManager->createQueryBuilder();
        $query      = $qb->select ( 'p' )
            ->from ( $class, 'p' )
            ->where ( 
                $qb->expr()->eq ( 'p.club', ':club_id' ),
                $qb->expr()->orX (
                    $qb->expr()->like ( 'p.name',       ':name'       ),
                    $qb->expr()->like ( 'p.salary',     ':salary'     ),
                    $qb->expr()->like ( 'p.dorsal',     ':dorsal'     ),
                    $qb->expr()->like ( 'p.birth_date', ':birth_date' ),
                )
            )
            ->setParameter   ( ':club_id',    $club_id    )
            ->setParameter   ( ':name',       $name       )
            ->setParameter   ( ':salary',     $salary     )
            ->setParameter   ( ':dorsal',     $dorsal     )
            ->setParameter   ( ':birth_date', $birth_date )
            ->setFirstResult ( $firstRestult )
            ->setMaxResults  ( $itemsPerPage )
            ->getQuery();

        return $query->getResult();
    }
}