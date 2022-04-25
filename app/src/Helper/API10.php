<?php

namespace App\Helper;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use App\Exception\SalaryException;
use App\Exception\InvalidClubException;

class API10 extends AbstractController
{
    public $class;
    public $persistObject;
    public $serializer;
    public $repository;
    public $em;
    public $mr;



    public function index ( Request $request ): JsonResponse
    {
        $collecction = $this->repository->findAll ( );

        return $this->createSerializedJSONResponse ( $collecction );
    }
    

    public function new ( Request $request ): JsonResponse
    {
        $object  = new $this->class ();
        $content = $request->getContent();
        $persist = $this->persistObject;

        try 
        {
            $persist ( $object, $content );
        }
        catch ( SalaryException $e )
        {
            return $this->createSerializedJSONResponse ( [], $e->getMessage() );
        }
        catch ( InvalidClubException $e )
        {
            return $this->createSerializedJSONResponse ( [], $e->getMessage() );
        }
                        
        $request->attributes->set ( "id", $object->getId ( ) );
        
        return $this->show ( $request );
    }


    public function show ( Request $request ): JsonResponse
    {
        $id          = $request->get ( "id" );
        $collecction = $this->repository->findBy ( [ 'id' => $id ] );

        return $this->createSerializedJSONResponse ( $collecction );
    }


    public function replace ( Request $request ): JsonResponse
    {
        $id          = $request->get ( "id" );
        $collecction = $this->repository->findBy ( [ 'id' => $id ] );
        $object      = $collecction [ 0 ];
        $content     = $request->getContent();
        $persist     = $this->persistObject;
        
        try 
        {
            $persist ( $object, $content );
        }
        catch ( SalaryException $e )
        {
            return $this->createSerializedJSONResponse ( [], $e->getMessage() );
        }
        catch ( InvalidClubException $e )
        {
            return $this->createSerializedJSONResponse ( [], $e->getMessage() );
        }

        return $this->show ( $request );
    }


    public function delete ( Request $request ): JsonResponse
    {
        $id          = $request->get ( "id" );
        $collecction = $this->repository->findBy ( [ 'id' => $id ] );
        $object      = $collecction [ 0 ];
        $content     = $request->getContent();

        //
        // 1er Mandamiento De Las BBDD: 
        //     NO SE BORRA NADA
        //
        $object->setActive ( 0 ); // Desactivo la fila. Así se considerará borrada
        
        $this->em->persist (  $object );
        $this->em->flush();
        
        return $this->show ( $request );
    }
    

    public function update ( Request $request ): JsonResponse
    {
        $id          = $request->get ( "id" );
        $collecction = $this->repository->findBy ( [ 'id' => $id ] );
        $object      = $collecction [ 0 ];
        $content     = $request->getContent();
        $persist     = $this->persistObject;

        try 
        {
            $persist ( $object, $content );
        }
        catch ( SalaryException $e )
        {
            return $this->createSerializedJSONResponse ( [], $e->getMessage() );
        }
        catch ( InvalidClubException $e )
        {
            return $this->createSerializedJSONResponse ( [], $e->getMessage() );
        }

        return $this->show ( $request );
    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    

    public function createSerializedJSONResponse ( $collection, $message = '' )
    {
        $serializer = $this->serializer;
        $data       = $serializer ( $collection );
        $array      =
        [
            'status'  => $data ? "👍" : "👎",
            'data'    => $data,
            'message' => $message,
        ];
        
        return new JsonResponse ( $array, Response::HTTP_CREATED );
    }
}
