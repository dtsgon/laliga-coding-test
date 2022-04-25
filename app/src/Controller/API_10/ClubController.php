<?php

namespace App\Controller\API_10;

use App\Helper\API10;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use App\Repository\ClubRepository;
use App\Entity\Club;
use App\Exception\BudgetException;
use App\Helper\ClubHelper;

#[Route('/API/1.0/club')]
class ClubController extends API10
{
    public function __construct (
        private EntityManagerInterface $entityManager, 
        private ManagerRegistry        $managerRegistry,
    )
    {
        // Powered by PHP 8.1 "in initializers" new feature. It makes
        // inneccesary to create and initilize the $this->repository variable

        $this->class      = Club::class;
        $this->repository = new ClubRepository ( $managerRegistry );
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
                    'id'              => $id,
                    'name'            => $value->getName(),
                    'budget'          => $value->getBudget(),
                    'city'            => $value->getCity(),
                    'foundation_year' => $value->getFoundationYear(),
                    'active'          => $value->getActive(),
                    'created_at'      => $value->getCreatedAt(),
                    'update_at'       => $value->getUpdatedAt(),
                ];
            }

            return $return;
        };
        

        $this->persistObject = function ( $object, $content )
        {
            $decoded = json_decode ( $content );
    
            $object->setName           ( $decoded->name   ?? '' );
            $object->setBudget         ( $decoded->budget ?? '' );
            $object->setCity           ( $decoded->city   ?? '' );
            $object->setActive         ( $decoded->active ?? '0' );
            $object->setFoundationYear ( new \Datetime ( $decoded->foundation_year->date ?? NULL ) );
            
            $this->entityManager->persist (  $object );
            $this->entityManager->flush();
        };
    }


    #[Route("/", name: "API_10_club_index", methods: ["GET"])]
    public function index ( Request $request ): JsonResponse
    {
        return parent::index ( $request );
    }
    
    
    #[Route("/", name: "API_10_club_new", methods: ["POST"])]
    public function new ( Request $request ): JsonResponse
    {
        return parent::new ( $request );
    }


    #[Route("/{id}", name: "API_10_club_show", methods: ["GET"])]
    public function show ( Request $request ): JsonResponse
    {
        return parent::show ( $request );
    }


    #[Route("/{id}", name: "API_10_club_replace", methods: ["PUT"])]
    public function replace ( Request $request ): JsonResponse
    {
        return parent::replace ( $request );
    }


    #[Route("/{id}", name: "API_10_club_delete", methods: ["DELETE"])]
    public function delete ( Request $request ): JsonResponse
    {
        return parent::delete ( $request );
    }
    

    #[Route("/{id}", name: "API_10_club_update", methods: ["PATCH"])]
    public function update ( Request $request ): JsonResponse
    {
        try 
        {
            [ $presupuesto, $totalSalarios ] = ClubHelper::calculoPresupuestoYSalarios ( $request, $this->managerRegistry );

            if ( $presupuesto < $totalSalarios )
            {
                throw new BudgetException ( 'Invalid budget' );
            }
        }
        catch ( BudgetException $e )
        {
            return $this->createSerializedJSONResponse ( [ ], $e->getMessage() );    
        }

        return parent::update ( $request );
    }
}