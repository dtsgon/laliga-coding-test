<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/API')]
class APIController extends AbstractController
{
    #[Route('/', name: 'api_index', methods: ['GET'])]

    public function index(): Response
    {
        return $this->render('api.html.twig');
    }
}
