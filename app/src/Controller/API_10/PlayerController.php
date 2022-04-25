<?php

namespace App\Controller\API_10;

use App\Helper\API10;
use App\Helper\PlayerHelper;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use App\Repository\PlayerRepository;
use App\Entity\Player;
use App\Exception\InvalidClubException;

#[Route('/API/1.0/player')]
class PlayerController extends API10
{
    public function __construct (
        private EntityManagerInterface $entityManager, 
        private ManagerRegistry        $managerRegistry,
    )
    {
        // Powered by PHP 8.1 "in initializers" new feature. It makes
        // inneccesary to create and initilize the $this->repository variable

        $this->class      = Player::class;
        $this->repository = new PlayerRepository ( $managerRegistry );
        $this->em         = $entityManager;
        $this->mr         = $managerRegistry;

        $this->serializer = function ( $collection )
        {
            $return = [ ];

            foreach ( $collection as $value )
            {
                $id = $value->getId ( );
                $return [ $id ] =
                [
                    'id'         => $id,
                    'club'       => $value->getClub()?->getName(),
                    'name'       => $value->getName(),
                    'salary'     => $value->getSalary(),
                    'dorsal'     => $value->getDorsal(),
                    'birth_date' => $value->getBirthDate(),
                    'active'     => $value->getActive(),
                    'created_at' => $value->getCreatedAt(),
                    'update_at'  => $value->getUpdatedAt(),
                ];
            }

            return $return;
        };


        $this->persistObject = function ( $object, $content )
        {
            $decoded    = json_decode ( $content );
            $id         = $decoded->club;
            $repository = new \App\Repository\ClubRepository ( $this->managerRegistry );
            $data       = $repository->findBy ( [ 'id' => $id ] ) [0] ?? false;

            if ( !$data )
            {
                throw new InvalidClubException ( 'Invalid club' );
            }

            $object->setClub      ( $data );
            $object->setName      ( $decoded->name             ?? '' );
            $object->setSalary    ( (float) ( $decoded->salary ?? 0  ) );
            $object->setDorsal    ( (int)   ( $decoded->dorsal ?? NULl )) ;
            $object->setBirthDate ( new \Datetime ( $decoded->birth_date->date ?? NULL ) );
            $object->setActive    ( $decoded->active     ?? '0' );
            
            $this->entityManager->persist (  $object );
            $this->entityManager->flush();
        };
    }    


    #[Route("/", name: "API_10_player_index", methods: ["GET"])]
    public function index ( Request $request ): JsonResponse
    {
        return parent::index ( $request );
    }
    
    
    #[Route("/", name: "API_10_player_new", methods: ["POST"])]
    public function new ( Request $request ): JsonResponse
    {
        return parent::new ( $request );
    }


    #[Route("/{id}", name: "API_10_player_show", methods: ["GET"])]
    public function show ( Request $request ): JsonResponse
    {
        return parent::show ( $request );
    }


    #[Route("/{id}", name: "API_10_player_replace", methods: ["PUT"])]
    public function replace ( Request $request ): JsonResponse
    {
        return parent::replace ( $request );
    }


    #[Route("/{id}", name: "API_10_player_delete", methods: ["DELETE"])]
    public function delete ( Request $request ): JsonResponse
    {
        return parent::delete ( $request );
    }
    

    #[Route("/{id}", name: "API_10_player_update", methods: ["PATCH"])]
    public function update ( Request $request ): JsonResponse
    {
        return parent::update ( $request );
    }


    #[Route("/club/{club_id}/{page}", name: "API_10_player_listarPorClub", methods: ["POST"])]
    public function listarPorClub ( Request $request, int $page = 1 ): JsonResponse
    {
        $club_id = $request->get ( "club_id" );
        $page    = $request->get ( "page" );
        $content = $request->getContent ( );
        $decoded = json_decode ( $content, true );
        $filter  = [ $decoded ['filter'] ] [ 0 ] ?? NULL;
        
        $itemsPerPage = 3; // sería mejor si lo guardo en un archivo de configuración pero el tiempo se me echa encima :(
        $firstRestult = ( $page - 1 ) * $itemsPerPage;

        $collection = PlayerHelper::Query_listarPorClub ( $filter, $this->entityManager, $this->class, $club_id, $itemsPerPage, $firstRestult );

        return $this->createSerializedJSONResponse ( $collection );
    }    
}
