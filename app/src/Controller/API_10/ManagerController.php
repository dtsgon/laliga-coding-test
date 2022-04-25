<?php

namespace App\Controller\API_10;

use App\Helper\API10;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use App\Repository\ManagerRepository;
use App\Entity\Manager;
use App\Exception\InvalidClubException;

#[Route('/API/1.0/manager')]
class ManagerController extends API10
{
    public function __construct (
        private EntityManagerInterface $entityManager, 
        private ManagerRegistry        $managerRegistry,
    )
    {
        // Powered by PHP 8.1 "in initializers" new feature. It makes
        // inneccesary to create and initilize the $this->repository variable

        $this->class      = Manager::class;
        $this->repository = new ManagerRepository ( $managerRegistry );
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
                    'id'           => $id,
                    'club'         => $value->getClub()?->getName(),
                    'name'         => $value->getName(),
                    'salary'       => $value->getSalary(),
                    'license_date' => $value->getLicenseDate(),
                    'active'       => $value->getActive(),
                    'created_at'   => $value->getCreatedAt(),
                    'update_at'    => $value->getUpdatedAt(),
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

            $object->setClub        ( $data );
            $object->setName        ( $decoded->name             ?? '' );
            $object->setSalary      ( (float) ( $decoded->salary ?? 0  ) );
            $object->setLicenseDate ( new \Datetime ( $decoded->license_date->date ?? NULL ) );
            $object->setActive      ( $decoded->active     ?? '0' );
            
            $this->entityManager->persist (  $object );
            $this->entityManager->flush();
        };
    }    


    #[Route("/", name: "API_10_manager_index", methods: ["GET"])]
    public function index ( Request $request ): JsonResponse
    {
        return parent::index ( $request );
    }
    
    
    #[Route("/", name: "API_10_manager_new", methods: ["POST"])]
    public function new ( Request $request ): JsonResponse
    {
        return parent::new ( $request );
    }


    #[Route("/{id}", name: "API_10_manager_show", methods: ["GET"])]
    public function show ( Request $request ): JsonResponse
    {
        return parent::show ( $request );
    }


    #[Route("/{id}", name: "API_10_manager_replace", methods: ["PUT"])]
    public function replace ( Request $request ): JsonResponse
    {
        return parent::replace ( $request );
    }


    #[Route("/{id}", name: "API_10_manager_delete", methods: ["DELETE"])]
    public function delete ( Request $request ): JsonResponse
    {
        return parent::delete ( $request );
    }
    

    #[Route("/{id}", name: "API_10_manager_update", methods: ["PATCH"])]
    public function update ( Request $request ): JsonResponse
    {
        return parent::update ( $request );
    }
}
